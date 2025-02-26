script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
  
    if entity.name == "explosive-rc-car" then
        local surface = entity.surface
        local position = entity.position
        local radius = 15  

        local base_damage = 2000
        local force = entity.force 
  
        local modifier = 0


        for i = 1, 7 do
            local tech_name = "stronger-explosives-" .. i
            local technology = force.technologies[tech_name]

            if technology and technology.researched then
                modifier = modifier + 0.4
            end
        end

      
        if modifier > 0 then
            base_damage = base_damage * (1 + modifier)
        end

       
        for _, nearby_entity in pairs(surface.find_entities_filtered{
            area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}},
        }) do
            if nearby_entity and nearby_entity.valid and nearby_entity.health then
                nearby_entity.damage(base_damage, entity.force, "explosion")
            end
        end
 
        surface.create_entity{
            name = "rc-car-explosion",  
            position = position,
            force = entity.force
        }

        entity.destroy()
    end
end)
