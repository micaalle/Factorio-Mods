local i = 1
local additional_damage = 0

while true do
  local technology = data.raw.technology["physical-projectile-damage-" .. i]

  if not technology then
    break
  end

  if technology.effects then
    for _, effect in ipairs(technology.effects) do
      if effect.type == "ammo-damage" and effect.ammo_category == "cannon-shell" then
        -- Add the technology's damage increase to the explosion damage
        additional_damage = additional_damage + (1 + effect.modifier)
      end
    end
  end

  i = i + 1
end

-- Update the explosion damage with the additional damage from technologies
data.raw.explosion["rc-car-explosion"].created_effect.action_delivery.target_effects[1].action.action_delivery.target_effects[1].damage.amount = 3000 * additional_damage