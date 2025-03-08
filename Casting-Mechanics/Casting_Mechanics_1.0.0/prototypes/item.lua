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
    {
      type = "item",
      name = "scrubbed-pollutants",
      icon = "__micaalle_Graphics__/graphics/items/scrubbed-pollutants.PNG",
      pictures = {
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/scrubbed-pollutants.PNG", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__micaalle_Graphics__/graphics/items/scrubbed-pollutants-1.PNG", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "intermediate-product",
      order = "d[scrubbed-pollutants]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 3 * kg
  },
  {
    type = "item",
    name = "processed-wood",
    icon = "__micaalle_Graphics__/graphics/items/processed-wood.png",
    pictures = {
      { size = 64, filename = "__micaalle_Graphics__/graphics/items/processed-wood.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "intermediate-product",
    order = "d[processed-wood]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 3 * kg
    
},
{
  type = "item",      --PLACEHOLDER IMAGE
  name = "wood-pulp",
  icon = "__micaalle_Graphics__/graphics/items/wood-pulp.png",
  pictures = {
    { size = 64, filename = "__micaalle_Graphics__/graphics/items/wood-pulp.png", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "intermediate-product",
  order = "d[wood-pulp]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  weight = 3 * kg
  
},
{
  type = "item",      --PLACEHOLDER IMAGE
  name = "cm-coolant",
  icon = "__micaalle_Graphics__/graphics/items/coolant.png",
  pictures = {
    { size = 64, filename = "__micaalle_Graphics__/graphics/items/coolant.png", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "intermediate-product",
  order = "d[cm-coolant]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  weight = 3 * kg
},
{
  type = "item",      --PLACEHOLDER IMAGE
  name = "cm-salt",
  icon = "__micaalle_Graphics__/graphics/items/salt.PNG",
  pictures = {
    { size = 64, filename = "__micaalle_Graphics__/graphics/items/salt.PNG", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "intermediate-product",
  order = "d[cm-salt]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  weight = 3 * kg
},
{
  type = "item",      --PLACEHOLDER IMAGE
  name = "cm-sodium",
  icon = "__micaalle_Graphics__/graphics/items/sodium.PNG",
  pictures = {
    { size = 64, filename = "__micaalle_Graphics__/graphics/items/sodium.PNG", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "intermediate-product",
  order = "d[cm-sodium]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  weight = 3 * kg
},
{
  type = "fluid",      --PLACEHOLDER IMAGE
  name = "cm-chlorine-gas",
  icon = "__micaalle_Graphics__/graphics/items/chlorine-gas.PNG",
  pictures = {
    { size = 64, filename = "__micaalle_Graphics__/graphics/items/chlorine-gas.PNG", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "intermediate-product",
  order = "d[cm-chlorine-gas]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  weight = 3 * kg
}
  })

