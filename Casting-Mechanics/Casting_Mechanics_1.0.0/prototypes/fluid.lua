data:extend(
{
  {
    type = "fluid",
    name = "cm-chlorine-gas",
    subgroup = "fluid",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.85, 1, 0.1},
    flow_color = {0.8, 1, 0.1},
    icon = "__micaalle_Graphics__/graphics/items/chlorine-gas.PNG",
    order = "a[fluid]-a[chlorine-gas]"
  },
  {
    type = "fluid",
    name = "molten-silicon",
    icon = "__micaalle_Graphics__/graphics/items/molten-silicon.png",
    subgroup = "fluid",
    order = "b[new-fluid]-a[molten-silicon]",
    default_temperature = 1500,
    max_temperature = 2000,
    heat_capacity = "0.01kJ",
    base_color = {0.1, 0.4, 0.35},
    flow_color = {0.3, 0.6, 0.6},
    auto_barrel = false
  },
})
