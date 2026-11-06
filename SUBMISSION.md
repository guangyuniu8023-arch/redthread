# Redthread Plugin Submission Draft

This draft describes the 1.2.0 Seedream revision maintained at guangyuniu8023-arch/redthread. Repository publication does not imply submission to a plugin marketplace.

## Listing

- Name: Redthread
- Type: Skills only
- Category: Creative
- Short description: Generate a red-thread collage with Seedream 5.0 Pro.
- Website: https://github.com/guangyuniu8023-arch/redthread
- Support: https://github.com/guangyuniu8023-arch/redthread/blob/main/SUPPORT.md
- Privacy: https://github.com/guangyuniu8023-arch/redthread/blob/main/PRIVACY.md
- Terms: https://github.com/guangyuniu8023-arch/redthread/blob/main/TERMS.md
- Availability: All countries and regions where ChatGPT and Codex plugins are supported
- Release notes: Seedream 5.0 Pro generates all visual elements. Extra image-processing tools are limited to optional segmentation or cutout extraction.

## Long description

Redthread uses Seedream 5.0 Pro to generate a 3:4 two-panel collage from one user-supplied portrait. The upper scene shows a warm glowing silhouette in the original environment. The lower scene shows the same subject on theme-colored fiber paper. English and Japanese handwriting and a wine-red pencil line connect the scenes. The bundled paper supplies a visual reference. DartsFont remains the lettering style source, with its original license retained.

The model generates composition, paper color, lettering, glow, connector, and the final image. Extra image-processing tools may only segment or extract the subject. This workflow targets visual consistency; it cannot guarantee original pixel preservation or exact TTF rendering. It requires the user's configured Seedream 5.0 Pro endpoint and API credentials. Credentials must remain outside the Skill package, prompts, and logs.

The workflow delivers the inspected final PNG by default. If the user explicitly requests an intermediate result, the agent may show that specified result. This revision derives from [HuHana77/redthread](https://github.com/HuHana77/redthread) and retains the original attribution and asset licenses. The source and policy links above identify this revision's repository.

## Positive test cases

1. Given a portrait with a visible little finger, create a complete collage and connect both subject copies at the corresponding little-finger point.
2. Given a portrait without a visible little finger, select one clear corresponding contour tip and keep that anchor through the final render.
3. Given a pet photo, use one corresponding non-human contour tip and preserve the animal's identity and anatomy.
4. Revise an existing Redthread collage through Seedream 5.0 Pro, changing the theme color while preserving subject scale, anchor, paper texture, and typography rules.
5. Given a portrait with reflective glasses and a held prop, preserve both details and keep text and connector away from protected regions.
6. Confirm that all visual content comes from the model and that any extra image-processing tools only perform segmentation or cutout extraction.

## Negative test cases

1. Model output contains malformed text, altered anatomy, or a misplaced connector; revise through the model and inspect again. If defects remain, report them without claiming success or using a scripted visual fallback.
2. A user supplies no source photo and asks for a named real person's portrait; request a user-supplied photo instead of fabricating the source subject.
3. Seedream 5.0 Pro configuration is unavailable; report the missing configuration instead of silently choosing another model or script compositor.
4. A workflow attempts to run paper recoloring, font rendering, connector drawing, or compositing scripts; reject that implementation and use the configured model.
