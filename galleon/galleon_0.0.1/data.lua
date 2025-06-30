local pirate_ship = table.deepcopy(data.raw["car"]["car"])

pirate_ship.name = "pirateship"
pirate_ship.icon = "__pirateship__/Graphics/pirateship.png"
pirate_ship.icon_size = 1000
pirate_ship.collision_mask = { layers = { ground_tile = true, train = true, car = true, is_object = true } }
pirate_ship.collision_box = {{-1.2, -3}, {1.2, 3}}
--pirate_ship.selection_box = {{-1.2, -3}, {1.2, 3}}
pirate_ship.selection_priority = 60
pirate_ship.max_health = 3000
pirate_ship.weight = 1000
pirate_ship.braking_power = "200kW"
pirate_ship.friction = 0.002
pirate_ship.terrain_friction_modifier = 0.2
pirate_ship.minable = { mining_time = 1, result = "pirateship" }
pirate_ship.rotation_speed = 0.010
pirate_ship.inventory_size = 80
pirate_ship.energy_source = { type = "void" }

pirate_ship.working_sound = {
  sound = {
    filename = "__pirateship__/Sound/ship-sailing.ogg",
    volume = 0.7,
    min_speed = 0.6,
    max_speed = 0.9,
  },
  activate_sound = {
    filename = "__pirateship__/Sound/ship-start.ogg",
    volume = 1,
    speed = 0.6,
  },
  deactivate_sound = {
    filename = "__pirateship__/Sound/ship-start.ogg",
    volume = 1,
    speed = 0.6,
  },
  match_speed_to_activity = true
}
pirate_ship.stop_trigger =
    {
      {
        type = "play-sound",
        sound = {filename = "__pirateship__/Sound/ship-start.ogg", volume = .5}
      }
    }
pirate_ship.animation = {
  layers = {
    {
      priority = "low",
      direction_count = 128,
      width = 1002,
      height = 1002,
      stripes = {
        {
          filename = "__pirateship__/Graphics/newRend_0.png",
          width_in_frames = 8,
          height_in_frames = 8
        },
        {
          filename = "__pirateship__/Graphics/newRend_1.png",
          width_in_frames = 8,
          height_in_frames = 8
        }
      },
      shift = util.by_pixel(0, 0),
      scale = 0.5,
      max_advance = 0.2
    }
  }
}

pirate_ship.turret_animation = nil
pirate_ship.light_animation = nil
pirate_ship.corpse = nil

data:extend{pirate_ship}

data:extend{
  {
    type = "item-with-entity-data",
    name = "pirateship",
    icon = "__pirateship__/Graphics/pirateship.png",
    icon_size = 1000,
    subgroup = "transport",
    order = "a[water-system]-f[pirateship]",
    place_result = "pirateship",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "pirateship",
    enabled = true,
    energy_required = 3,
    ingredients = {
      {type = "item", name = "wood", amount = 4}
    },
    results = {
      {type = "item", name = "pirateship", amount = 1}
    }
  },
  {
    type = "technology",
    name = "Pirate_Ship",
    icon = "__pirateship__/Graphics/pirateship.png",
    icon_size = 1000,
    prerequisites = {"automobilism"},
    effects = {
      {type = "unlock-recipe", recipe = "pirateship"}
    },
    unit = {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  }
}

data:extend({
  {
    type = "custom-input",
    name = "enter-pirate-ship",
    key_sequence = "SHIFT + ENTER",
    consuming = "game-only"
  }
})
