-- Ensure the player’s spawn point is set when the beacon is placed
script.on_event(defines.events.on_built_entity, function(event)
  local entity = event.created_entity
  if not entity then
      game.print("Error: Entity is nil! Event triggered, but no entity found.")
      return
  end

  -- Debugging: Log the entity details
  game.print("Respawn beacon placed at position: " .. serpent.line(entity.position))

  if entity.name == "respawn-beacon" then
      -- Set the spawn point when the respawn beacon is placed
      global.respawn_point = entity.position
      game.print("Respawn point set to beacon at position: " .. serpent.line(global.respawn_point))
  end
end)

-- Handle player respawn to make sure the spawn point is set to the beacon if it exists
script.on_event(defines.events.on_player_respawned, function(event)
  local player = game.players[event.player_index]
  if not global.respawn_point then
      game.print("No respawn point set, spawning at the default location.")
      return
  end

  -- Set the player's spawn position to the beacon's position
  player.teleport(global.respawn_point)
  game.print("Player respawned at the respawn beacon position.")
end)

-- Ensure global table exists
if not global.respawn_point then
  global.respawn_point = nil
end
