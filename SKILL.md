---
name: redthread-classic-simple
description: 将一张照片制作成 Redthread 双层拼贴。保留原版人物分割、同一人物像素复用、DartsFont 英日文字、固定纸纹和模板红线的代码渲染流程。通过一个 JSON 和一个命令生成最终 PNG。用于制作或修改此风格照片拼贴，尤其适合不需要编写合成代码的 Agent。无需生图模型。
---

# Redthread 原逻辑简化版

使用现成渲染器。Agent 只需看图、填写简报、运行命令和检查成图。不要编写合成脚本、替换素材或调用生图模型。

## 执行

1. 查看原图。确定主体，写 3–4 条英文短语和 2 条日文短句。英文每条宜为 2–5 个词。日文可以用 `\n` 分行。若小指清晰可见，用 `anchor` 指向小指轮廓；否则可指定包角、衣角等清楚的轮廓尖端。没有明确锚点时可省略，但必须检查自动选点。
2. 在任务目录创建 `brief.json`。路径相对这个 JSON 所在目录解析。完整字段与失败处理见 [输入说明](references/input.md)。

```json
{
  "source": "source.jpg",
  "english": ["OPEN GATE", "GRAY SKY", "A NEW PATH"],
  "japanese": ["ここから\nはじまる", "風に\nさそわれて"]
}
```

3. 使用宿主已有的 Python 3.10+ 和 Pillow 9.1+。下文 `python3` 代表这个解释器。在本 skill 目录运行：

```bash
python3 scripts/render.py --config /absolute/path/brief.json --out /absolute/path/result
```

macOS 14+ 可通过 Swift 和 Apple Vision 自动分割。其他系统在 JSON 中添加 `mask`，指向与原图等尺寸的白色前景、黑色背景灰度 PNG。已有遮罩时不必重新分割。

4. 检查退出码和 `result/report.json`。成功后查看 `result/outputs/final.png` 的完整图和 `result/work/preview.jpg` 的 400 px 内部缩略图。确认人脸、手、包等道具完整；英文在上方剪影内；两侧日文清楚；红线两端接触同一轮廓点。满足后只交付最终 PNG。`work/` 是内部素材，不展示。

## 固定规则

- 1200×1600，上下各 800 px。同一个人物 RGBA 层复用两次，比例相同；下方只允许平移。
- 上方保留原环境，人物改为暖白剪影。下方使用原纸纹与原人物像素。
- 全部文字使用原 DartsFont。两侧日文使用同一字号。文字和红线统一使用酒红色。
- 红线只用原模板与原铅笔笔触。渲染器检查整条笔触，保护人物、道具和文字；仅允许端点附近必要接触。
- 渲染器自动完成字体检查、纸纹改色、排版、有限布局搜索及合成。不要分别调用内部辅助脚本。
- 程序检查不能判断分割是否漏手、文字是否自然或锚点是否确为小指。Agent 必须看图。细则见 [视觉要求](references/style-spec.md)。

## 修改与失败

修改同一份 JSON 后重新运行。保留 `source`、`mask`、`anchor` 和 `seed`，可保持输入与锚点稳定。不要在扁平成图上叠加修改。

失败时读取报告中的错误与处理建议。优先缩短文案、修正遮罩或锚点；不要靠随机换种子反复尝试。没有合法构图时说明原因，不关闭碰撞检查或交付失败图。缺少字体、纸纹、模板时恢复完整 skill 包，不用替代素材。
