local teleport = {
    type = "projectile",
    name = "teleport-projectile",
    flags = {"not-on-map"},
    acceleration = 1,
    action =
    {
      {

        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              particle_name = "pink-poison-capsule-metal-particle",
              repeat_count = 8,
              initial_height = 1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.05,
              offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.01,
              
            }
          }
        }
      },
      {

        type = "direct",
        action_delivery =
        {
          {
            type = "instant",
            target_effects = {
              type = "script",
              effect_id = "teleport_effect"
              }
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
  }

data:extend({
  teleport
})
