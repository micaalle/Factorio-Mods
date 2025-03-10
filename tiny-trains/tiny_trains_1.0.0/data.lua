
require("tiny-trains")
require("recipe")
require("technology")

local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item-with-entity-data",
    name = "small-locomotive",
    icon = "__base__/graphics/icons/locomotive.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-a[locomotive]",
    inventory_move_sound = item_sounds.locomotive_inventory_move,
    pick_sound = item_sounds.locomotive_inventory_pickup,
    drop_sound = item_sounds.locomotive_inventory_move,
    place_result = "small-locomotive",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "small-cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-b[cargo-wagon]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.locomotive_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "small-cargo-wagon",
    stack_size = 5,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "rail-planner",
    name = "small-rail",
    icon = "__base__/graphics/icons/rail.png",
    localised_name = {"item-name.rail"},
    subgroup = "train-transport",
    order = "a[rail]-a[rail]",
    inventory_move_sound = item_sounds.train_inventory_move,
    pick_sound = item_sounds.train_inventory_pickup,
    drop_sound = item_sounds.train_inventory_move,
    place_result = "small-straight-rail",
    stack_size = 100,
    rails = {
      "small-straight-rail",
      "small-curved-rail-a",
      "small-curved-rail-b",
      "small-half-diagonal-rail"
    },
    manual_length_limit = 22.5 -- 2*(Curved-A) + 2*(Curved-B) + their planner penalty + margin
  },
  {
    type = "item",
    name = "small-train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    subgroup = "train-transport",
    order = "b[train-automation]-a[train-stop]",
    inventory_move_sound = item_sounds.train_inventory_move,
    pick_sound = item_sounds.train_inventory_pickup,
    drop_sound = item_sounds.train_inventory_move,
    place_result = "train-stop",
    stack_size = 10
  },
  {
    type = "item",
    name = "small-rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    subgroup = "train-transport",
    order = "b[train-automation]-b[rail-signal]",
    inventory_move_sound = item_sounds.rail_signal_inventory_move,
    pick_sound = item_sounds.rail_signal_inventory_pickup,
    drop_sound = item_sounds.rail_signal_inventory_move,
    place_result = "small-rail-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "small-rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    subgroup = "train-transport",
    order = "b[train-automation]-c[rail-chain-signal]",
    inventory_move_sound = item_sounds.rail_signal_inventory_move,
    pick_sound = item_sounds.rail_signal_inventory_pickup,
    drop_sound = item_sounds.rail_signal_inventory_move,
    place_result = "small-rail-chain-signal",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "small-fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-c[small-fluid-wagon]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "small-fluid-wagon",
    stack_size = 5,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item-with-entity-data",
    name = "small-artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-d[small-artillery-wagon]",
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
    place_result = "small-artillery-wagon",
    stack_size = 5
  },
})
