---
name: redthread
description: Create or revise a Redthread portrait collage with Seedream 5.0 Pro, using two equal panels, a glowing upper silhouette, a matching real lower subject, bilingual handwriting, textured paper, and one wine-red thread.
---

# Redthread

Create one finished 3:4 portrait collage from the user's photo. Preserve the established visual design while letting Seedream 5.0 Pro generate the full composition, including text, thread, paper treatment, lighting, and layout.

## Workflow

For a revision of an existing collage, inspect that collage first and go directly to the targeted-correction prompt. Use the current collage as Image 1, not as a style-only reference. Preserve correct wording, subject, layout, and anchors. Supply the original photo or paper only when the correction needs them. Skip new wording and a full initial generation unless the user requests a redesign.

1. Inspect the source photo. Identify the subject, important props, scene, muted theme color, and a visible little-finger anchor. If no little finger is identifiable, select a clear contour tip visible in the source. Use the same point in both panels.
2. Read [the visual specification](references/style-spec.md) and [the prompt template](references/model-prompt.md). Select three or four short English fragments and two Japanese thoughts that suit this photo. Describe the intended layout and anchor briefly.
3. Supply the original photo and `assets/paper/theme-fiber-paper.jpg` as model image references. Reuse an available subject cutout if it helps preserve shape. Otherwise, use a segmentation tool only when needed. A previous collage may be an optional reference for layout and handwriting; do not copy its person, scene, or defects. Specify the face, text, and prop regions the thread must avoid.
4. Use the host's configured **Seedream 5.0 Pro** endpoint and credentials. Read [provider notes](references/seedream-provider.md) when making the request. Generate the whole final image in one request using the filled prompt and clearly identified reference roles.
5. Inspect the returned image at full detail and at a small on-screen viewing scale. Check the visual gate below. For a visible defect, use a targeted edit from the same model. Normally allow up to two corrective edits. If both repeat or worsen the same defect, allow one fresh generation from the original references, omitting the defective composition. Stop on an unresolved provider failure or an uncertain request outcome. Report remaining defects honestly instead of silently changing models or switching to programmatic composition.
6. Save and show one inspected final PNG. Keep cutouts, masks, requests, and alternate attempts in the task's private `work/` directory. Put only the selected final image in `outputs/`. Do not expose intermediate images unless the user asks for them.

## Execution boundary

- Only segmentation or subject cutout may use an extra image-processing tool. Its output is a model reference, not a layer to composite with code.
- All visible content and revisions must come from Seedream 5.0 Pro. Do not draw text or paths, recolor paper, assemble layers, apply filters, resize, crop, or repair the output with scripts or a graphics compositor.
- Ordinary API requests, byte-for-byte image storage, PNG metadata checks, and image viewing are allowed. These operations transfer or inspect an image; they do not create or alter its visible content.
- Request the intended 3:4 size and PNG format from the provider. If the result has the wrong size, correct the model request. Do not resize the file as a workaround.
- The bundled font and former connector templates are historical design references. Do not run a font renderer, glyph checker, paper recolorer, connector renderer, or legacy compositor.
- Do not promise exact font loading, identical RGBA pixels, or deterministic paper reconstruction. Judge visual fidelity from the actual generated image.
- If the required model or paper reference is unavailable, report the missing input or failed request. Do not silently substitute another model, paper, or procedural renderer.
- Do not include private source photos, cutouts, or past user collages in a redistributed skill package.

## Visual gate

- Exact 3:4 canvas; clean horizontal split into equal upper and lower panels.
- Upper panel keeps the source environment and has a warm cream-white glowing silhouette of the subject.
- Lower panel has the same recognizable subject, pose, contour, and apparent size, with faithful face, hands, clothing, and props.
- Lower paper visibly follows the bundled paper reference, with muted scene-derived color, fibers, strands, and natural marks.
- Three or four legible English fragments stay inside the upper silhouette. Two legible Japanese thoughts sit near opposite sides of the lower subject at the same apparent letter size.
- Lettering evokes DartsFont's informal handwriting. The lettering and thread share a restrained wine-red accent.
- One continuous, fine colored-pencil thread connects the corresponding anchors. It has three to five loose, unevenly spaced curls and avoids faces, lettering, and important props.
- No extra subject, duplicate limb, cropped essential prop, blank edge, malformed text, or watermark is visible.

Read [font and license notes](references/font-and-license.md) for lettering changes or redistribution, [paper notes](references/fixed-paper.md) for paper revisions, and [connector notes](references/connector-templates.md) for thread revisions. The inspected image is the final deliverable; no later filter pass is required.
