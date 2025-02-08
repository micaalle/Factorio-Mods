local config = require("config")

data:extend({
  -- Recipe for Respawn Beacon
  {
    type = "recipe",
    name = config.item_name,  -- use the name from the settings file
    enabled = false,  -- Disabled by default, will be unlocked via technology
    ingredients = {
      {type = "item", name = "stone-brick", amount = 50},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {
      {type = "item", name = config.item_name, amount = 1}  -- Result of crafting the respawn beacon
    },
  },

  -- Item definition for Respawn Beacon
  {
    type = "item",
    name = config.item_name,  -- use the name from the settings file
    icon = "__base__/graphics/icons/accumulator.png",  -- Placeholder icon
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "transport",
    stack_size = 50,
    place_result = config.entity_name,  -- use the name from the settings file
  },

  -- Respawn Beacon entity definition using container
  {
    type = "container",
    name = config.entity_name,  -- use the name from the settings file
    icon = "__base__/graphics/icons/accumulator.png",  -- Placeholder icon
    icon_size = 64,
    icon_mipmaps = 4,
    collision_box = {{-1, -1}, {1, 1}},  -- Entity collision box
    selection_box = {{-1, -1}, {1, 1}},  -- Entity selection box
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = config.item_name},  -- Can be mined to get the beacon item back
    max_health = 100,
    corpse = "small-remnants",  -- Corpse when destroyed
    resistances = {
      {type = "fire", percent = 90}  -- Fire resistance
    },
    picture = {
      filename = "__base__/graphics/entity/accumulator/accumulator.png",  -- Placeholder sprite
      width = 124,
      height = 103,
      shift = {0, 0},
    },
    order = "a[items]-a[respawn-beacon]",
    inventory_size = 0,  -- Container with no inventory (not used for item storage)
  },

  -- Technology definition for Respawn Beacon
  {
    type = "technology",
    name = config.tech_name,  -- use the name from the settings file
    icon = "__base__/graphics/icons/accumulator.png",  -- Placeholder icon
    icon_size = 64,
    effects = {
      {
        type = "unlock-recipe",
        recipe = config.item_name  -- Unlock the respawn beacon recipe when this tech is researched
      }
    },
    prerequisites = {"military"},  -- Unlocks after the military tech is researched
    unit = {
      count = 100,  -- Number of science packs needed to research
      ingredients = {
        {"automation-science-pack", 1},  -- Science packs needed for the research
        {"logistic-science-pack", 1}
      },
      time = 30  -- Time required for the research
    },
    order = "e-p-b-c",  -- Position in the technology tree
  },
})
