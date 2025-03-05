require("util")
require("sound-util")
require("circuit-connector-sprites")
require("__space-age__.prototypes.entity.circuit-network")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")




local graphics_frame_count = 120
local graphics_animation_speed = 0.5
local graphics_shift = {0, -0.4}
local graphics_scale = 0.5
local graphics_set = {
  animation = {
    layers = {
      {
        priority = "high",
        filename = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-hr-shadow.png",
        width = 900,
        height = 800,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = 1,
        repeat_count = graphics_frame_count,
        draw_as_shadow = true,
        animation_speed = graphics_animation_speed,
      },
      {
        priority = "high",
        width = 4320 / 8,
        height = 4640 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        animation_speed = graphics_animation_speed,
        stripes = {
          {
            filename = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-hr-animation-2.png",
            width_in_frames = 8,
            height_in_frames = 7,
          },
        },
      },
    },
  },
  working_visualisations = {
    {
      fadeout = true,
      effect = "flicker",
      animation = {
        priority = "high",
        width = 4320 / 8,
        height = 4640 / 8,
        shift = graphics_shift,
        scale = graphics_scale,
        frame_count = graphics_frame_count,
        draw_as_glow = true,
        animation_speed = graphics_animation_speed,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 7,
          },
        },
      },
      reset_animation_when_frozen = true,
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
    pipe_connections = {{flow_direction="input", direction = defines.direction.south, position = {-1.5, 3.5}}}
  },
  {
    production_type = "input",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{flow_direction="input", direction = defines.direction.south, position = {1.5, 3.5}}}
  },
  {
    production_type = "output",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{flow_direction="output", direction = defines.direction.north, position = {-1.5, -3.5}}}
  },
  {
    production_type = "output",
    pipe_picture = util.empty_sprite(),
    -- pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
    pipe_covers = pipecoverspictures(),
    always_draw_covers = false,
    volume = 1000,
    pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1.5, -3.5}}}
  }
}


data:extend({
  {
    type = "recipe-category",
    name = "early-metallurgy"
  }
})

data:extend({
  {
    type = "assembling-machine",
    name = "early-foundry",
    icon = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "foundry"},
    fast_replaceable_group = "foundry",
    max_health = 350,
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-3.7, -3.7}, {3.7, 3.7}},
    selection_box = {{-4, -4}, {4, 4}},
    heating_energy = "300kW",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    effect_receiver = { base_effect = { productivity = 0.5 }},
    module_slots = 4,
    icon_draw_specification = {scale = 2.5, shift = {0, -0.5}},
    icons_positioning = {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"early-metallurgy"},
    crafting_speed = 4,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "2500kW",
    fluid_boxes = fluid_boxes,
    graphics_set = graphics_set,
    fluid_boxes_off_when_no_fluid_recipe = true,
    perceived_performance = {minimum = 0.25, maximum = 20},
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound = {
      sound = {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents = {
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9 }, frame = 2, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65 }, frame = 18, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45 }, frame = 39, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7 }, frame = 43, audible_distance_modifier = 0.4 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8 )}, frame = 64, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65 }, frame = 64, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65 }, frame = 74, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75 }, frame = 106, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8 }, frame = 106, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7 )}, frame = 110 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65 }, frame = 120, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7 }, frame = 126 },
      },
      audible_distance_modifier = 0.6,
      max_sounds_per_type = 2
    },
  }
})

-- Recipe for the foundry
data:extend({
  {
    type = "recipe",
    name = "early-foundry",
    category = "metallurgy-or-assembling",
    enabled = false,
    ingredients = {
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "concrete", amount = 100},
      {type = "item", name = "electronic-circuit", amount = 30}
    },
    energy_required = 10,
    results = {{type="item", name="early-foundry", amount=1}}
  },
  {
    type = "item",
    name = "early-foundry",
    icon = "__micaalle_Graphics__/graphics/alloy-forge/alloy-forge-icon.png",
    subgroup = "smelting-machine",
    order = "d[foundry]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "early-foundry",
    stack_size = 20,
    weight = 200 * kg
  },
})
