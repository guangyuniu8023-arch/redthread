# Redthread

Redthread 是一个兼容 Agent Skills 标准的图像创作 Skill，可用于支持 `SKILL.md` 的 Agent。本修订版使用 **Seedream 5.0 Pro**，把单张人物照片制作成 3:4 竖版红线双场景拼贴：上半部分保留原始环境，并将人物变成暖白色发光剪影；下半部分将同一人物置于源图主题色的纤维纸背景上，再加入英日双语手写文字与酒红色彩铅红线。

这是基于 [HuHana77/redthread](https://github.com/HuHana77/redthread) 制作的 **1.2.0 Seedream 修订版**，由 [guangyuniu8023-arch/redthread](https://github.com/guangyuniu8023-arch/redthread) 发布。原作者署名和素材许可证保持不变。安装本版请使用本仓库链接。

## 它能做什么

- 使用一张人物照片制作完成度较高的 3:4 竖版拼贴。
- 通过同一张源图和可选的人物抠图参考，尽量保持两个场景中的人物轮廓、姿态、服装、配饰和随身物品一致。
- 将内置纸张图作为模型参考，生成保留纤维质感的主题色背景。
- 让模型生成具有 DartsFont 手写风格的英文和日文、酒红色彩铅红线及完整排版。
- 仅在需要分割或抠图时使用额外图像处理工具；纸张调色、字体效果、发光效果、红线和合成都由模型完成。
- 默认只交付一张检查完成的成品 PNG；用户明确要求时，可以展示指定的中间结果。

本版以保留原有视觉风格、版式和输出要求为目标。模型生成无法保证复用原图的每个像素，也无法保证精确渲染某个 TTF 字体。实测仍出现红线穿过道具、局部修改后断线等问题，不能视为已稳定通过视觉验收。需要逐张检查人物一致性、文字和锚点；有偏差时继续用模型修订。如果仍不满足要求，应说明未达标项，不得回退到脚本排版或合成。

## 安装

可以让 Agent 从以下地址安装：

```text
https://github.com/guangyuniu8023-arch/redthread/tree/main/skills/redthread
```

也可以克隆后手动加载：

```bash
git clone https://github.com/guangyuniu8023-arch/redthread.git
```

将 `redthread/skills/redthread/` 整个目录导入所用工具的 Skill 目录，或让 Agent 读取其中的 `SKILL.md`。保留 `references/` 和 `assets/` 的相对路径。若已有同名 Skill，先将旧目录移到安装目录之外备份，再替换整个目录。

本仓库不依赖 Codex 插件配置。根目录的 `SKILL.md` 是入口，实际工作流位于 `skills/redthread/SKILL.md`。加载后，按所用工具的方式刷新或重新开启会话。

## 使用方式

上传一张人物照片后输入：

```text
使用 redthread 把这张照片制作成红线双场景拼贴
```

也可以提出局部修改要求：

```text
使用 redthread 调整英日文字的位置，不要遮挡人物的脸和手，同时保留人物与红线锚点
```

如果照片中的小指清晰可见，红线会优先连接上下场景中对应的小指；如果小指不可识别，则会选择同一个清晰的人物轮廓尖端作为连接点。

## 使用条件

- 需要支持 Agent Skills 且能调用 Seedream 5.0 Pro 图像编辑接口的运行环境。
- 需要由用户上传一张人物或生活方式照片。
- 需要用户已配置的 Seedream 5.0 Pro endpoint（EP）和 API 凭据。优先使用已有安全配置，不在 Skill、提示词、日志或成品中写入凭据。
- 人物分割或背景移除能力可选。没有这类工具时，直接用源图作为模型参考。
- 缺少模型访问配置时，应说明缺失项，不得静默改用其他模型或脚本合成。

## 隐私

Skill 使用用户提供的照片制作本次拼贴。用户指定的外部图像服务会接收本次生成所需的照片、纸张参考和提示词。可选的分割服务也会接收完成抠图所需的照片。中间文件默认保存在任务工作目录；只有用户明确要求时才展示指定文件。详情见 [隐私说明](PRIVACY.md)。

## 许可与素材

项目代码及内置 Redthread 纸张纹理使用 [MIT License](LICENSE) 开源。

DartsFont v2.17 由 DAICHI / ProjectDARTS 制作，并依据 SIL Open Font License 1.1 重新分发。本版保留字体及其许可作为风格来源，不用字体脚本渲染成品。字体授权文件位于 `skills/redthread/assets/fonts/dartsfont/OFL.txt`，字体来源见 [ProjectDARTS](https://www.p-darts.jp/font/dartsfont/)。内置纸张图保留为模型参考。

## 支持与政策

- [使用支持](SUPPORT.md)
- [隐私说明](PRIVACY.md)
- [服务条款](TERMS.md)
