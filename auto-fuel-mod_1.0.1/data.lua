local afc = table.deepcopy(data.raw.container["steel-chest"])
afc.type = "container"
afc.name = "auto-fuel-chest"
afc.icon = "__auto-fuel-mod__/graphics/auto_fuel_chest.png"
afc.icon_size = 64
afc.minable.result = "auto-fuel-chest"
afc.order = "a[items]-c[auto-fuel-chest]"
afc.picture =
{
  layers =
  {
    {
      filename = "__auto-fuel-mod__/graphics/auto_fuel_chest.png",
      priority = "extra-high",
      width = 64,
      height = 80,
      shift = util.by_pixel(-0.25, -0.5),
      scale = 0.5
    },
    {
      filename = "__auto-fuel-mod__/graphics/autofuelchestshadow.png",
      priority = "extra-high",
      width = 110,
      height = 46,
      shift = util.by_pixel(12.25, 8),
      draw_as_shadow = true,
      scale = 0.5
    }
  }
}

data:extend({
  afc,
  {
    type = "item",
    name = "auto-fuel-chest",
    icon = "__auto-fuel-mod__/graphics/auto_fuel_chest.png",
    icon_size = 64,    
    subgroup = "storage",
    order = "a[items]-c[auto-fuel-chest]",
    place_result = "auto-fuel-chest",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "auto-fuel-chest",
    enabled = true,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 12}
    },
    results = {{type = "item", name = "auto-fuel-chest", amount = 1}}
  },
})
