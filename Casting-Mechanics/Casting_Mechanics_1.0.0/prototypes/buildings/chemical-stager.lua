
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
-- circuit_connector_definitions = circuit_connector_definitions.create_vector(universal_connector_template,
-- {
--   {variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false},
--   {variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false},
--   {variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false},
--   {variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false}
-- })

local graphics_frame_count = 60
local graphics_animation_speed = 0.4
local graphics_shift = {0, 0}
local graphics_scale = 0.4
local graphics_set = {
  animation = {
    layers = {
      {
        filename = "__micaalle_Graphics__/graphics//chemical-stager/chemical-stager-hr-animation-1.png",
        priority = "high",
        width = 3200 / 8,
        height = 3200 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        line_length = 8,
        animation_speed = graphics_animation_speed,
      },
      {
        priority = "high",
        filename = "__micaalle_Graphics__/graphics/chemical-stager/chemical-stager-hr-shadow.png",
        width = 800,
        height = 600,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = 1,
        repeat_count = graphics_frame_count,
        draw_as_shadow = true,
        animation_speed = graphics_animation_speed,
      },
    },
  },
  working_visualisations = {
    {
      fadeout = true,
      effect = "flicker",
      animation = {
        priority = "high",
        filename = "__micaalle_Graphics__/graphics/chemical-stager/chemical-stager-hr-emission-1.png",
        width = 3200 / 8,
        height = 3200 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        line_length = 8,
        draw_as_glow = true,
        animation_speed = graphics_animation_speed,
        blend_mode = "additive",
      },
    },
  },
}

fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{flow_direction="input", direction = defines.direction.south, position = {-1, 1.6}}}
  },
  {
    production_type = "input",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{flow_direction="input", direction = defines.direction.south, position = {1, 1.6}}}
  },
  {
    production_type = "output",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{flow_direction="output", direction = defines.direction.north, position = {-1, -1.6}}}
  },
  {
    production_type = "output",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -1.6}}}
  }
}

local working_sound = {
  sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5), -- {filename = "__Spaghetorio__/sounds/buildings/chemical-plant.ogg", volume = 0.5},
  idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.3},
  volume = 0.50,
  aggregation = {
    max_count = 2,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
 {
    type = "assembling-machine",
    name = "mc-chemical-stager",
    icon = "__micaalle_Graphics__/graphics/chemical-stager/chemical-stager-icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "mc-chemical-stager"},
    fast_replaceable_group = "mc-chemical-stager",
    max_health = 750,
    resistances = {
        {type = "physical", percent = 50},
        {type = "fire", percent = 50},
        {type = "impact", percent = 50},
      },
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",

    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    effect_receiver = {base_effect = {productivity = 0.2}},
    module_slots = 6,
    icon_draw_specification = {scale = 1.5, shift = {0, 0.5}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {
      "chemistry",
    },
    crafting_speed = 2,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution = 4},
    },
    energy_usage = "500kW",
    perceived_performance = {minimum = 0.25, maximum = 20},
    graphics_set = graphics_set,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound = working_sound,
    fluid_boxes = fluid_boxes,
    fluid_boxes_off_when_no_fluid_recipe = true,
  }
})


-- Recipe for the Chemical stager
data:extend({
  {
    type = "recipe",
    name = "mc-chemical-stager",
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
    results = {{type = "item", name = "mc-chemical-stager", amount = 1}},
  },
  {
    type = "item",
    name = "mc-chemical-stager",
    icon = "__micaalle_Graphics__/graphics/chemical-stager/chemical-stager-icon.png",
    subgroup = "smelting-machine",
    order = "d[mc-chemical-stager]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "mc-chemical-stager",
    stack_size = 5,
    weight = 200 * kg
  },
})