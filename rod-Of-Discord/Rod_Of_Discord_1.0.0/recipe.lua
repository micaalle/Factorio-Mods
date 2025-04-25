local rodOfDiscordRecipe = {
    type = "recipe",
    name = "rod-Of-Discord-recipe",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-b[remote]-a[rodOfDiscord]",
    ingredients = {
        {type = "item", name = "advanced-circuit", amount = 50},
        {type = "item", name = "iron-stick", amount = 1},
        {type = "item", name = "processing-unit", amount = 25},
    },
    energy_required = .5,
    results = {
        {type = "item", name = "RodOfDiscord", amount = 100}
      },
    enabled = false
}

data:extend({
    rodOfDiscordRecipe
})
