
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local graphics_frame_count = 80
local graphics_animation_speed = 0.7
local graphics_shift = {0.05, -0.3}
local graphics_scale = 0.45 * 4 / 7
local graphics_set = {
  animation = {
    layers = {
      {
        priority = "high",
        width = 4200 / 8,
        height = 4456 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        animation_speed = graphics_animation_speed,
        stripes =
        {
          {
            filename = "__micaalle_Graphics__/graphics/lumber-mill/lumber-mill-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__micaalle_Graphics__/graphics/lumber-mill/lumber-mill-hr-animation-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
      {
        priority = "high",
        filename = "__micaalle_Graphics__/graphics/lumber-mill/lumber-mill-hr-shadow.png",
        width = 800,
        height = 700,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = 1,
        repeat_count = graphics_frame_count,
        draw_as_shadow = true,
        animation_speed = graphics_animation_speed,
      },
    },
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "mc-mill",  
    icon = "__micaalle_Graphics__/graphics/lumber-mill/lumber-mill-icon.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 1, mining_time = 1, result = "mc-mill"},
    max_health = 500,
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    fast_replaceable_group = "mc-mill",
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    graphics_set = graphics_set,
    crafting_categories = {"early-metallurgy"},
    crafting_speed = 1,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    return_ingredients_on_change = true,
    energy_source = {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      emissions_per_minute = {pollution = 1},
      fuel_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
    },
    energy_usage = "300kW",
    module_slots = 3,
    icon_draw_specification = {scale = 1.5, shift = {0, 0}},
  }
})



-- Recipe for the Wood Processing Plant
data:extend({
  {
    type = "recipe",
    name = "mc-mill",
    category = "crafting-with-fluid",
    ingredients = {
      {type = "item", name = "advanced-circuit", amount = 50},   --PLACEHOLDER
      {type = "item", name = "iron-gear-wheel", amount = 100},
      {type = "item", name = "steel-plate", amount = 300},
      {type = "item", name = "electric-engine-unit", amount = 50},
      {type = "fluid", name = "lubricant", amount = 300},
      {type = "item", name = "concrete", amount = 300},
    },
    enabled = false,
    energy_required = 10,
    results = {{type = "item", name = "mc-mill", amount = 1}},
  },
  {
    type = "item",
    name = "mc-mill",
    icon = "__micaalle_Graphics__/graphics/lumber-mill/lumber-mill-icon.png",
    subgroup = "smelting-machine",
    order = "d[mc-mill]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "mc-mill",
    stack_size = 5,
    weight = 200 * kg
  },
})