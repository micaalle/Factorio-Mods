local sounds = require("__base__.prototypes.entity.sounds")
local explosive_rc_car = table.deepcopy(data.raw["car"]["car"])
local explosion_animations = require("__base__.prototypes.entity.explosion-animations")


explosive_rc_car.name = "explosive-rc-car"
explosive_rc_car.type = "car"
explosive_rc_car.icon = "__Explosive_RC_Car__/graphics/RCcar.png"
explosive_rc_car.icon_size = 64
explosive_rc_car.subgroup = "transport"
explosive_rc_car.minable.result = "explosive-rc-car"
explosive_rc_car.order = "z[explosive-rc-car]"
explosive_rc_car.max_health = 50
explosive_rc_car.placeable = true
explosive_rc_car.chunk_exploration_radius = 3
explosive_rc_car.create_ghost_on_death = false
explosive_rc_car.picture = {
    filename = "__Explosive_RC_Car__/graphics/RCcar.png",
    width = 161,
    height = 176,
    scale = .25,
    render_layer = 'object'
}
explosive_rc_car.allow_remote_driving = true
explosive_rc_car.weight = 100
explosive_rc_car.friction = 2e-3
explosive_rc_car.rotation_speed = 0.020
explosive_rc_car.collision_box = {{-0.5, -0.5}, {0.5, 0.5}} 
explosive_rc_car.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}

explosive_rc_car.light_animation =
    {
      filename = "__base__/graphics/entity/car/car-light.png",
      priority = "low",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 206,
      height = 162,
      line_length = 8,
      direction_count = 64,
      scale = 0.25,
      shift = util.by_pixel(-1 + 2, -6 + 3),
      repeat_count = 2,
    }

explosive_rc_car.turret_animation =
{
  layers =
  {
    {
      priority = "low",
      width = 71,
      height = 57,
      direction_count = 64,
      shift = util.by_pixel(0+2, -13),
      animation_speed = 8,
      scale = 1,
      stripes =
      {
      {
      filename = "__base__/graphics/entity/car/car-turret-1.png",
      width_in_frames = 1,
      height_in_frames = 32
      },
      {
      filename = "__base__/graphics/entity/car/car-turret-2.png",
      width_in_frames = 1,
      height_in_frames = 32
      }
      }
    },
    {
      filename = "__base__/graphics/entity/car/car-turret-shadow.png",
      priority = "low",
      line_length = 8,
      width = 46,
      height = 31,
      scale = 0.75,
      draw_as_shadow = true,
      direction_count = 64,
      shift = {0.875, 0.359375}
    }
  }
}
explosive_rc_car.animation = {
      layers =
      {
        {
          priority = "low",
          width = 201,
          height = 172,
          frame_count = 2,
          scale = 0.25,
          direction_count = 64,
          shift = util.by_pixel(0+2, -11.5+8.5),
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
          {
          filename = "__base__/graphics/entity/car/car-1.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-2.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-3.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-4.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-5.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-6.png",
          width_in_frames = 2,
          height_in_frames = 9
          }
          }
        },
        {
          priority = "low",
          width = 199,
          height = 147,
          frame_count = 2,
          apply_runtime_tint = true,
          scale = 0.25,
          direction_count = 64,
          max_advance = 0.2,
          shift = util.by_pixel(0+2, -11+8.5),
          line_length = 1,
          stripes = util.multiplystripes(2,
          {
          {
          filename = "__base__/graphics/entity/car/car-mask-1.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-2.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-3.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-4.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-5.png",
          width_in_frames = 1,
          height_in_frames = 12
          }
          })
        },
        {
          priority = "low",
          width = 114,
          height = 76,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.28125, 0.25},
          max_advance = 0.2,
          scale = 0.5,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          })
        }
    },
}


explosive_rc_car.dying_explosion = "rc-car-explosion"


data:extend({
  {
      type = "item",
      name = "explosive-rc-car",
      icon = "__Explosive_RC_Car__/graphics/RCcar.png",
      icon_size = 173,
      subgroup = "transport",
      order = "z[explosive-rc-car]",
      place_result = "explosive-rc-car",
      stack_size = 1
  },

  explosive_rc_car,

  data:extend({
      {
          type = "explosion",
          name = "rc-car-explosion",
          flags = {"not-on-map"},
          scale = 2,
          animations = explosion_animations.nuke_explosion(),
          light = {intensity = 1, size = 20},
          sound = {
              {
                  filename = "__base__/sound/fight/large-explosion-2.ogg",
                  volume = 1.5
              }
          },
          created_effect = {
              type = "direct",
              action_delivery = {
                  type = "instant",
                  target_effects = {
                      {
                          type = "nested-result",
                          action = {
                              type = "area",
                              radius = 15,
                              action_delivery = {
                                  type = "instant",
                                  target_effects = {
                                      {
                                          type = "damage",
                                          damage = {amount = 3000, type = "explosion"}
                                      }
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  })
})


data:extend({
    {
        type = "recipe",
        name = "explosive-rc-car",
        enabled = false,
        energy_required = 2,
        ingredients = {
            {type = "item", name = "engine-unit", amount = 4},
            {type = "item", name = "iron-plate", amount = 10},
            {type = "item", name = "steel-plate", amount = 5},
            {type = "item", name = "explosives", amount = 50}
        },
        results = {
            {type = "item", name = "explosive-rc-car", amount = 1}
        }
    }
})

data:extend({
    {
        type = "technology",
        name = "explosive-rc-car",
        icon = "__Explosive_RC_Car__/graphics/RCcar.png",
        icon_size = 173,
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 30,
        },
        prerequisites = { "explosives" },
        effects = {
            {type = "unlock-recipe", recipe = "explosive-rc-car"},
        }
    }
})
