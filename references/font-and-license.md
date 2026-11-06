# DartsFont visual reference and license

The original Redthread design used DartsFont. The model-based workflow preserves its informal handwriting character rather than rendering text with the font file.

## Model direction

Ask Seedream 5.0 Pro for fine, slightly irregular handwritten English and Japanese, gentle baseline drift, restrained letter tilt, and loose spacing. Use a muted wine-red accent. Avoid conventional typesetting, heavy brush strokes, and ornate calligraphy.

An approved collage can be supplied as an optional reference for this lettering style. Do not use code to render a new font specimen or overlay text. Do not claim that the model loads the TTF, follows its cmap, or reproduces exact glyph outlines.

Give the model the exact English and Japanese phrases. Check the generated characters visually. Correct malformed or missing characters with a targeted model edit; do not add a software-rendered text layer.

## Bundled source and redistribution

- Font asset: `assets/fonts/dartsfont/DartsFont-Regular.ttf`.
- DartsFont v2.17 is by DAICHI / ProjectDARTS.
- Authoritative source: <https://www.p-darts.jp/font/dartsfont/>.
- The font is distributed under the SIL Open Font License 1.1. Preserve `assets/fonts/dartsfont/OFL.txt` with every redistributed font copy.
- Keep the bundled font data unchanged. Preserve the font and its license when distributing this package as supplied.
- The font is historical design provenance, not a runtime dependency of image generation. Do not run font installation or glyph-validation scripts for a normal collage request.
- The generated image does not need to expose the font file separately.
