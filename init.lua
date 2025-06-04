-- Nether Illuminator Mod for MineClonia
-- This mod adds a powerful light source to illuminate the Nether like daylight

local mod_name = "nether_illuminator"

-- Register the Nether Illuminator block
minetest.register_node(mod_name .. ":nether_sun", {
    description = "Nether Sun Block",
    drawtype = "glasslike",
    tiles = {"nether_sun.png"},
    inventory_image = "nether_sun_inv.png",
    wield_image = "nether_sun_inv.png",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {cracky = 2, oddly_breakable_by_hand = 1, building_block = 1, pickaxey = 1, handy = 1},
    light_source = 14, -- Maximum light level
    _mcl_hardness = 1.5,
    _mcl_blast_resistance = 3,
    sounds = {
        dig = {name = "default_glass_footstep", gain = 0.5},
        dug = {name = "default_break_glass", gain = 1.0},
        place = {name = "default_place_node", gain = 1.0}
    },
    drop = mod_name .. ":nether_sun",
})

-- Register an even more powerful variant that spreads sunlight
minetest.register_node(mod_name .. ":daylight_projector", {
    description = "Daylight Projector",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- Main block
            {-0.3, 0.5, -0.3, 0.3, 0.8, 0.3},   -- Top crystal
        }
    },
    tiles = {
        "daylight_projector_top.png",
        "daylight_projector_bottom.png",
        "daylight_projector_side.png",
        "daylight_projector_side.png",
        "daylight_projector_side.png",
        "daylight_projector_side.png"
    },
    inventory_image = "daylight_projector_inv.png",
    wield_image = "daylight_projector_inv.png",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {cracky = 2, oddly_breakable_by_hand = 1, building_block = 1, pickaxey = 1, handy = 1},
    light_source = 14, -- Maximum light level
    _mcl_hardness = 2.0,
    _mcl_blast_resistance = 4,
    sounds = {
        dig = {name = "default_metal_footstep", gain = 0.5},
        dug = {name = "default_break_glass", gain = 1.0},
        place = {name = "default_place_node_metal", gain = 1.0}
    },
    drop = mod_name .. ":daylight_projector",
})

-- Register a lamp post variant for city building
minetest.register_node(mod_name .. ":nether_lamp_post", {
    description = "Nether Lamp Post",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.1, -0.5, -0.1, 0.1, 0.4, 0.1},   -- Pole
            {-0.25, 0.3, -0.25, 0.25, 0.5, 0.25}, -- Lamp housing
            {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2},   -- Base
        }
    },
    tiles = {
        "nether_lamp_post_top.png",
        "nether_lamp_post_base.png",
        "nether_lamp_post_pole.png",
        "nether_lamp_post_pole.png",
        "nether_lamp_post_pole.png",
        "nether_lamp_post_pole.png"
    },
    inventory_image = "nether_lamp_post_inv.png",
    wield_image = "nether_lamp_post_inv.png",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = false,
    is_ground_content = false,
    groups = {cracky = 2, oddly_breakable_by_hand = 1, building_block = 1, pickaxey = 1, handy = 1},
    light_source = 14, -- Maximum light level
    _mcl_hardness = 1.8,
    _mcl_blast_resistance = 3.5,
    sounds = {
        dig = {name = "default_metal_footstep", gain = 0.5},
        dug = {name = "default_dig_metal", gain = 1.0},
        place = {name = "default_place_node_metal", gain = 1.0}
    },
    drop = mod_name .. ":nether_lamp_post",
})

-- Crafting recipes
minetest.register_craft({
    output = mod_name .. ":nether_sun",
    recipe = {
        {"mcl_nether:glowstone", "mcl_core:diamond", "mcl_nether:glowstone"},
        {"mcl_core:diamond", "mcl_core:goldblock", "mcl_core:diamond"},
        {"mcl_nether:glowstone", "mcl_core:diamond", "mcl_nether:glowstone"}
    }
})

minetest.register_craft({
    output = mod_name .. ":daylight_projector",
    recipe = {
        {"", "mcl_core:diamond", ""},
        {"mcl_core:emerald", mod_name .. ":nether_sun", "mcl_core:emerald"},
        {"mcl_core:goldblock", "mcl_core:goldblock", "mcl_core:goldblock"}
    }
})

