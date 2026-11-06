# Redthread visual specification

This describes the intended appearance. Seedream 5.0 Pro generates every visible element together; these are not instructions for a software compositor.

## Canvas and subject

- Use an exact 3:4 vertical canvas with a clean 50/50 horizontal split.
- Base both appearances on one person or main subject from the original photograph.
- Preserve recognizable identity, expression, pose, proportions, hand shape, clothing, accessories, held objects, and meaningful motion blur.
- Match the subject's contour and apparent size between panels. The lower appearance may move horizontally for balance but must not become a differently scaled or newly posed subject.
- An optional cutout clarifies the source contour. Ask the model to follow it in both panels; do not claim that the generated copies share identical pixels.

## Upper panel

- Retain the source environment, perspective, and photographic character.
- Keep the subject near its source-relative position when the 3:4 crop permits it.
- Replace the subject's visible appearance with a mostly solid warm cream-white silhouette of the same shape.
- Add a soft glow just outside its contour. Keep enough space inside the silhouette for readable English.
- Preserve faint hand or prop detail only if it improves recognition without turning the silhouette back into a fully detailed person.

## Lower panel

- Provide `assets/paper/theme-fiber-paper.jpg` as a direct model reference for the entire lower background.
- Have the model preserve its recognizable fibers, short dark strands, pulp marks, scan softness, and local tonal variation.
- Give the paper a muted representative color from the source scene. The model performs this color treatment within the generated image.
- Keep the real subject photographic and faithful to the source, with balanced negative space for Japanese on both sides.
- Do not use a flat fill, glossy surface, clean digital gradient, invented decorative pattern, or generic paper effect in place of this reference.

## Palette

- Environment: retain the source scene's colors in the upper panel.
- Theme: choose one softened representative scene color for the lower paper.
- Accent: choose a dark, restrained vintage wine red, brown-red, or brick red for all text and the thread.
- Glow: use warm white or cream white suited to the source lighting.

## Lettering

- Write three or four English mood fragments, each two to five words, based on the scene's time, place, action, prop, or emotion.
- Keep every English letter inside the upper silhouette. Do not spread English onto the environment or lower paper.
- Write two short Japanese thoughts, one beside each side of the lower subject. Prefer no punctuation.
- Give the Japanese pair the same apparent letter size. Make them visibly larger than the English where space permits.
- Use natural two-line breaks and move text closer to the subject if needed. Do not shrink only one Japanese side.
- Keep text away from eyes, hands, important props, and the thread.
- Ask the model for the visual handwriting character of DartsFont: informal fine strokes, slight per-letter tilt, gentle baseline drift, and loose spacing. Avoid a polished typeset or brush-calligraphy look.
- Use small opposing rotations and asymmetric placement. Ask the model to draw the exact selected phrases; visually check every phrase after generation.
- The font file is provenance and optional design context. An image model does not load it as a deterministic text renderer.

## Thread

- Generate exactly one uninterrupted fine line in the same wine-red accent as the lettering.
- Prefer a clearly visible little-finger contour point. If none is identifiable, select another clear source-visible tip: a fingertip, shoe tip, hair tip, garment corner, or held-prop tip.
- For a non-human subject, use a clear corresponding tip on the main object.
- Both endpoints must visibly touch the same selected point on the upper silhouette and lower real subject. Do not land beside the subject or invent a finger.
- Draw three to five clearly distinct loose curls. Vary size, direction, and spacing, with long calm sections between some curls.
- Use a thin, semi-dry colored-pencil or wax-crayon stroke, with restrained pressure variation, fine edge fibers, and slight paper show-through.
- Avoid faces, eyes, lettering, and important props, except for the intentional endpoint contact if the anchor is on a prop.
- Reject thick marker strokes, opaque vector lines, fuzzy airbrush lines, dotted fragments, knots, repeated springs, telephone cords, regular sine waves, and a single large S-curve.
- Former connector templates document the earlier design. They are not an executable dependency and must not be rendered or composited into the image.

## Inspection and delivery

Inspect the actual returned PNG. Check face and hand fidelity, text accuracy, panel balance, paper character, matching subject size, endpoint contact, and thread curls.

At a small on-screen scale, the subject, two-panel structure, wine-red lettering and thread, Japanese side placement, and paper must remain clear. Viewing at another scale does not require generating a resized file.

Use a targeted model edit for an observed defect. Keep the original source and paper reference available during revisions. Deliver one finished PNG; keep the cutout, masks, and rejected attempts private.
