-- cm-core-mining recipe
data:extend({
  {
      type = "recipe",
      name = "cm-core-mining",
      category = "cm-core-mining",
      subgroup = "vulcanus-processes",
      order = "a[cm-core-mining]",
      auto_recycle = false,
      enabled = true,
      ingredients =
      {
          {type = "item", name = "cm-coolant", amount = 1},
      },
      energy_required = 32,
      results =
      {
          {type = "item", name = "stone", probability = 0.25, amount = 10},
          {type = "item", name = "crushed-core", probability = 0.6, amount = 10},
          {type = "fluid", name = "lava", probability = 0.05, amount = 500},
          {type = "item", name = "copper-ore", probability = 0.05, amount = 10},
          {type = "item", name = "iron-ore", probability = 0.05, amount = 10},
          {type = "item", name = "sulfur", probability = 0.05, amount = 10},
      },
      allow_productivity = true,
      main_product = 'crushed-core',
      hide_from_signal_gui = false,
  }
})




-- cm-chemical-stager recipe
data:extend({
  {
      type = "recipe",
      name = "cm-coolant",
      category = "cm-chemical-stager",
      subgroup = "vulcanus-processes",
      order = "a[cm-chemical-stager]",
      auto_recycle = false,
      enabled = true,
      ingredients =
      {
          {type = "fluid", name = "water", amount = 10},
          {type = "fluid", name = "crude-oil", amount = 10},
          {type = "item", name = "sulfur", amount = 10},
      },
      energy_required = 32,
      results =
      {
          {type = "item", name = "cm-coolant", amount = 10},
      },
      hide_from_signal_gui = false,
      allow_productivity = true,
  },
  {
    type = "recipe",
    name = "cm-salt",
    category = "cm-chemical-stager",
    subgroup = "vulcanus-processes",
    order = "a[cm-chemical-stager]",
    auto_recycle = false,
    enabled = true,
    ingredients =
    {
        {type = "fluid", name = "water", amount = 10},
    },
    energy_required = 32,
    results =
    {
        {type = "item", name = "cm-salt", amount = 10},
    },
    hide_from_signal_gui = false,
    allow_productivity = true,
},
{
  type = "recipe",
  name = "cm-electrolysis-of-salt",
  category = "cm-chemical-stager",
  subgroup = "vulcanus-processes",
  order = "a[cm-chemical-stager]",
  auto_recycle = false,
  enabled = true,
  ingredients =
  {
      {type = "item", name = "salt", amount = 10},
  },
  energy_required = 32,
  results =
  {
      {type = "fluid", name = "cm-chlorine-gas", amount = 10},
      {type = "item", name = "cm-sodium", amount = 10},
  },
  hide_from_signal_gui = false,
  allow_productivity = true,
  main_product = "cm-chlorine-gas",
},
})

-- early-molten-iron recipe
data:extend({
  {
      type = "recipe",
      name = "early-molten-iron",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "a[melting]-b[molten-iron]",
      auto_recycle = false,
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "lava", amount = 500},
      },
      energy_required = 32,
      results =
      {
          {type = "fluid", name = "molten-iron", amount = 250},
          {type = "item", name = "stone", amount = 10},
          {type = "item", name = "slag", amount = 10},
          {type = "item", name = "crushed-core", amount = 10},
          {type = "item", name = "filter-clean", amount = 10},
          {type = "item", name = "filter-dirty", amount = 10},
          {type = "item", name = "scrubbed-pollutants", amount = 10},
          {type = "item", name = "processed-wood", amount = 10},
          {type = "item", name = "wood-pulp", amount = 10},
      },
      allow_productivity = true,
      hide_from_signal_gui = false,
      main_product = "molten-iron",
  }
})