minetest.register_craft({
    output = mod_name .. ":nether_lamp_post 4",
    recipe = {
        {"", mod_name .. ":nether_sun", ""},
        {"", "mcl_core:ironblock", ""},
        {"mcl_core:iron_ingot", "mcl_core:ironblock", "mcl_core:iron_ingot"}
    }
})

-- Alternative recipe using netherite for late game
if minetest.registered_items["mcl_nether:netherite_ingot"] then
    minetest.register_craft({
        output = mod_name .. ":daylight_projector",
        recipe = {
            {"mcl_nether:netherite_ingot", "mcl_end:ender_eye", "mcl_nether:netherite_ingot"},
            {"mcl_end:ender_eye", mod_name .. ":nether_sun", "mcl_end:ender_eye"},
            {"mcl_nether:netherite_ingot", "mcl_nether:netheriteblock", "mcl_nether:netherite_ingot"}
        }
    })
end

-- Register light spreading function (optional enhancement)
local function spread_light_around(pos)
    local positions = {
        {x = pos.x + 16, y = pos.y, z = pos.z},
        {x = pos.x - 16, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z + 16},
        {x = pos.x, y = pos.y, z = pos.z - 16},
        {x = pos.x, y = pos.y + 8, z = pos.z},
    }
    
    for _, spread_pos in ipairs(positions) do
        local node = minetest.get_node(spread_pos)
        if node.name == "air" then
            minetest.set_node(spread_pos, {name = "mcl_core:light_14"})
        end
    end
end

-- Enhanced daylight projector with area effect
minetest.register_node(mod_name .. ":area_illuminator", {
    description = "Area Illuminator (64 block radius)",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.5, -0.4, 0.4, 0.3, 0.4},   -- Base
            {-0.2, 0.3, -0.2, 0.2, 0.7, 0.2},    -- Middle
            {-0.1, 0.7, -0.1, 0.1, 1.2, 0.1},    -- Top beacon
        }
    },
    tiles = {
        "area_illuminator_top.png",
        "area_illuminator_bottom.png",
        "area_illuminator_side.png",
        "area_illuminator_side.png",
        "area_illuminator_side.png",
        "area_illuminator_side.png"
    },
    inventory_image = "area_illuminator_inv.png",
    wield_image = "area_illuminator_inv.png",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {cracky = 3, oddly_breakable_by_hand = 1, building_block = 1, pickaxey = 2, handy = 1},
    light_source = 14,
    _mcl_hardness = 3.0,
    _mcl_blast_resistance = 6,
    sounds = {
        dig = {name = "default_metal_footstep", gain = 0.5},
        dug = {name = "default_break_glass", gain = 1.0},
        place = {name = "default_place_node_metal", gain = 1.0}
    },
    after_place_node = function(pos, placer, itemstack, pointed_thing)
        -- Create a large area of light sources around the illuminator
        local radius = 32
        for x = -radius, radius, 8 do
            for y = -8, 16, 4 do
                for z = -radius, radius, 8 do
                    local check_pos = {x = pos.x + x, y = pos.y + y, z = pos.z + z}
                    local node = minetest.get_node(check_pos)
                    if node.name == "air" and math.random(1, 3) == 1 then
                        minetest.set_node(check_pos, {name = "mcl_core:light_14"})
                    end
                end
            end
        end
    end,
    on_destruct = function(pos)
        -- Clean up light sources when the illuminator is destroyed
        local radius = 32
        for x = -radius, radius, 8 do
            for y = -8, 16, 4 do
                for z = -radius, radius, 8 do
                    local check_pos = {x = pos.x + x, y = pos.y + y, z = pos.z + z}
                    local node = minetest.get_node(check_pos)
                    if node.name == "mcl_core:light_14" or node.name == "air" then
                        -- Only remove light blocks we placed, not natural air
                        if node.name == "mcl_core:light_14" then
                            minetest.set_node(check_pos, {name = "air"})
                        end
                    end
                end
            end
        end
    end,
    drop = mod_name .. ":area_illuminator",
})

-- Crafting recipe for area illuminator
minetest.register_craft({
    output = mod_name .. ":area_illuminator",
    recipe = {
        {"mcl_beacons:beacon", "mcl_end:ender_eye", "mcl_beacons:beacon"},
        {"mcl_end:ender_eye", mod_name .. ":daylight_projector", "mcl_end:ender_eye"},
        {"mcl_nether:netheriteblock", "mcl_nether:netheriteblock", "mcl_nether:netheriteblock"}
    }
})

print("[Nether Illuminator] Mod loaded successfully!")