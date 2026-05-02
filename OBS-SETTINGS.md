# OBS Studio Settings for ModRetro Chromatic USB Capture

Complete configuration guide for pixel-perfect Game Boy / Game Boy Color capture from ModRetro Chromatic.

## Output Mode

Set **Output Mode** to **Advanced** (top of Settings → Output).

## Output → Recording

| Setting | Value |
|---|---|
| Recording Path | your preferred folder |
| Recording Format | Matroska Video (.mkv) |
| Video Encoder | x264 |
| Audio Encoder | FFmpeg AAC |
| Rescale Output | Disabled |

### Encoder Settings

| Setting | Value |
|---|---|
| Rate Control | CRF |
| CRF | 0 |
| Keyframe Interval | 0 (auto) |
| CPU Usage Preset | ultrafast |
| Profile | (None) |
| Tune | (None) |

## Video

| Setting | Value |
|---|---|
| Base (Canvas) Resolution | 1440x1296 |
| Output (Scaled) Resolution | 1440x1296 |
| Downscale Filter | n/a (resolutions match) |
| Common FPS Values | 60 |

## Advanced

| Setting | Value |
|---|---|
| Color Format | I444 |
| Color Space | Rec. 709 |
| Color Range | Full |

## Source: Chromatic - Player 1 (Properties)

Right-click source → Properties.

| Setting | Value |
|---|---|
| Resolution/FPS Type | Custom |
| Resolution | 160x144 |
| FPS | Match Output FPS |
| Video Format | YUY2 |
| Color Space | Default |
| Color Range | Full |
| Buffering | Disable |

## Source: Chromatic - Player 1 (Context Menu)

Right-click source in preview.

| Setting | Value |
|---|---|
| Scale Filtering | Point |
| Deinterlacing | Disable |
| Transform | Fit to Screen (Ctrl+F) |

## Scene: Capture (Filters)

Right-click scene → Filters → Effect Filters → add **User-defined shader**.

Load `chromatic-lcd-grid.shader` or paste shader code. See [modretro-chromatic-obs-shader](https://github.com/mg0x7BE/modretro-chromatic-obs-shader) for the shader.

## Preview

Right-click preview area → Preview Scaling → **Scale to Window**.

## Notes

- Canvas 1440x1296 is exactly 9× the native 160x144 resolution (integer scaling preserves sharp pixels)
- MKV format is safer than MP4 — files are recoverable if OBS crashes during recording. Remux to MP4 afterwards via File → Remux Recordings
- CRF 0 with x264 is lossless.
- I444 color format prevents OBS from downsampling chroma (the default NV12 is 4:2:0)
- Full color range preserves all color values (Limited/Partial clips darks and whites)