-- early-molten-copper recipe
data:extend({
  {
      type = "recipe",
      name = "early-molten-copper",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "a[melting]-c[molten-copper]",
      auto_recycle = false,
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "lava", amount = 500},
      },
      energy_required = 32,
      results =
      {
          {type = "fluid", name = "molten-copper", amount = 250},
          {type = "item", name = "stone", amount = 10},
      },
      hide_from_signal_gui = false,
      allow_productivity = true,
      main_product = "molten-copper",
  }
})

-- early-casting-iron recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-iron",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-a[casting-iron]",
      icon = "__space-age__/graphics/icons/casting-iron.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 20, fluidbox_multiplier = 10},
      },
      energy_required = 3.2,
      allow_decomposition = false,
      results = {{type = "item", name = "iron-plate", amount = 2}},
      allow_productivity = true,
  }
})

-- early-casting-steel recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-steel",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-c[casting-steel]",
      icon = "__space-age__/graphics/icons/casting-steel.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 30, fluidbox_multiplier = 10},
      },
      energy_required = 3.2,
      allow_decomposition = false,
      results = {{type = "item", name = "steel-plate", amount = 1}},
      allow_productivity = true,
  }
})

-- early-casting-copper recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-copper",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-b[casting-copper]",
      icon = "__space-age__/graphics/icons/casting-copper.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-copper", amount = 20, fluidbox_multiplier = 10},
      },
      energy_required = 3.2,
      allow_decomposition = false,
      results = {{type = "item", name = "copper-plate", amount = 2}},
      allow_productivity = true,
  }
})

-- early-casting-iron-gear-wheel recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-iron-gear-wheel",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-d[casting-iron-gear-wheel]",
      icon = "__space-age__/graphics/icons/casting-iron-gear-wheel.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {{type = "item", name = "iron-gear-wheel", amount = 1}},
      allow_productivity = true,
  }
})

-- early-casting-iron-stick recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-iron-stick",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-e[casting-iron-stick]",
      icon = "__space-age__/graphics/icons/casting-iron-stick.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 20, fluidbox_multiplier = 10},
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {{type = "item", name = "iron-stick", amount = 4}},
      allow_productivity = true,
  }
})

-- early-casting-pipe recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-pipe",
      category = "early-metallurgy",
      subgroup = "energy-pipe-distribution",
      order = "b[casting]-f[casting-pipe]",
      icon = "__space-age__/graphics/icons/casting-pipe.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {{type = "item", name = "pipe", amount = 1}},
      allow_productivity = false,
  }
})

-- early-casting-pipe-to-ground recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-pipe-to-ground",
      category = "early-metallurgy",
      subgroup = "energy-pipe-distribution",
      order = "b[casting]-g[casting-pipe-to-ground]",
      icon = "__space-age__/graphics/icons/casting-pipe-to-ground.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 50, fluidbox_multiplier = 10},
          {type = "item", name = "pipe", amount = 10}
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {{type = "item", name = "pipe-to-ground", amount = 2}},
      allow_productivity = false,
  }
})

-- early-concrete-from-molten-iron recipe
data:extend({
  {
      type = "recipe",
      name = "early-concrete-from-molten-iron",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-g[concrete]",
      icon = "__space-age__/graphics/icons/concrete-from-molten-iron.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-iron", amount = 20},
          {type = "fluid", name = "water", amount = 100},
          {type = "item", name = "stone-brick", amount = 5},
      },
      energy_required = 10,
      allow_decomposition = false,
      results = {{type = "item", name = "concrete", amount = 10}},
      allow_productivity = true,
  }
})

-- early-casting-copper-cable recipe
data:extend({
  {
      type = "recipe",
      name = "early-casting-copper-cable",
      category = "early-metallurgy",
      subgroup = "vulcanus-processes",
      order = "b[casting]-h[casting-copper-cable]",
      icon = "__space-age__/graphics/icons/casting-copper-cable.png",
      enabled = false,
      ingredients =
      {
          {type = "fluid", name = "molten-copper", amount = 5, fluidbox_multiplier = 5},
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {{type = "item", name = "copper-cable", amount = 2}},
      allow_productivity = true,
  }
})
