local config = {}


config.tech_name = "respawn-beacon-tech"
config.item_name = "respawn-beacon"
config.entity_name = "respawn-beacon"

local settings = settings.startup


config.tech_name = settings["respawn-beacon-tech"] and settings["respawn-beacon-tech"].value or config.tech_name
config.item_name = settings["respawn-beacon"] and settings["respawn-beacon"].value or config.item_name
config.entity_name = settings["respawn-beacon"] and settings["respawn-beacon"].value or config.entity_name

return config
