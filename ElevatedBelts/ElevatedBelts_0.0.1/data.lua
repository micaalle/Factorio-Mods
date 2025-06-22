local function sprite_with_shadow(name, config)
  config = config or {}

  local sprite = {
    type = "sprite",
    name = name,
    layers = {
      {
        filename = "__ElevatedBelts__/graphics/entity/elevated-pipe/" .. name .. ".png",
        scale = 0.5,
        width = 704,
        height = 704,
      },
    }
  }

  if config.shadow ~= false then
    table.insert(sprite.layers, {
      filename = "__ElevatedBelts__/graphics/entity/elevated-pipe/" .. (config.shadow and config.shadow or (name .. "-shadow")) .. ".png",
      scale = 0.5,
      width = 704,
      height = 704,
      draw_as_shadow = true,
    })
  end

  return sprite
end

local horizontal_shadow = {shadow = "elevated-pipe-horizontal-center-shadow"}
local vertical_shadow = {shadow = "elevated-pipe-vertical-center-shadow"}

data:extend{
  sprite_with_shadow("elevated-pipe-horizontal-left", horizontal_shadow),
  sprite_with_shadow("elevated-pipe-horizontal-right", horizontal_shadow),
  sprite_with_shadow("elevated-pipe-horizontal-center", horizontal_shadow),
  sprite_with_shadow("elevated-pipe-horizontal-single", horizontal_shadow),
  sprite_with_shadow("elevated-pipe-vertical-top", vertical_shadow),
  sprite_with_shadow("elevated-pipe-vertical-bottom", vertical_shadow),
  sprite_with_shadow("elevated-pipe-vertical-center", vertical_shadow),
  sprite_with_shadow("elevated-pipe-vertical-single", vertical_shadow),
}