local hit_effects = require("__base__/prototypes/entity/hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local greenhouse_working_sound = {
  filename = "__base__/sound/boiler.ogg",
  volume = 0.2,
  idle_sound = { filename = "__base__/sound/idle1.ogg" },
  aggregation = {
    max_count = 3,
    remove = false,
    count_already_playing = true,
  },
}

local graphics_frame_count = 61
local graphics_animation_speed = 0.5
local graphics_shift = {0, -0.4}
local graphics_scale = 0.5
local graphics_set = {
  animation = {
    layers = {
      {
        priority = "high",
        filename = "__micaalle_Graphics__/graphics/scrubber/scrubber-hr-shadow.png",
        width = 400,
        height = 350,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = 1,
        repeat_count = graphics_frame_count,
        draw_as_shadow = true,
        animation_speed = graphics_animation_speed,
      },
      {
        priority = "high",
        width = 1680 / 8,
        height = 2320 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        animation_speed = graphics_animation_speed,
        stripes = {
          {
            filename = "__micaalle_Graphics__/graphics/scrubber/scrubber-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
        },
      },
    },
  },
}





data:extend({
    {
      type = "assembling-machine",
      name = "mc-scrubber",
      icon_size = 64,
      icon_mipmaps = 4,
      icon = "__micaalle_Graphics__/graphics/scrubber/scrubber-icon.png",
      flags = { "placeable-neutral", "placeable-player", "player-creation" },
      minable = { hardness = 1, mining_time = 1, result = "mc-scrubber" },
      max_health = 500,
      dying_explosion = "big-explosion",
      damaged_trigger_effect = hit_effects.entity(),
      fluid_boxes_off_when_no_fluid_recipe = false,
      collision_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
      selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
      fast_replaceable_group = "mc-scrubber",
      module_slots = 3,
      allowed_effects = { "consumption", "speed", "productivity", "pollution" },
  
      crafting_categories = {"cm-core-mining"}, --PLACEHOLDER
      vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound = greenhouse_working_sound,
      crafting_speed = 1,
      graphics_set = graphics_set,
      return_ingredients_on_change = true,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {pollution = -5},
      },
      energy_usage = "144.8kW",
      ingredient_count = 4,
    },
  })
  

-- Recipe for the scrubber
data:extend({
  {
    type = "recipe",
    name = "mc-scrubber",
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
    results = {{type = "item", name = "mc-scrubber", amount = 1}},
  },
  {
    type = "item",
    name = "mc-scrubber",
    icon = "__micaalle_Graphics__/graphics/scrubber/scrubber-icon.png",
    subgroup = "smelting-machine",
    order = "d[mc-scrubber]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "mc-scrubber",
    stack_size = 5,
    weight = 200 * kg
  },
})