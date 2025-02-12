
script.on_event(defines.events.on_player_selected_area, function(event)
    local player = game.players[event.player_index]
    

    if not player.force.rc_cars then
      player.force.rc_cars = {}
    end
  

    if event.item == "explosive-rc-car" then
      local car = player.selected
      if car and car.name == "explosive-rc-car" then

        table.insert(player.force.rc_cars, car)
      end
    end
  end)
  

  local function explode_rc_car(player, car)
    if car and car.valid then

      local explosion = car.surface.create_entity{
        name = "rc-car-explosion",
        position = car.position,
        force = "neutral"
      }
  
    
      car.destroy()
  

      player.play_sound{path = "__base__/sound/fight/explosion-1.ogg", volume = 0.8}
    end
  end
  

  script.on_event(defines.events.on_player_used_capsule, function(event)
    local player = game.players[event.player_index]

    if event.item.name == "explosive-rc-car" then
 
      local closest_car = nil
      local closest_distance = math.huge
      
      if player.force.rc_cars then
        for _, car in pairs(player.force.rc_cars) do
          if car and car.valid then
            local distance = player.position.distance(car.position)
            if distance < closest_distance then
              closest_car = car
              closest_distance = distance
            end
          end
        end

        if closest_car then
          explode_rc_car(player, closest_car)
        end
      end
    end
  end)
  