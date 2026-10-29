# EnchantEnhanced

<img src="pack.png" alt="EnchantEnhanced pack icon" width="128">

Fork of [blob's Enchant Icons](https://modrinth.com/resourcepack/blobs-enchant-icons),
licensed under [GPL-2.0-only](LICENSE).

Enchantment icons and colored names, with Roman and Arabic level labels.

| Level | Display |
|---|---|
| 1 | *(no suffix — vanilla)* |
| 2–25 | Roman numerals `II`–`XXV` |
| 26–255 | Arabic numerals `26`–`255` |

Enchantment names use grade colors: red for curses, gray for bad, white for basic, yellow for good, aqua for epic, pink for mythic, and green for special. The level suffix is colored independently by level.

| Level | Suffix color |
|---|---|
| 2 | Gray |
| 3 | White |
| 4 | Green |
| 5 | Aqua |
| 6–10 | Light purple |
| 11–25 | Gold |
| 26–100 | Yellow |
| 101–255 | Red |

## Differences from upstream

- Custom <img src="assets/minecraft/textures/misc/unbreaking.png" alt="" width="32" height="32"> **Unbreaking** icon and new <img src="assets/minecraft/textures/misc/lunge.png" alt="" width="32" height="32"> **Lunge** icon.
- **Grade colors** for enchantment names and a separate color scale for level suffixes.
- **Roman numerals** for levels 2–25 and **Arabic numerals** for levels 26–255.
- Updated compatibility for **Minecraft 26.2+**.

## Icons and licensing

Icons are based on [blob's Enchant Icons](https://modrinth.com/resourcepack/blobs-enchant-icons)
(licensed GPL-2.0-only; see `LICENSE`). The Unbreaking and Lunge icons use
custom designs. Icons are packed as a bitmap font per `assets/minecraft/font/default.json`
and referenced by private-use glyphs in the name translations.

## How it works

Vanilla renders enchantment levels through the language keys `enchantment.level.<n>`.
This pack defines English enchantment names and level keys in
`assets/minecraft/lang/en_us.json`:

- `enchantment.level.2` … `enchantment.level.25` → roman numerals
- `enchantment.level.26` … `enchantment.level.255` → arabic numerals

Each value starts with a vanilla `§` formatting code. The `color` field in
[text components](https://minecraft.wiki/w/Text_component_format) applies to
component objects, not language-file translation strings; these translations
therefore use formatting codes rather than component fields or `<color>` tags.

English enchantment names include icons and grade colors. Other selected
languages can override these English fallback entries, omitting both.
Level suffixes use the English fallback when the selected language has no
corresponding level translation. Levels above 255 are not defined by this pack.

## Compatibility

- Minecraft **26.2+** (pack format `88`, declared range 88–200; 26.3 uses 97.1, in range).
- No dependencies; works with any mod loader or vanilla.
- Other packs overriding enchantment name translations conflict; the
  higher-priority pack wins.
- Modded enchantments are unchanged.

## Install

Copy the built ZIP into the instance's `resourcepacks/` folder and enable it in
*Options → Resource Packs…*, or extract into `resourcepacks/EnchantEnhanced/`.

## Build

Prerelease artifact: run the build script to produce a distributable zip that
matches the release layout (no leading `./` entries, exact member paths):

```powershell
powershell -ExecutionPolicy Bypass -File build.ps1
```

Output: `EnchantEnhanced.zip` (built with `tar`/bsdtar, bundled with Windows 10+).
If `Y:\Games\NRC Instances\profiles\Leben_s NVIDIA Pack\resourcepacks` exists,
the build also copies the ZIP there, replacing the previous copy. Otherwise it
warns and leaves the local build available for manual installation.

## Files

```text
pack.mcmeta                       pack metadata & description
pack.png                          resource pack icon
assets/minecraft/lang/en_us.json  name, level, and potency translations
assets/minecraft/font/default.json  bitmap icon font providers
assets/minecraft/textures/misc/  icon textures
build.ps1                       zip builder
LICENSE                         GPL-2.0-only
```