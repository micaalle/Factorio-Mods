require("util")

storage = storage or {}

function setup_mod_vars()
    storage.player_forces = storage.player_forces or {'player'}
    storage.surfaces = storage.surfaces or {'nauvis'}
end

function get_random_position_near_player(player_position, radius)
    return {
        x = player_position.x + math.random(-radius, radius),
        y = player_position.y + math.random(-radius, radius)
    }
end

function check_explosion_event(surface, player)
    local explosion_radius = 100
    local random_position = get_random_position_near_player(player.position, explosion_radius)
    create_explosions(surface, random_position)
end

function create_explosions(surface, target)
    local explosion_types = {"big-demolisher-fissure-explosion", "nuke-explosion"}
    local chosen_explosion = explosion_types[math.random(1, #explosion_types)]
    local explosion = surface.create_entity{name = chosen_explosion, position = target, force = game.forces.enemy}


    apply_explosion_damage(surface, target)
end


function apply_explosion_damage(surface, position)
    local damage_radius = 5 -- Adjust this radius as needed
    local entities_in_radius = surface.find_entities_filtered{
        area = {
            {position.x - damage_radius, position.y - damage_radius},
            {position.x + damage_radius, position.y + damage_radius}
        },
    }

    for _, entity in pairs(entities_in_radius) do
        if entity and entity.valid and entity.health then

            entity.damage(100, game.forces.enemy, "explosion")
        end
    end
end

setup_mod_vars()

script.on_event(defines.events.on_tick, function(event)
    if math.random(1, 100) == 1 then  
        for _, player in pairs(game.players) do
            if player and player.valid and player.surface then
                check_explosion_event(player.surface, player)
            end
        end
    end
end)
