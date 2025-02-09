-- When a respawn beacon is placed
script.on_event(defines.events.on_built_entity, function(event)
  if event.entity.name == "respawn-beacon" then
    -- get the player
    local player = game.get_player(event.player_index)
    if player and player.character then
      -- find position
      local pos = event.entity.position
      pos.y = pos.y + 2  -- adjust spawn to right in front of the beacon
      
      player.print("Your spawn point has been set to: " .. "X: " .. pos.x .. ", Y: " .. pos.y)
      
      -- set player spawn point
      player.force.set_spawn_position(pos, event.entity.surface)
    end
  end
end)

-- when a beacon is destoryed
script.on_event(defines.events.on_entity_died, function(event)
  if event.entity.name == "respawn-beacon" then
    local player = game.get_player(event.player_index)
    if player and player.character then
      -- find the current spawn position
      local current_spawn = player.force.get_spawn_position(player.surface)  
      local beacon_position = event.entity.position  
      
      
      beacon_position.y = beacon_position.y + 2 
      
      -- reset spawn if and only if beacon is the current most recent instance
      if current_spawn.x == beacon_position.x and current_spawn.y == beacon_position.y then
        player.force.set_spawn_position({x = 0, y = 0}, player.surface)
        if player.surface.name == "nauvis" then
          player.print("Your spawn point has been reset to the origin: Ship wreck (0, 0) on surface: " .. player.surface.name)
        else
          player.print("Your spawn point has been reset to the origin: (0, 0) on surface: " .. player.surface.name)
        end
      end
    end
  end
end)

-- when mined by the player
script.on_event(defines.events.on_player_mined_entity, function(event)
  if event.entity.name == "respawn-beacon" then
    local player = game.get_player(event.player_index)
    if player and player.character then
      -- find the current spawn position
      local current_spawn = player.force.get_spawn_position(player.surface)  
      local beacon_position = event.entity.position  

      beacon_position.y = beacon_position.y + 2 
      
      -- reset spawn if and only if beacon is the current most recent instance
      if current_spawn.x == beacon_position.x and current_spawn.y == beacon_position.y then
        player.force.set_spawn_position({x = 0, y = 0}, player.surface)
        if player.surface.name == "nauvis" then
          player.print("Your spawn point has been reset to the origin: Ship wreck (0, 0) on surface: " .. player.surface.name)
        else
          player.print("Your spawn point has been reset to the origin: (0, 0) on surface: " .. player.surface.name)
        end
      end
    end
  end
end)
