
local nauvis = data.raw.planet["nauvis"]


nauvis.persistent_ambient_sounds = nauvis.persistent_ambient_sounds or {}
nauvis.persistent_ambient_sounds.semi_persistent = {
    {sound = 
      {filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.2}
    } 
}

nauvis.player_effects = {
    type = "cluster",
    cluster_count = 25, 
    distance = 7,  
    distance_deviation = 9, 
    action_delivery = {
        type = "instant",
        source_effects = {
            type = "create-trivial-smoke",
            smoke_name = "gleba-raindrops",  
            speed = {x = -0.07, y = 0.6},  
            initial_height = 1.2, 
            speed_multiplier = 2.1,  
            speed_multiplier_deviation = 0.08,  
            offset_deviation = {{x = -100, y = -60}, {x = 100, y = 45}}, 
            speed_from_center = 0.015,  
        }
    }
}

nauvis.ticks_between_player_effects = 1.5 
