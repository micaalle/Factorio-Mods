local config = {}

-- Default values for technology, item, and entity names
config.tech_name = "respawn-beacon-tech"
config.item_name = "respawn-beacon"
config.entity_name = "respawn-beacon"

-- Retrieve mod settings from Factorio's settings system
local settings = settings.startup

-- Override with settings from the mod configuration, if provided
config.tech_name = settings["respawn-beacon-tech"] and settings["respawn-beacon-tech"].value or config.tech_name
config.item_name = settings["respawn-beacon"] and settings["respawn-beacon"].value or config.item_name
config.entity_name = settings["respawn-beacon"] and settings["respawn-beacon"].value or config.entity_name

return config