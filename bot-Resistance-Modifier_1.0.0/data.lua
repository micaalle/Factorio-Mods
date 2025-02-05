-- data.lua

-- Function to apply resistances to a robot
local function apply_resistances_to_robot(bot)
    -- Ensure the robot has a resistances table
    bot.resistances = bot.resistances or {}

    -- Retrieve the custom resistance values from settings
    local electric_resistance = settings.startup["electric-resistance-value"].value
    local physical_resistance = settings.startup["physical-resistance-value"].value
    local acid_resistance = settings.startup["acid-resistance-value"].value
    local explosion_resistance = settings.startup["explosion-resistance-value"].value
    local fire_resistance = settings.startup["fire-resistance-value"].value
    local impact_resistance = settings.startup["impact-resistance-value"].value

    -- Apply each resistance type to the robot
    table.insert(bot.resistances, {type = "electric", percent = electric_resistance})
    table.insert(bot.resistances, {type = "physical", percent = physical_resistance})
    table.insert(bot.resistances, {type = "acid", percent = acid_resistance})
    table.insert(bot.resistances, {type = "explosion", percent = explosion_resistance})
    table.insert(bot.resistances, {type = "fire", percent = fire_resistance})
    table.insert(bot.resistances, {type = "impact", percent = impact_resistance})
end

-- Apply resistances to construction robots if the setting is enabled
if settings.startup["robot-construction-resistance"].value then
    for _, bot in pairs(data.raw["construction-robot"]) do
        apply_resistances_to_robot(bot)
    end
end

-- Apply resistances to logistic robots if the setting is enabled
if settings.startup["robot-logistic-resistance"].value then
    for _, bot in pairs(data.raw["logistic-robot"]) do
        apply_resistances_to_robot(bot)
    end
end
