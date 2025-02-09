local config = require("config")

data:extend({
  {
    type = "recipe",
    name = "respawn-beacon",  
    enabled = false,  
    ingredients = {
      {type = "item", name = "stone-brick", amount = 50},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {
      {type = "item", name = "respawn-beacon", amount = 1}  
    },
  },
  {
    type = "item",
    name = "respawn-beacon",  
    icon = "__respawn-beacon__/graphics/respawn-beacon.png",  
    icon_size = 199,
    icon_mipmaps = 4,
    subgroup = "transport",
    stack_size = 1,
    place_result = "respawn-beacon",  
    weight = 10000000000
  },

  {
    type = "container",
    name = "respawn-beacon",  
    icon = "__respawn-beacon__/graphics/respawn-beacon.png", 
    icon_size = 128,
    icon_mipmaps = 4,
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},  
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},  
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "respawn-beacon"},  
    max_health = 100,
    corpse = "small-remnants",  
    picture = 
    {
      layers =
      {
        {
          filename = "__respawn-beacon__/graphics/respawn-beacon.png",  
          priority = "extra-high",
          width = 207,
          height = 199,
          scale = 0.5
      },
      {
        filename = "__respawn-beacon__/graphics/respawn-beacon-shadow.png",
        priority = "extra-high",
        width = 277,
        height = 149,
        scale = 0.5,
        shift = util.by_pixel(24, 10),
        draw_as_shadow = true,

      }
    },
  },
    order = "a[items]-a[respawn-beacon]",
    inventory_size = 0,  
  },

  {
    type = "technology",
    name = "respawn-beacon-tech", 
    icon = "__respawn-beacon__/graphics/respawn-beacon.png",  
    icon_size = 199,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "respawn-beacon"  
      }
    },
    prerequisites = {"military"},  
    unit = {
      count = 100,  
      ingredients = {
        {"automation-science-pack", 1}, 
        {"logistic-science-pack", 1}
      },
      time = 30  
    },
    order = "e-p-b-c",  
  },
})
