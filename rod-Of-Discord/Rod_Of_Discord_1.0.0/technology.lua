local rodOfDiscordTech = {
    type = "technology",
    name = "rod-Of-Discord-technology",
    icon = "__Rod_Of_Discord__/assets/ROD.png",
    icon_size = 34,
    unit = {
      count = 150,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
    },
    prerequisites = {"processing-unit"},
    effects = {
      {
        type  = "unlock-recipe",
        recipe = "rod-Of-Discord-recipe"
      }
    }
  }
  
  data:extend({
    rodOfDiscordTech
  })
  