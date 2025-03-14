storage = storage or {}

function setup_mod_vars()
    storage.player_forces = storage.player_forces or {'player'}
    storage.surfaces = storage.surfaces or {'nauvis'}
end

function validate_surfaces_list()
    for s=#storage.surfaces,1,-1 do
        if not (game.surfaces[storage.surfaces[s]] and game.surfaces[storage.surfaces[s]].valid) then table.remove(storage.surfaces,s) end
    end
end
    

function CreateNewEvent(the_event,surfacename, forcename)
    validate_surfaces_list()
    
    local sufaces_tab = table.deepcopy(storage.surfaces)
    if surfacename then add_list(sufaces_tab, surfacename) end
    
    local next_waves={}

    for s=1,#sufaces_tab do
        local surface = game.surfaces[sufaces_tab[s]]
        
        if not the_event then the_event=pick_event() end
        
        for p=1,#storage.player_forces do
            local pforce = game.forces[storage.player_forces[p]]
            if surface and the_event and pforce and (not surfacename or surface.name==surfacename) and (not forcename or pforce.name==forcename) then 
                local player_spawn = pforce.get_spawn_position(surface)
                local pcount = #pforce.connected_players 
                if the_event == 'volcano' then
                    local last_building, player_chunks = FindTeamAttackCorner(surface, pforce, player_spawn, 1)
                    local rchunk = player_chunks[math.random(#player_chunks)]
                    local target = {x = rchunk.x * 32 + math.random(31), y = rchunk.y * 32 + math.random(31)}
                    
                    -- Removed the creation of the volcano entity
                    -- Instead, we keep the effects like explosions and sounds
                    surface.create_entity{name="nuke-explosion", position=target, force = game.forces.enemy} --big-artillery-explosion
                    if prototypes.entity["big-demolisher-fissure-explosion"] then 
                        surface.create_entity{name="big-demolisher-fissure-explosion", position=target, force = game.forces.enemy}
                    end
                end
            end
        end
    end
end

function Create_Position_Event(the_event, surface, position, pforce)
    if not (surface and surface.valid) then return end
    local pcount = #pforce.connected_players  
    if the_event == 'volcano' then
        local target = get_random_pos_near(position, 150)
        target = surface.find_non_colliding_position('rocket-silo', target, 50, 1)
        if target then 

            surface.create_entity{name="nuke-explosion", position=target, force = game.forces.enemy} 
            if prototypes.entity["big-demolisher-fissure-explosion"] then 
                surface.create_entity{name="big-demolisher-fissure-explosion", position=target, force = game.forces.enemy}
            end
        end
    end
end


function FindTeamAttackCorner(surface, force, initial_position, chunk_distance)
    local directionVec=GetRandomVector()
    if not chunk_distance then chunk_distance=4 end
    local enemy_spawn
    local nothing = 0
    local chunkPos = Chunk.from_position(initial_position)  
    local player_chunks = {chunkPos}
    local last_building = chunkPos

        while(not enemy_spawn) do
            chunkPos.x = chunkPos.x + directionVec.x
            chunkPos.y = chunkPos.y + directionVec.y

            if ((math.abs(chunkPos.x) > 2000) or (math.abs(chunkPos.y) > 2000)) then break
            
            elseif (surface.is_chunk_generated(chunkPos)) then
                local area = Chunk.to_area(chunkPos) 
                local builds = surface.find_entities_filtered{force=force,area=area,limit=1}
                if #builds>0 then 
                    last_building = table.deepcopy(chunkPos)
                    table.insert (player_chunks,table.deepcopy(chunkPos))
                    else
                    nothing = nothing + 1 
                    if nothing >= chunk_distance then enemy_spawn = chunkPos end 
                    end
                

            else break end
            end
    
    last_building = {x= last_building.x*32+math.random(31), y= last_building.y*32+math.random(31)}
    if enemy_spawn then 
        enemy_spawn = {x= enemy_spawn.x*32+math.random(31), y= enemy_spawn.y*32+math.random(31)}
        enemy_spawn = surface.find_non_colliding_position('rocket-silo', enemy_spawn, 100, 1)
        end
    
    return last_building, player_chunks, enemy_spawn
    end
    
    

setup_mod_vars()

script.on_event(defines.events.on_tick, function(event)
    if math.random(1, 100) == 1 then  
        for _, player in pairs(game.players) do
            if player and player.valid and player.surface then
                CreateNewEvent('volcano', player.surface.name, player.force.name)
            end
        end
    end
end)
