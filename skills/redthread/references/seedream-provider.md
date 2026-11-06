# Seedream 5.0 Pro request notes

Use the host's existing, authorized Seedream 5.0 Pro configuration. Preserve the user's selected endpoint and provider. Do not silently choose a different model.

## Configuration

- Read the configured base URL, endpoint or model ID, and API key from the host's secure configuration or environment.
- If the user identifies and authorizes reuse of an earlier configuration, retrieve only that relevant configuration. Do not search unrelated chats for credentials.
- Keep keys out of prompts, generated files, logs, skill assets, commits, and user-facing replies. Do not hard-code an endpoint ID or key in this reusable package.
- If configuration cannot be resolved, identify the missing setting and ask for a secure way to supply it. Do not claim a provider call succeeded without its response.

## Request shape

The previously working Ark image API uses `POST /api/v3/images/generations`, or the equivalent `/images/generations` route when the configured base URL already includes `/api/v3`.

Use the configured Seedream 5.0 Pro endpoint as `model`. A known returned model identifier is `doubao-seedream-5-0-pro-260628`; this identifies the model family but does not replace a user's endpoint configuration.

The established request fields are:

| Field | Value |
| --- | --- |
| `model` | The configured Seedream 5.0 Pro model or endpoint ID |
| `prompt` | The filled full-image or targeted-edit prompt |
| `image` | Ordered source and paper image references, plus optional cutout or approved style reference |
| `size` | `1200x1600` for the established 3:4 output, unless the user requests another supported 3:4 size |
| `output_format` | `png` |
| `response_format` | `b64_json` |
| `watermark` | `false` |

The established interface accepts image data URIs for multiple references. Encoding an existing file for transport does not change its image content. Save the returned PNG bytes without redrawing, recoloring, cropping, or resizing them. If the provider rejects a field or changes its schema, inspect the returned error or official documentation and adjust the transport only; preserve the selected model and visual requirements.

HTTP clients or short request code may handle authentication, reference encoding, response parsing, and byte storage. This is transport logic, not permission to construct any visual content with code. Do not install graphics packages or invoke the old raster helpers.

Check returned metadata or file headers for format and dimensions, then inspect the image itself. Report a provider failure honestly and stop the generation attempt. A model-generated image still requires visual inspection before it can be described as meeting the specification.
