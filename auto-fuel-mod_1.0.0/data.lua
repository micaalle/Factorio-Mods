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
      height = 64,
      shift = util.by_pixel(0, -2),
      scale = 0.5
    },
    {
      filename = "__auto-fuel-mod__/graphics/autofuelchestshadow.png",
      priority = "extra-high",
      width = 50,
      height = 21,
      shift = util.by_pixel(12, 3),
      draw_as_shadow = true,
    }
  }
}

data:extend({
  afc,
  {
    type = "item",
    name = "auto-fuel-chest",
    icon = "__base__/graphics/entity/steel-chest/steel-chest.png",
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
