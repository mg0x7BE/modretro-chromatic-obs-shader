![GitHub repo size](https://img.shields.io/github/repo-size/mg0x7BE/modretro-chromatic-obs-shader)
![GitHub License](https://img.shields.io/github/license/mg0x7BE/modretro-chromatic-obs-shader)
![GitHub Created At](https://img.shields.io/github/created-at/mg0x7BE/modretro-chromatic-obs-shader)
![GitHub forks](https://img.shields.io/github/forks/mg0x7BE/modretro-chromatic-obs-shader)
![GitHub Repo stars](https://img.shields.io/github/stars/mg0x7BE/modretro-chromatic-obs-shader)

# ModRetro Chromatic LCD Grid Shader for OBS Studio

OBS shader that simulates the LCD pixel grid for [ModRetro Chromatic](https://modretro.com) USB video capture. Adds an authentic retro look with adjustable grid, brightness, saturation, and vibrance. Includes optional DMG (original Game Boy) green palette mode.

## Features

- LCD pixel grid overlay
- Adjustable brightness, saturation, and vibrance
- DMG green palette mode for original Game Boy games
- Real-time, runs directly in OBS

## Requirements

- [ModRetro Chromatic](https://modretro.com) with USB video streaming
- [OBS Studio](https://obsproject.com/)
- [obs-shaderfilter](https://github.com/exeldro/obs-shaderfilter) plugin

## Installation

1. Install [obs-shaderfilter](https://github.com/exeldro/obs-shaderfilter/releases)
2. Set your OBS canvas to an integer multiple of 160×144 (e.g. 1440×1296 = 9×)
3. Right-click your **Scene** > Filters > add **User-defined shader**
4. Check "Load shader text from file" and select `chromatic-lcd-grid.shader`

> Add the shader to the **Scene**, not the source.

5. **Optional**: Review [OBS settings](OBS-SETTINGS.md)

## Parameters

| Parameter | Default | Description |
|---|---|---|
| `grid_thickness` | 0.12 | Width of grid lines |
| `grid_opacity` | 0.3 | Darkness of grid lines |
| `brightness_boost` | 1.4 | Brightness compensation |
| `vibrance` | 0.2 | Boosts undersaturated colors |
| `saturation` | 1.2 | Overall color saturation |
| `dmg_palette` | off | Original Game Boy green palette |

## DMG Palette Mode

For original Game Boy (non-Color) games, enable the `dmg_palette` checkbox to apply the classic green LCD look. On your Chromatic, set the palette to grayscale first: **Menu > Palette > Grayscale**. The shader will map the four shades of gray to authentic Game Boy green tints.

## License

[Unlicense](LICENSE)
