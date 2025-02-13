script.on_event(defines.events.on_entity_died, function(event)
  local entity = event.entity

  if entity.name == "explosive-rc-car" then
      local surface = entity.surface
      local position = entity.position
      local radius = 15  
      local damage = 2000

      for _, nearby_entity in pairs(surface.find_entities_filtered{
          area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}},
      }) do
          if nearby_entity and nearby_entity.valid and nearby_entity.health then
              nearby_entity.damage(damage, entity.force, "explosion")
          end
      end

      surface.create_entity{
          name = "rc-car-explosion",  
          position = position,
          force = entity.force
      }
  end
end)
