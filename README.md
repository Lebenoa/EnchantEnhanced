# EnchantEnhanced

Resource pack that renders enchantment levels in a roman → arabic hybrid:

| Level | Display |
|---|---|
| 1 | *(no suffix — vanilla)* |
| 2–25 | Roman numerals `II`–`XXV` |
| 26–255 | Arabic numerals `26`–`255` |

## How it works

Vanilla renders enchantment levels through the language keys `enchantment.level.<n>`
(appended by `Enchantment#getFullname`, which skips level 1 entirely). This pack
defines those keys in `assets/minecraft/lang/en_us.json` for every level:

- `enchantment.level.2` … `enchantment.level.25` → roman numerals
- `enchantment.level.26` … `enchantment.level.255` → arabic numerals

`en_us.json` is the game's fallback language, so the display applies under every
translations with no per-language files needed. Levels above vanilla maximum
(255 is the hard command-line ceiling) are not defined and would render as the
raw key — nothing in the game produces them.

## Compatibility

- Minecraft **26.2+** (pack format `88`, declared range 88–200; 26.3 uses 97.1, in range).
- No dependencies; works with any mod loader or vanilla.
- In **Leben's NVIDIA Pack** this pack ships as a bundled zip, enabled by default
  at the top of the `options.txt` pack order.

## Install

- **Launcher/modpack:** drop the built `EnchantEnhanced.zip` into the instance's
  `resourcepacks/` folder and enable it in *Options → Resource Packs…*, or bundle
  it (see build below).
- **Manual:** extract into `resourcepacks/EnchantEnhanced/` (folder packs work too).

## Build

Prerelease artifact: run the build script to produce a distributable zip that
matches the release layout (no leading `./` entries, exact member paths):

```
powershell -ExecutionPolicy Bypass -File build.ps1
```

Output: `EnchantEnhanced.zip` (built with `tar`/bsdtar, bundled with Windows 10+).

## Files

```
pack.mcmeta                     pack metadata & description
assets/minecraft/lang/en_us.json  enchantment.level.* definitions
build.ps1                       zip builder
```