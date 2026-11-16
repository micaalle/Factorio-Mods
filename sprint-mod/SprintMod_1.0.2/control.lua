local function modify_speed(player, speed)
    local value = settings.get_player_settings(player)[speed].value
    player.character_running_speed_modifier = value
end

local function set_runspeed(event, setting)
    local player = game.players[event.player_index]
    if player.character ~= nil then
        if (player.character_running_speed_modifier == settings.get_player_settings(player)["walking"].value) then
            modify_speed(player, "thrembo")
        else
            modify_speed(player, "walking")
        end

    end
end

script.on_event("toggle-sprint", function(event)
    set_runspeed(event, "thrembo")
end)
