# 🔥 Nether Illuminator Mod - Installation & Usage Guide

## 📦 Installation

1. **Create the mod folder:**
   - Navigate to your Luanti mods directory (usually `~/.luanti/mods/` on Linux or `%APPDATA%\luanti\mods\` on Windows)
   - Create a new folder named `nether_illuminator`

2. **Add the mod files:**
   - Place the `init.lua` file in the `nether_illuminator` folder
   - Place the `mod.conf` file in the same folder

3. **Create textures folder:**
   - Create a `textures` folder inside `nether_illuminator`
   - Add the texture files (see texture section below)

4. **Enable the mod:**
   - Start Luanti/MineClonia
   - Go to the "Mods" tab when creating/configuring a world
   - Find "Nether Illuminator" and enable it

## 🎨 Required Textures

Create these texture files (16x16 PNG images) in the `textures` folder:

### Basic Textures (you can use simple colored squares for testing):
- `nether_sun.png` - Bright yellow/white glowing texture
- `nether_sun_inv.png` - Inventory icon for nether sun
- `daylight_projector_top.png` - Crystal-like texture
- `daylight_projector_bottom.png` - Metal base texture  
- `daylight_projector_side.png` - Side panel texture
- `daylight_projector_inv.png` - Inventory icon
- `nether_lamp_post_top.png` - Lamp housing texture
- `nether_lamp_post_base.png` - Base/foundation texture
- `nether_lamp_post_pole.png` - Metal pole texture
- `nether_lamp_post_inv.png` - Inventory icon
- `area_illuminator_top.png` - Beacon-like top
- `area_illuminator_bottom.png` - Heavy base texture
- `area_illuminator_side.png` - Complex side machinery
- `area_illuminator_inv.png` - Inventory icon

*Note: You can temporarily use existing MineClonia textures by copying them and renaming, or create simple colored squares for testing.*

## 🔧 Blocks Added

### 1. **Nether Sun Block** (`nether_illuminator:nether_sun`)
- **Light Level:** 14 (Maximum)
- **Appearance:** Glasslike, glowing block
- **Use:** Basic powerful light source
- **Crafting:** Diamond + Glowstone + Gold Block pattern

### 2. **Daylight Projector** (`nether_illuminator:daylight_projector`)
- **Light Level:** 14 (Maximum)
- **Appearance:** Crystal projector with base
- **Use:** Advanced light source with crystal design
- **Crafting:** Requires Nether Sun + Emeralds + Gold

### 3. **Nether Lamp Post** (`nether_illuminator:nether_lamp_post`)
- **Light Level:** 14 (Maximum)
- **Appearance:** Street lamp design
- **Use:** Perfect for city streets and pathways
- **Crafting:** Makes 4 lamp posts from 1 Nether Sun + Iron

### 4. **Area Illuminator** (`nether_illuminator:area_illuminator`)
- **Light Level:** 14 (Maximum)
- **Special:** Automatically places light sources in 64-block radius
- **Appearance:** Large beacon-like structure
- **Use:** Illuminates massive areas instantly
- **Crafting:** Requires Beacon + Daylight Projector + Netherite

## 🏗️ Building Your Nether City

### Recommended Placement Strategy:

1. **Start with Area Illuminators:**
   - Place one every 128 blocks for city districts
   - These will create the base lighting grid

2. **Add Lamp Posts for Streets:**
   - Place every 16-32 blocks along roads
   - Creates realistic city lighting

3. **Use Nether Suns for Buildings:**
   - Place inside large structures
   - Hidden lighting for ambient illumination

4. **Daylight Projectors for Landmarks:**
   - Use for important buildings
   - Decorative and functional

### 💡 Pro Tips:

- **Layer your lighting:** Use different types at different heights
- **Underground lighting:** Place Area Illuminators below ground level for subtle area lighting
- **Combine with existing blocks:** Use with Sea Lanterns, Glowstone, etc. for variety
- **Plan your grid:** Map out illuminator placement before building to avoid dark spots

## 🔨 Crafting Recipes

### Nether Sun Block:
```
[Glowstone] [Diamond] [Glowstone]
[Diamond]   [Gold Block] [Diamond]
[Glowstone] [Diamond] [Glowstone]
```

### Daylight Projector:
```
[    ]      [Diamond]    [    ]
[Emerald]   [Nether Sun] [Emerald]
[Gold Block][Gold Block] [Gold Block]
```

### Nether Lamp Post (makes 4):
```
[    ]      [Nether Sun] [    ]
[    ]      [Iron Block] [    ]
[Iron Ingot][Iron Block] [Iron Ingot]
```

### Area Illuminator:
```
[Beacon]    [Ender Eye]     [Beacon]
[Ender Eye] [Day Projector] [Ender Eye]
[Netherite] [Netherite]     [Netherite]
```

## 🐛 Troubleshooting

**Mod doesn't load:**
- Check that `mod.conf` and `init.lua` are in the correct folder
- Verify MineClonia dependencies are met

**Textures appear as checkerboard:**
- Missing texture files in `textures` folder
- Use placeholder textures for testing

**Blocks don't emit light:**
- Server may need restart after mod installation
- Check that light level is properly set in game settings

**Area Illuminator doesn't work:**
- Requires proper permissions in multiplayer
- May conflict with area protection mods

## 🌟 Enjoy Building Your Nether City!

With these powerful light sources, you can now build magnificent cities in the Nether with proper illumination. The combination of different light types allows for both functional city lighting and beautiful architectural features.

Happy building! 🏙️✨