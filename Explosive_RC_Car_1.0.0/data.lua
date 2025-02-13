local sounds = require("__base__.prototypes.entity.sounds")
local explosive_rc_car = table.deepcopy(data.raw["car"]["car"])

explosive_rc_car.name = "explosive-rc-car"
explosive_rc_car.type = "car"
explosive_rc_car.icon = "__base__/graphics/icons/car.png"
explosive_rc_car.icon_size = 64
explosive_rc_car.subgroup = "transport"
explosive_rc_car.minable.result = "explosive-rc-car"
explosive_rc_car.order = "z[explosive-rc-car]"
explosive_rc_car.max_health = 50
explosive_rc_car.placeable = true
explosive_rc_car.chunk_exploration_radius = 3
explosive_rc_car.picture = {
    filename = "__base__/graphics/entity/car/car.png",
    width = 176,
    height = 176,
    scale = .5
}
explosive_rc_car.allow_remote_driving = true
explosive_rc_car.weight = 100
explosive_rc_car.friction = 2e-3
explosive_rc_car.rotation_speed = 0.020
explosive_rc_car.collision_box = {{-0.5, -0.5}, {0.5, 0.5}} 
explosive_rc_car.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}


explosive_rc_car.dying_explosion = "rc-car-explosion"


data:extend({
    {
        type = "item",
        name = "explosive-rc-car",
        icon = "__base__/graphics/icons/car.png",
        icon_size = 64,
        subgroup = "transport",
        order = "z[explosive-rc-car]",
        place_result = "explosive-rc-car",
        stack_size = 1
    },

    explosive_rc_car,

    {
        type = "explosion",
        name = "rc-car-explosion",
        flags = {"not-on-map"},
        animations = {
            {
                animation_speed = 0.25,
                filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
                frame_count = 47,
                height = 245,
                line_length = 6,
                width = 197,
                scale = 8,
                shift = {0, -5}
            }
        },
        light = {intensity = 1, size = 20},
        sound = {
            {
                filename = "__base__/sound/fight/large-explosion-2.ogg",
                volume = 1.0
            }
        },
    }
})

data:extend({
    {
        type = "recipe",
        name = "explosive-rc-car",
        enabled = true,
        energy_required = 2,
        ingredients = {
            {type = "item", name = "engine-unit", amount = 8},
            {type = "item", name = "iron-plate", amount = 20},
            {type = "item", name = "steel-plate", amount = 5}
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
        icon = "__base__/graphics/icons/car.png",
        icon_size = 64,
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 30,
        },
        effects = {
            {type = "unlock-recipe", recipe = "explosive-rc-car"},
        }
    }
})
