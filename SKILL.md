---
name: redthread-classic-simple
description: 用本地 Python/Pillow 将照片制作成 Redthread 双层拼贴。Agent 看图后只调用一次沙箱，直接传入 JSON，由内置脚本完成分割、原人物复用、DartsFont 排版、纸纹、模板红线和自动检查，返回一张最终 PNG。禁止生图或图片编辑模型，失败不切换到生图。
---

# Redthread 原逻辑简化版

**正常流程：看原图并确定参数 → 一次沙箱执行 → 交付最终 PNG。**

## 执行

1. 查看原图，确定主体、3–4 条英文短语和 2 条日文短句。小指清晰可见时，用 `anchor` 指向小指轮廓；否则可指定包角、衣角等清楚的轮廓尖端。没有明确锚点时可省略，但自动选点不等于识别小指。多人照片用 `subject_point` 指定目标人物。图片须已在沙箱中可读，Python/Pillow 须已可用。
2. 看图与参数选择结束后，只发起一次沙箱调用。使用下面的 stdin 入口，在这次调用里直接传入 JSON。脚本自动保存简报、分割、排版、合成和检查。不提前写 `brief.json`，不另行检查环境、读取报告或打开预览。

```bash
python3 /absolute/path/to/skill/scripts/render.py --config - --out /absolute/path/result <<'REDTHREAD_JSON'
{
  "source": "/absolute/path/source.jpg",
  "english": ["OPEN GATE", "GRAY SKY", "A NEW PATH"],
  "japanese": ["ここから\nはじまる", "風に\nさそわれて"]
}
REDTHREAD_JSON
```

`python3` 代表宿主已有的 Python 3.10+ / Pillow 9.1+ 解释器。替换示例路径和文案；按 JSON 规则转义字符串，保留带引号的 heredoc 标记。`--config -` 的相对路径按调用时工作目录解析，优先传绝对图片路径。字段细则见 [输入说明](references/input.md)。

macOS 14+ 通过 Swift 和 Apple Vision 在这次调用中自动分割。其他系统添加 `mask`，指向已准备好的等尺寸灰度遮罩。多人照片可用 `subject_point` 指定目标。无法分割且没有遮罩时，返回失败原因，不调用生图模型补救。

3. 直接使用本次沙箱返回的 JSON：`status: success` 时交付 `artifact.path` 指向的最终 PNG；自动检查摘要已在 `checks` 中，不再读取 `report.json`。`status: failed` 时说明 `error`，不追加第二次沙箱调用或自动重试。命令未启动或未返回 JSON 时，直接用本次调用的退出信息说明失败，不再探测环境。只有用户提出修订或补充输入后，才开始新一轮执行。

## 同一次响应中的成图检查

- 如果宿主支持在沙箱响应中附带文件，将返回的 `artifact` 作为最终图片附件。Agent 可直接查看这次响应中的成图，无需再次调用看图或沙箱工具。
- Python 脚本只能生成文件并返回路径，不能强制宿主显示附件。若响应没有图片，直接交付成图文件和自动检查结果，说明“未进行视觉复核”，不声称已看过成图。
- 脚本返回的 `visual_review: not_performed` 表示程序没有进行语义或审美判断。只有 Agent 实际收到并查看成图，才能说明已经人工/模型视觉复核。检查人脸、手和道具完整性、文案自然度、锚点及整体平衡。
- 不把计划、JSON、抠图、纸纹、红线或缩略图分步交给用户；不在正常流程中等待逐步确认。允许简短进度说明，最终只交付一张 PNG。

## 固定规则

- 唯一成图入口是 `scripts/render.py`。禁止通用生图 skill、Seedream、imagegen 或其他生图/图片编辑模型；不得用于抠图、预览、润色、修复或失败回退。
- 1200×1600，上下各 800 px。同一人物 RGBA 层复用两次，比例相同；下方只允许平移。
- 上方保留原环境，人物改为暖白剪影。下方使用原纸纹与原人物像素。
- 全部文字使用原 DartsFont。两侧日文同字号，文字与红线同酒红色。
- 红线使用原模板与原铅笔笔触。程序检查完整笔触，保护人物、道具和文字，仅允许端点附近必要接触。
- 字体检查、纸纹改色、排版、有限布局搜索和结果检查都由脚本在一次调用中完成。不要调用内部辅助脚本或临时编写合成代码。视觉细则见 [视觉要求](references/style-spec.md)。
- 缺少执行能力、依赖或原素材时，返回明确失败。不要关闭检查或交付替代图片。

修订时保留原 `source`、`mask`、`anchor` 和 `seed`，在新的单次调用中传入更新后的文案或主题色。内部 `work/brief.json` 供复现，旧版 `--config 文件路径` 接口仍可使用，但不是常规生成步骤。
