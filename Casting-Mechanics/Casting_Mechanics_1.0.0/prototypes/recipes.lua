data:extend({
    --Recipes
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
      },
      allow_productivity = true,
      hide_from_signal_gui = false,
      main_product =  "molten-iron"
    },
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
      main_product =  "molten-copper"
    },
    
    -- remove alternate basic resource recipes.
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
      allow_productivity = true
    },
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
        {type = "fluid", name = "molten-iron", amount = 30, fluidbox_multiplier = 10}
      },
      energy_required = 3.2,
      allow_decomposition = false,
      results = {{type = "item", name = "steel-plate", amount = 1}},
      allow_productivity = true
    },
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
      allow_productivity = true
    },
    
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
      allow_productivity = true
    },
    
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
      allow_productivity = true
    },
    
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
      allow_productivity = false
    },
    
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
      allow_productivity = false
    },
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
      allow_productivity = true
    },
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
      allow_productivity = true
    },
    {
      type = "recipe",
      name = "core-mining",
      category = "core-mining",
      subgroup = "vulcanus-processes",
      order = "b[core-mining]",
      icon = "__space-age__/graphics/icons/fluid/lava.png",
      enabled = false,
      ingredients =
      {
        {type = "fluid", name = "water", amount = 100, fluidbox_multiplier = 5},
      },
      energy_required = 1,
      allow_decomposition = false,
      results = {
        {type = "fluid", name = "lava", amount = 500},
        {type = "item", name = "stone", amount = 15},
      },
      allow_productivity = true
    },
    
    })