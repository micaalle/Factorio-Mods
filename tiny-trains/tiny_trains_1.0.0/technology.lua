data:extend({
    {
      type = "technology",
      name = "tiny-trains",
      icon = "__base__/graphics/technology/railway.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "small-rail"
        },
        {
          type = "unlock-recipe",
          recipe = "small-locomotive"
        },
        {
          type = "unlock-recipe",
          recipe = "small-cargo-wagon"
        },
        {
            type = "unlock-recipe",
            recipe = "small-train-stop"
          },
          {
            type = "unlock-recipe",
            recipe = "small-rail-signal"
          },
          {
            type = "unlock-recipe",
            recipe = "small-rail-chain-signal"
          },
          {
            type = "unlock-recipe",
            recipe = "small-artillery-wagon"
          },
          {
            type = "unlock-recipe",
            recipe = "small-fluid-wagon"
          },

      },
      prerequisites = {"automated-rail-transportation"},
      unit = {
        count = 75,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
        time = 30
      }
    }
  })
  
