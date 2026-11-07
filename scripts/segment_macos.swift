import Foundation
import Vision
import CoreImage
import ImageIO
import UniformTypeIdentifiers

func fail(_ message: String) -> Never {
    fputs(message + "\n", stderr)
    exit(2)
}

if #available(macOS 14.0, *) {
    guard CommandLine.arguments.count == 3 || CommandLine.arguments.count == 5 else {
        fail("USAGE: segment_macos.swift source.png mask.png [normalized_x normalized_y]")
    }
    let sourceURL = URL(fileURLWithPath: CommandLine.arguments[1])
    let outputURL = URL(fileURLWithPath: CommandLine.arguments[2])
    do {
        let handler = VNImageRequestHandler(url: sourceURL, options: [:])
        let request = VNGenerateForegroundInstanceMaskRequest()
        try handler.perform([request])
        guard let result = request.results?.first, !result.allInstances.isEmpty else {
            fail("NO_SUBJECT: Vision found no foreground instance.")
        }
        let selected: Int
        if CommandLine.arguments.count == 5 {
            guard let nx = Double(CommandLine.arguments[3]), let ny = Double(CommandLine.arguments[4]),
                  nx.isFinite, ny.isFinite, nx >= 0, nx <= 1, ny >= 0, ny <= 1 else {
                fail("INVALID_SUBJECT_POINT: Expected normalized x,y from the top-left.")
            }
            let labels = result.instanceMask
            CVPixelBufferLockBaseAddress(labels, .readOnly)
            let width = CVPixelBufferGetWidth(labels), height = CVPixelBufferGetHeight(labels)
            let stride = CVPixelBufferGetBytesPerRow(labels)
            let pixels = CVPixelBufferGetBaseAddress(labels)!.assumingMemoryBound(to: UInt8.self)
            selected = Int(pixels[min(height - 1, Int(ny * Double(height))) * stride + min(width - 1, Int(nx * Double(width)))])
            CVPixelBufferUnlockBaseAddress(labels, .readOnly)
            guard selected > 0, result.allInstances.contains(selected) else {
                fail("SUBJECT_POINT_BACKGROUND: The point does not select a foreground instance.")
            }
        } else {
            guard result.allInstances.count == 1 else {
                fail("MULTIPLE_SUBJECTS: Vision found \(result.allInstances.count) instances. Set subject_point to select one.")
            }
            selected = result.allInstances.first!
        }
        let mask = try result.generateScaledMaskForImage(forInstances: IndexSet(integer: selected), from: handler)
        let image = CIImage(cvPixelBuffer: mask)
        try CIContext().writePNGRepresentation(of: image, to: outputURL, format: .L8, colorSpace: CGColorSpaceCreateDeviceGray())
        let report: [String: Any] = ["selected_instance": selected, "instance_count": result.allInstances.count,
            "mask_width": CVPixelBufferGetWidth(mask), "mask_height": CVPixelBufferGetHeight(mask)]
        print(String(data: try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]), encoding: .utf8)!)
    } catch {
        fail("SEGMENTATION_FAILED: \(error)")
    }
} else {
    fail("MACOS_TOO_OLD: Foreground instance masks require macOS 14 or later. Supply an external mask.")
}
