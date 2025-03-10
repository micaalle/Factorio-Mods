data:extend({
    {
      type = "recipe",
      name = "small-rail",
      enabled = false,
      ingredients = {
        {type = "item", name = "stone", amount = 1},
        {type = "item", name = "iron-stick", amount = 1},
        {type = "item", name = "steel-plate", amount = 1}
      },
      results = {{type = "item", name = "small-rail", amount = 2}}
    },
    {
      type = "recipe",
      name = "small-locomotive",
      energy_required = 4,
      enabled = false,
      ingredients = {
        {type = "item", name = "engine-unit", amount = 20},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "steel-plate", amount = 30}
      },
      results = {{type = "item", name = "small-locomotive", amount = 1}}
    },
    {
      type = "recipe",
      name = "small-cargo-wagon",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "iron-plate", amount = 20},
        {type = "item", name = "steel-plate", amount = 20}
      },
      results = {{type = "item", name = "small-cargo-wagon", amount = 1}}
    },
    {
      type = "recipe",
      name = "small-rail-signal",
      enabled = false,
      ingredients = {
        {type = "item", name = "electronic-circuit", amount = 1},
        {type = "item", name = "iron-plate", amount = 5}
      },
      results = {{type = "item", name = "small-rail-signal", amount = 1}}
    },
    {
      type = "recipe",
      name = "small-rail-chain-signal",
      enabled = false,
      ingredients = {
        {type = "item", name = "electronic-circuit", amount = 1},
        {type = "item", name = "iron-plate", amount = 5}
      },
      results = {{type = "item", name = "small-rail-chain-signal", amount = 1}}
    },
    {
      type = "recipe",
      name = "small-train-stop",
      enabled = false,
      ingredients = {
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "iron-plate", amount = 6},
        {type = "item", name = "iron-stick", amount = 6},
        {type = "item", name = "steel-plate", amount = 3}
      },
      results = {{type = "item", name = "small-train-stop", amount = 1}}
    },
    {
        type = "recipe",
        name = "small-fluid-wagon",
        enabled = false,
        energy_required = 1.5,
        ingredients =
        {
          {type = "item", name = "iron-gear-wheel", amount = 10},
          {type = "item", name = "steel-plate", amount = 16},
          {type = "item", name = "pipe", amount = 8},
          {type = "item", name = "storage-tank", amount = 1}
        },
        results = {{type="item", name="small-fluid-wagon", amount=1}}
      },
      {
        type = "recipe",
        name = "small-artillery-wagon",
        energy_required = 4,
        enabled = false,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 64},
          {type = "item", name = "iron-gear-wheel", amount = 10},
          {type = "item", name = "steel-plate", amount = 40},
          {type = "item", name = "pipe", amount = 16},
          {type = "item", name = "advanced-circuit", amount = 20}
        },
        results = {{type="item", name="small-artillery-wagon", amount=1}}
      },
  })
  
