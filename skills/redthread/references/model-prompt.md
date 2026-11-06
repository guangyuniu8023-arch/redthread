# Full-image prompt template

Fill the fields from the current source photo. The braces below are fields to replace, not text to draw. Supply the actual image references in the stated order, removing optional references and renumbering when absent. Do not place credentials or endpoint identifiers in the prompt.

```text
Create one finished Redthread editorial portrait collage. Generate the complete image, including its layout, paper, glow, handwritten text, and red thread.

REFERENCE ROLES
Image 1: the source photograph. Preserve this subject's recognizable identity, face, expression, hairstyle, pose, hand shape, clothing, accessories, and props. Preserve the source environment in the upper panel.
Image 2: the selected fiber-paper texture. Use its fibers, small dark strands, pulp marks, scan softness, and natural variation as the lower background's visual reference.
{OPTIONAL_CUTOUT_REFERENCE: Image N shows the same source subject isolated. Use it only to understand the contour, pose, and props.}
{OPTIONAL_STYLE_REFERENCE: Image N is an earlier Redthread collage. Follow only its layout balance, fine handwriting, and loose thread style. Do not copy its subject, scene, wording, or visual defects.}

CANVAS AND SUBJECT
Exact 3:4 vertical image, {WIDTH} by {HEIGHT} pixels. Split horizontally at the exact middle into two equal-height panels, with no border or margin.
Main subject: {SUBJECT_DESCRIPTION}.
Protected details: {FACE_HANDS_CLOTHING_PROPS_TO_PRESERVE}.
The same subject appears twice with matching pose, silhouette, proportions, and apparent size. Move the lower appearance only as needed for balanced side space. Do not change its pose or make one appearance smaller.

UPPER HALF
Keep the original {SOURCE_ENVIRONMENT} and its photographic perspective. At {UPPER_POSITION}, turn the subject into a mostly solid warm cream-white silhouette of the same contour, with a soft glow just outside the edge. Keep the environment recognizable. Put every English phrase inside this silhouette, with clear separation between the phrases.

LOWER HALF
Place the real photographic subject at {LOWER_POSITION}, faithfully following Image 1 and the optional cutout. Fill the background with the paper character from Image 2. Give this paper a muted {THEME_COLOR_DESCRIPTION} color derived from the source. Keep its fibers, dark strands, pulp marks, and natural variation visible. Leave useful space beside the subject for the Japanese pair.

HANDWRITING
Draw the exact text below in {ACCENT_COLOR_DESCRIPTION} fine informal handwriting inspired by DartsFont. Use slight letter tilt, gentle baseline drift, and loose spacing. Keep the handwriting legible and lightly imperfect. Do not draw quotation marks or labels.
English fragments, entirely inside the upper silhouette:
{ENGLISH_FRAGMENT_1}
{ENGLISH_FRAGMENT_2}
{ENGLISH_FRAGMENT_3}
{OPTIONAL_ENGLISH_FRAGMENT_4}
Japanese to the left of the lower subject: {JAPANESE_LEFT}
Japanese to the right of the lower subject: {JAPANESE_RIGHT}
Give both Japanese fragments the same apparent letter size, slightly larger than English if space permits. Use natural two-line breaks where needed. Place them close to the subject with small opposing rotations. Keep them clear of eyes, hands, important props, and the thread.

RED THREAD
Draw exactly one continuous, fine wine-red colored-pencil line. Its upper endpoint must touch {PRECISE_UPPER_ANCHOR}; its lower endpoint must touch {CORRESPONDING_LOWER_ANCHOR}. These are the same source-visible contour point on the two appearances. Both endpoints must visibly touch, without floating gaps or invented fingers.
Route the line through {AVAILABLE_NEGATIVE_SPACE}. Keep its route outside these protected areas: {FACE_HANDS_LETTERING_AND_PROP_REGIONS}. The only permitted contact is the selected anchor. Do not copy a route from the style reference that crosses a bag or another protected object.
Use three to five distinct loose curls of varied size and spacing, with relaxed long sections between some curls. Use a semi-dry stroke, restrained pressure variation, fine edge fibers, and slight paper show-through.

FINISH
Produce one complete PNG. Preserve the original subject's photographic character and the quiet, handmade editorial appearance. No extra subject, duplicated limb, missing prop, malformed letters, watermark, flat lower background, thick marker thread, vector-smooth thread, spring, repeated loop pattern, or separate text outside the specified areas.
```

## Targeted correction

Use only after inspecting a real result. Supply the current image first and identify any original references used again. State the observed defect and the smallest needed change, for example:

```text
Edit Image 1, the current Redthread collage. Preserve its overall layout, subject identity and pose, colors, paper, and all correct text. Correct only this observed defect: {OBSERVED_DEFECT}. The required result is {SPECIFIC_VISIBLE_CORRECTION}. Use {REFERENCE_ROLE} for fidelity. Return the same 3:4 dimensions as a complete PNG. Do not add any new visual element.
```

Keep edits tied to observed defects. Do not request a routine enhancement, filter, or polish pass when the first image already meets the specification.

If two edits retain the same defect or introduce a related failure, do not keep editing that flawed image. Make at most one fresh generation from the source, paper, and optional cutout, omitting the flawed composition. Keep the intended wording and design. Report any defects that still remain.
