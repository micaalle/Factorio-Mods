
function find_valid_position(player, teleport_pos)
    local valid_position = player.surface.find_non_colliding_position("character", teleport_pos, 2, 1)
    return valid_position
  end
  
  
  script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id == "teleport_effect" then
      if not event.source_entity then
        return
      end
      local teleport_pos = event.target_position
      local player = event.source_entity
      local valid_position = find_valid_position(player, teleport_pos)
      if valid_position then
        player.teleport(valid_position)
      end
    else
      return
    end
  end)

