-- settings.lua

data:extend({
  -- Settings for robot resistances
  {
    type = "bool-setting",
    name = "robot-construction-resistance", 
    setting_type = "startup",
    default_value = true,
    order = "a"
  },

  {
    type = "bool-setting",
    name = "robot-logistic-resistance", 
    setting_type = "startup",
    default_value = true,
    order = "b"
  },

  -- Settings for each resistance type (allowing players to choose a value)
  {
    type = "double-setting",
    name = "electric-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "c"
  },

  {
    type = "double-setting",
    name = "physical-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "d"
  },

  {
    type = "double-setting",
    name = "acid-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "e"
  },

  {
    type = "double-setting",
    name = "explosion-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "f"
  },

  {
    type = "double-setting",
    name = "fire-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "g"
  },

  {
    type = "double-setting",
    name = "impact-resistance-value", 
    setting_type = "startup",
    default_value = 100,  -- Start at 100
    minimum_value = 0,
    maximum_value = 100,  -- Max value is 100
    order = "h"
  }
})
