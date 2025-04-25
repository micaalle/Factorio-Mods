local rodOfDiscord = {
  type = "capsule",
  name = "RodOfDiscord",
  icon = "__Rod_Of_Discord__/assets/ROD.png",
  subgroup = "transport",
  order = "b[personal-transport]-c[spidertron]-b[remote]-a[rodOfDiscord]",
  icon_size = 34,

  capsule_action = {
    type = "throw",
    attack_parameters = {
      type = "projectile",
      activation_type = "throw",
      ammo_category = "capsule",
      cooldown = 30,
      projectile_creation_distance = 0,
      range = 64,
      ammo_type = {
        category = "capsule",
        target_type = "position",
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "teleport-projectile",
                starting_speed = 0.5
              }
            }
          },
          {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                {
                  type = "play-sound",
                  sound = {
                    {
                      filename = "__Rod_Of_Discord__/assets/Item_8.wav",
                      volume = 1.0
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  stack_size = 10000
}

data:extend({ rodOfDiscord })
