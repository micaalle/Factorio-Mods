
local function init_chests()
 
end

local function on_chest_created(event)
  local entity = event.created_entity or event.entity
end


-- 1 tic every 2 seconds to save runtime
local check_interval = 120  
local ticks_since_last_check = 0

-- main function that fills 
local function on_tick(event)
  ticks_since_last_check = ticks_since_last_check + 1

 
  if ticks_since_last_check >= check_interval then
    ticks_since_last_check = 0


    for _, surface in pairs(game.surfaces) do
      
      local search_radius = 20 

      -- find stone furnaces
      local furnaces = surface.find_entities_filtered({
        type = "furnace",  
        name = "stone-furnace"
      })

      -- find boilers
      local boilers = surface.find_entities_filtered({
        type = "boiler",  
        name = "boiler"
      })

      -- find burner mining drills
      local burner_mining_drills = surface.find_entities_filtered({
        name = "burner-mining-drill",  
      })

      -- handling stone furnaces
      for _, furnace in pairs(furnaces) do
        if furnace and furnace.valid then
          local fuel_inventory = furnace.get_fuel_inventory()

          if fuel_inventory and fuel_inventory.valid then
            -- Check if the furnace needs fuel (empty, low fuel, or less than 50 coal)
            if fuel_inventory.get_item_count("coal") < 50 then
              -- Find nearby chests with coal (using furnace's position)
              local chests = surface.find_entities_filtered({
                name = "auto-fuel-chest", 
                position = furnace.position, 
                radius = 15
              })

              for _, chest in pairs(chests) do
                if chest.valid then
                  local coal_stack = chest.get_inventory(defines.inventory.chest).get_item_count("coal")
                  if coal_stack > 0 and fuel_inventory.get_item_count("coal") < 50 then
                    local chest_inventory = chest.get_inventory(defines.inventory.chest)
                    chest_inventory.remove({ name = "coal", count = 1 })
                    fuel_inventory.insert({ name = "coal", count = 1 })
                    break  -- Stop looking for chests once the furnace is fueled
                  end
                end
              end
            end
          end
        end
      end

      -- Handling boilers
      for _, boiler in pairs(boilers) do
        if boiler and boiler.valid then
          local fuel_inventory = boiler.get_fuel_inventory()

          if fuel_inventory and fuel_inventory.valid then
            if fuel_inventory.get_item_count("coal") < 50 then
              local chests = surface.find_entities_filtered({
                name = "auto-fuel-chest", 
                position = boiler.position, 
                radius = 15
              })

              for _, chest in pairs(chests) do
                if chest.valid then
                  local coal_stack = chest.get_inventory(defines.inventory.chest).get_item_count("coal")
                  if coal_stack > 0 and fuel_inventory.get_item_count("coal") < 50 then
                    local chest_inventory = chest.get_inventory(defines.inventory.chest)
                    chest_inventory.remove({ name = "coal", count = 1 })
                    fuel_inventory.insert({ name = "coal", count = 1 })
                    break  
                  end
                end
              end
            end
          end
        end
      end

      -- handling mining drills
      for _, drill in pairs(burner_mining_drills) do
        if drill and drill.valid then
          local fuel_inventory = drill.get_fuel_inventory()

          if fuel_inventory and fuel_inventory.valid then
            if fuel_inventory.get_item_count("coal") < 50 then
              local chests = surface.find_entities_filtered({
                name = "auto-fuel-chest", 
                position = drill.position, 
                radius = 15
              })

              for _, chest in pairs(chests) do
                if chest.valid then
                  local coal_stack = chest.get_inventory(defines.inventory.chest).get_item_count("coal")
                  if coal_stack > 0 and fuel_inventory.get_item_count("coal") < 50 then
                    local chest_inventory = chest.get_inventory(defines.inventory.chest)
                    chest_inventory.remove({ name = "coal", count = 1 })
                    fuel_inventory.insert({ name = "coal", count = 1 })
                    break 
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end


-- Initialize events
local function init_events()
  local filter = {{ filter = "name", name = "auto-fuel-chest" }}
  script.on_event(defines.events.on_built_entity, on_chest_created, filter)
  script.on_event(defines.events.on_robot_built_entity, on_chest_created, filter)
  script.on_event(defines.events.on_space_platform_built_entity, on_chest_created, filter)
  script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, on_chest_created)
  script.on_event(defines.events.on_tick, on_tick)
end

script.on_load(function()
  init_events()
end)

script.on_init(function()
  init_events() 
end)

script.on_configuration_changed(function(data)
  init_events() 
end)
