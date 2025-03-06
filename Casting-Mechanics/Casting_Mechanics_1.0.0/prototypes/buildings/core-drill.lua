require("sound-util")
require("circuit-connector-sprites")
require("util")
require("__space-age__.prototypes.entity.circuit-network")
require("__space-age__.prototypes.entity.space-platform-hub-cockpit")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")


data:extend({
  {
    type = "assembling-machine",
    name = "core-drill",
    icon = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-icon-big.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.5, result = "core-drill"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-5.3, -5.3}, {5.3, 5.3}},
    selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
    energy_source = {
      type = "electric",
      emissions_per_minute = {pollution = 200},
      usage_priority = "secondary-input"
    },
    energy_usage = "10000kW",
    resource_drain_rate_percent = 50,
    storage_output_offset = {0, 5.6},
    vector_to_place_result = {0, 5.6},
    crafting_categories = {"cm-core-mining"},
    crafting_speed = 1,
    monitor_visualization_tint = {r = 78, g = 173, b = 255},
    working_sound = {
      main_sounds = {
        sound = {filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-working-loop.ogg", volume = 0.3},
        fade_in_ticks = 4,
        fade_out_ticks = 30
      },
      sound_accents = {
        {
          sound = {filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-start.ogg", volume = 0.75},
          frame = 8,
          audible_distance_modifier = 0.3
        }
      },
      max_sounds_per_type = 1
    },
    fluid_boxes = {

      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{flow_direction = "output", direction = defines.direction.north, position = {-1, -4.6}}}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{flow_direction = "output", direction = defines.direction.north, position = {1, -4.6}}}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-hr-shadow.png",
            priority = "high",
            width = 1400,
            height = 1400,
            frame_count = 1,
            repeat_count = 120,
            animation_speed = 0.5,
            draw_as_shadow = true,
            scale = 0.5,
          },
          {
            priority = "high",
            width = 704,
            height = 704,
            frame_count = 120,
            animation_speed = 0.5,
            scale = 0.5,
            stripes = {
              {
                filename = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-hr-animation-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
              {
                filename = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-hr-animation-2.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
            },
          },
        },
      },
      working_visualisations = {
        {
          fadeout = true,
          animation = {
            priority = "high",
            width = 704,
            height = 704,
            frame_count = 120,
            animation_speed = 0.5,
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive",
            stripes = {
              {
                filename = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-hr-emission-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
              {
                filename = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-hr-emission-2.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
            },
          },
          reset_animation_when_frozen = true,
        },
      },
    },
  },
})

-- Recipe for the foundry
data:extend({
  {
    type = "recipe",
    name = "core-drill",
    category = "crafting-with-fluid",
    ingredients = {
      {type = "item", name = "advanced-circuit", amount = 50},
      {type = "item", name = "iron-gear-wheel", amount = 100},
      {type = "item", name = "steel-plate", amount = 300},
      {type = "item", name = "electric-engine-unit", amount = 50},
      {type = "fluid", name = "lubricant", amount = 300},
      {type = "item", name = "concrete", amount = 300},
    },
    enabled = false,
    energy_required = 10,
    results = {{type = "item", name = "core-drill", amount = 1}},
  },
  {
    type = "item",
    name = "core-drill",
    icon = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-icon.png",
    subgroup = "smelting-machine",
    order = "d[core-drill]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "core-drill",
    stack_size = 5,
    weight = 200 * kg
  },
})


