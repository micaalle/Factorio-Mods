local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
      type = "item",
      name = "slag",
      icon = "__micaalle_Graphics__/graphics/items/slag-ore.PNG",
      pictures = {
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/slag-ore.PNG", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/slag-ore-1.PNG", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/slag-ore-2.PNG", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/slag-ore-3.PNG", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "raw-resource",
      order = "d[slag]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2 * kg
    },
    {
        type = "item",
        name = "crushed-core",
        icon = "__micaalle_Graphics__/graphics/items/crushed-core.png",
        pictures = {
          { size = 64, filename = "__micaalle_Graphics__/graphics/items/crushed-core.png", scale = 0.5, mipmap_count = 4 },
          { size = 64, filename = "__micaalle_Graphics__/graphics/items/crushed-core-1.png", scale = 0.5, mipmap_count = 4 }
        },
        subgroup = "raw-resource",
        order = "d[crushed-core]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 3 * kg
    },
    {
        type = "item",
        name = "filter-clean",
        icon = "__micaalle_Graphics__/graphics/items/filter-clean.PNG",
        pictures = {
          { size = 64, filename = "__micaalle_Graphics__/graphics/items/filter-clean.PNG", scale = 0.5, mipmap_count = 4 },
        },
        subgroup = "intermediate-product",
        order = "d[filter-clean]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 3 * kg
        
    },
    {
        type = "item",
        name = "filter-dirty",
        icon = "__micaalle_Graphics__/graphics/items/filter-dirty.PNG",
        pictures = {
          { size = 64, filename = "__micaalle_Graphics__/graphics/items/filter-dirty.PNG", scale = 0.5, mipmap_count = 4 },
        },
        subgroup = "intermediate-product",
        order = "d[filter-dirty]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 3 * kg
    },
  })

