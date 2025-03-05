data:extend({
    {
      type = "technology",
      name = "early-foundry",  
      icon = "__space-age__/graphics/icons/foundry.png",  
      icon_size = 64, 
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "early-foundry"
        },
        {
          type = "unlock-recipe",
          recipe = "concrete-from-molten-iron"
        },
        {
          type = "unlock-recipe",
          recipe = "casting-low-density-structure"
        },
        {
          type = "unlock-recipe",
          recipe = "early-molten-iron"
        },
        {
          type = "unlock-recipe",
          recipe = "early-molten-copper"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-iron"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-steel"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-copper"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-iron-gear-wheel"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-iron-stick"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-pipe"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-pipe-to-ground"
        },
        {
          type = "unlock-recipe",
          recipe = "early-casting-copper-cable"
        },
      },
      prerequisites = {"concrete"},  
      unit = {
        count = 100,  
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
        time = 30,  
      },
      order = "a-b-c",
    }
  })
  

  data:extend({
    {
      type = "technology",
      name = "core-drill",  
      icon = "__micaalle_Graphics__/graphics/core-extractor/core-extractor-icon.png",  
      icon_size = 64, 
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "core-drill"
        },
        {
          type = "unlock-recipe",
          recipe = "core-mining"
        },
        {
          type = "unlock-recipe",
          recipe = "mc-oxidizer"
        },
        {
          type = "unlock-recipe",
          recipe = "mc-chemical-stager"
        },
        {
          type = "unlock-recipe",
          recipe = "mc-greenhouse"
        },
        {
          type = "unlock-recipe",
          recipe = "mc-mill"
        },
        {
          type = "unlock-recipe",
          recipe = "mc-scrubber"
        },
      },
      prerequisites = {"lubricant"},  
      unit = {
        count = 100,  
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack",1},
        },
        time = 30,  
      },
      order = "a-b-c",
    }
  })
  
