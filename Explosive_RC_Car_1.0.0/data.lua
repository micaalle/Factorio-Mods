
local explosive_rc_car = table.deepcopy(data.raw["car"]["car"])


explosive_rc_car.name = "explosive-rc-car"
explosive_rc_car.icon = "__base__/graphics/icons/car.png" 
explosive_rc_car.icon_size = 32
explosive_rc_car.subgroup = "transport"
explosive_rc_car.order = "z[explosive-rc-car]"
explosive_rc_car.max_health = 50  
explosive_rc_car.picture = {
    filename = "__base__/graphics/entity/car/car.png",
    width = 176,
    height = 176,
    scale = 0.25  
}
explosive_rc_car.allow_remote_driving = true  
explosive_rc_car.weight = 100
explosive_rc_car.friction = 2e-3
explosive_rc_car.rotation_speed = 0.020


data:extend({
    {
        type = "item",
        name = "explosive-rc-car",
        icon = "__base__/graphics/icons/car.png",
        icon_size = 32,
        subgroup = "transport",
        order = "z[explosive-rc-car]",
        stack_size = 1
    },
    

    explosive_rc_car,
    

    {
        type = "explosion",
        name = "rc-car-explosion",
        flags = {"not-on-map"},
        animations = {
            {
                filename =  "__base__/graphics/entity/big-explosion/big-explosion.png",
                width = 128,
                height = 128,
                frame_count = 32,
                line_length = 8,
                animation_speed = 0.5,
                blend_mode = "additive",
                priority = "high"
            }
        },
        light = {intensity = 1, size = 20},
        sound = {
            {
                filename = "__base__/sound/fight/large-explosion-2.ogg",
                volume = 1.0
            }
        },
        damage = {
            amount = 500,
            type = "explosion"
        }
    }
})
data:extend({
    {
      type = "recipe",
      name = "explosive-rc-car",
      enabled = false,
      energy_required = 2,
      ingredients = {
        {"engine-unit", 8},
        {"iron-plate", 20},
        {"steel-plate", 5}
      },
      result = "explosive-rc-car"
    }
  })
  data:extend({
    {
      type = "technology",
      name = "explosive-rc-car",
      icon = "__base__/graphics/icons/car.png",
      icon_size = 256,
      unit = {
          count_formula = 100,
          ingredients = {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1}
          },
          time = 30,
      },
      effects = 
      {
          {type = "unlock-recipe", recipe = "explosive-rc-car"},
      }
    }
  })