local util = require("util")

local ground_rail_render_layers =
{
  stone_path_lower = "rail-stone-path-lower",
  stone_path = "rail-stone-path",
  tie = "rail-tie",
  screw = "rail-screw",
  metal = "rail-metal"
}

local rail_segment_visualisation_endings =
{
  filename = "__base__/graphics/entity/rails/rail/rail-segment-visualisations-endings.png",
  priority = "extra-high",
  flags = { "low-object" },
  width = 64,
  height = 64,
  scale = 0.25,
  direction_count = 16,
  frame_count = 6,
  usage = "rail"
}

local function make_new_rail_pictures(keys, elems, max_variations)
  local function make_sprite_definition(filename, elem, key, variation_count)
    return
    {
      filename = filename,
      priority = elem.priority or "extra-high",
      flags = elem.mipmap and { "trilinear-filtering" } or { "low-object" },
      draw_as_shadow = elem.draw_as_shadow,
      allow_forced_downscale = elem.allow_forced_downscale,
      width = key[3][1],
      height = key[3][2],
      x = key[2][1],
      y = key[2][2],
      scale = 0.25;
      shift = util.by_pixel(key[4][1], key[4][2]),
      variation_count = variation_count,
      usage = "rail"
    }
  end

  local res = {}
  for _ , key in ipairs(keys) do
    local part = {}
    local variation_count = key[5] or 1
    if max_variations then
      variation_count = math.min(variation_count, max_variations)
    end
    if (variation_count > 0) then
      for _ , elem in ipairs(elems) do
        local layers = nil
        local variations = variation_count;
        if (elem[1] == "segment_visualisation_middle") then
          variations = nil
        end
        if (type(elem[2]) == "table") then
          layers = { layers = {} }
          for _, subelem in ipairs(elem[2]) do
            table.insert(layers.layers, make_sprite_definition(subelem[1], subelem, key, variations))
          end
        else
          layers = make_sprite_definition(elem[2], elem, key, variations)
        end

        if (elem[1] ~= nil) then
          part[elem[1]] = layers
        else
          part = layers
        end
      end
    end

    res[key[1]] = part
  end
  return res
end

function new_rail_pictures(rail_type)
  local keys
  local NOT_USED_POSITION = {0, 0}
  local NOT_USED_SIZE = {1, 1}
  local NOT_USED_SHIFT = {0, 0}
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0,  256 }, {256, 256}, {0,0}, 8},
      {"northeast", { 0, 2048 }, {384, 384}, {0,0}, 3},
      {"east",      { 0,    0 }, {256, 256}, {0,0}, 8},
      {"southeast", { 0,  896 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 1280 }, {384, 384}, {0,0}, 3},
      {"northeast", { 0, 1664 }, {384, 384}, {0,0}, 3},
      {"east",      { 0, 2432 }, {384, 384}, {0,0}, 3},
      {"southeast", { 0,  512 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { 2048,  3 * 512 }, {512, 512}, {0,0}, 4},-- piece 04
      {"northeast", { 2048, 12 * 512 }, {512, 512}, {0,0}, 4},-- piece 13
      {"east",      { 2048,  7 * 512 }, {512, 512}, {0,0}, 4},-- piece 08
      {"southeast", { 2048,  0 * 512 }, {512, 512}, {0,0}, 4},-- piece 01
      {"south",     { 2048, 11 * 512 }, {512, 512}, {0,0}, 4},-- piece 12
      {"southwest", { 2048,  4 * 512 }, {512, 512}, {0,0}, 4},-- piece 05
      {"west",      { 2048, 15 * 512 }, {512, 512}, {0,0}, 4},-- piece 16
      {"northwest", { 2048,  8 * 512 }, {512, 512}, {0,0}, 4},-- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { 2048,  2 * 512 }, {512, 512}, {0,0}, 4},-- piece 03
      {"northeast", { 2048, 13 * 512 }, {512, 512}, {0,0}, 4},-- piece 14
      {"east",      { 2048,  6 * 512 }, {512, 512}, {0,0}, 4},-- piece 07
      {"southeast", { 2048,  1 * 512 }, {512, 512}, {0,0}, 4},-- piece 02
      {"south",     { 2048, 10 * 512 }, {512, 512}, {0,0}, 4},-- piece 11
      {"southwest", { 2048,  5 * 512 }, {512, 512}, {0,0}, 4},-- piece 06
      {"west",      { 2048, 14 * 512 }, {512, 512}, {0,0}, 4},-- piece 15
      {"northwest", { 2048,  9 * 512 }, {512, 512}, {0,0}, 4},-- piece 10
    }
  end
  local elems =
  {
    { "metals",                       "__base__/graphics/entity/rails/rail/rail-metals.png",             mipmap = true },
    { "backplates",                   "__base__/graphics/entity/rails/rail/rail-backplates.png",         mipmap = true },
    { "ties",                         "__base__/graphics/entity/rails/rail/rail-ties.png"                              },
    { "stone_path",                   "__base__/graphics/entity/rails/rail/rail-stone-path-inside.png"                 },
    { "stone_path_background",        "__base__/graphics/entity/rails/rail/rail-stone-path.png"                        },
    { "segment_visualisation_middle", "__base__/graphics/entity/rails/rail/rail-segment-visualisations-middle.png"     },
  }

  local res = make_new_rail_pictures(keys, elems)
  res["rail_endings"] =
  {
    sheets =
    {
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-background.png",
        priority = "high",
        flags = { "low-object" },
        width = 256,
        height = 256,
        scale = 0.25,
        usage = "rail"
      },
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-foreground.png",
        priority = "high",
        flags = { "trilinear-filtering" },
        width = 256,
        height = 256,
        scale = 0.25,
        usage = "rail"
      }
    }
  }
  res["render_layers"] = ground_rail_render_layers
  res["segment_visualisation_endings"] = rail_segment_visualisation_endings
  return res
end

function new_rail_remnants_pictures(rail_type)
  local keys
  local NOT_USED_POSITION = {0, 0}
  local NOT_USED_SIZE = {1, 1}
  local NOT_USED_SHIFT = {0, 0}
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0,  256 }, {256, 256}, {0,0}, 8},
      {"northeast", { 0, 2048 }, {384, 384}, {0,0}, 3},
      {"east",      { 0,    0 }, {256, 256}, {0,0}, 8},
      {"southeast", { 0,  896 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 1280 }, {384, 384}, {0,0}, 3},
      {"northeast", { 0, 1664 }, {384, 384}, {0,0}, 3},
      {"east",      { 0, 2432 }, {384, 384}, {0,0}, 3},
      {"southeast", { 0,  512 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { 2048,  3 * 512 }, {512, 512}, {0,0}, 4},-- piece 04
      {"northeast", { 2048, 12 * 512 }, {512, 512}, {0,0}, 4},-- piece 13
      {"east",      { 2048,  7 * 512 }, {512, 512}, {0,0}, 4},-- piece 08
      {"southeast", { 2048,  0 * 512 }, {512, 512}, {0,0}, 4},-- piece 01
      {"south",     { 2048, 11 * 512 }, {512, 512}, {0,0}, 4},-- piece 12
      {"southwest", { 2048,  4 * 512 }, {512, 512}, {0,0}, 4},-- piece 05
      {"west",      { 2048, 15 * 512 }, {512, 512}, {0,0}, 4},-- piece 16
      {"northwest", { 2048,  8 * 512 }, {512, 512}, {0,0}, 4},-- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { 2048,  2 * 512 }, {512, 512}, {0,0}, 4},-- piece 03
      {"northeast", { 2048, 13 * 512 }, {512, 512}, {0,0}, 4},-- piece 14
      {"east",      { 2048,  6 * 512 }, {512, 512}, {0,0}, 4},-- piece 07
      {"southeast", { 2048,  1 * 512 }, {512, 512}, {0,0}, 4},-- piece 02
      {"south",     { 2048, 10 * 512 }, {512, 512}, {0,0}, 4},-- piece 11
      {"southwest", { 2048,  5 * 512 }, {512, 512}, {0,0}, 4},-- piece 06
      {"west",      { 2048, 14 * 512 }, {512, 512}, {0,0}, 4},-- piece 15
      {"northwest", { 2048,  9 * 512 }, {512, 512}, {0,0}, 4},-- piece 10
    }
  end
  local elems =
  {
    { "metals",                "__base__/graphics/entity/rails/rail/remnants/rail-remnants-metals.png",             mipmap = true, allow_forced_downscale = true },
    { "backplates",            "__base__/graphics/entity/rails/rail/remnants/rail-remnants-backplates.png",         mipmap = true, allow_forced_downscale = true },
    { "ties",                  "__base__/graphics/entity/rails/rail/remnants/rail-remnants-ties.png"                             , allow_forced_downscale = true },
    { "stone_path",            "__base__/graphics/entity/rails/rail/remnants/rail-remnants-stone-path-inside.png"                , allow_forced_downscale = true },
    { "stone_path_background", "__base__/graphics/entity/rails/rail/remnants/rail-remnants-stone-path.png"                       , allow_forced_downscale = true }
  }

  local res = make_new_rail_pictures(keys, elems)
  res["rail_endings"] =
  {
    sheets =
    {
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-background.png",
        priority = "high",
        flags = { "low-object" },
        width = 256,
        height = 256,
        scale = 0.25,
        usage = "rail"
      },
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-foreground.png",
        priority = "high",
        flags = { "trilinear-filtering" },
        width = 256,
        height = 256,
        scale = 0.25,
        usage = "rail"
      }
    }
  }
  res["render_layers"] = ground_rail_render_layers
  return res
end

elevated_rail_pictures = new_rail_pictures

local function rail_fences_keys(rail_type)
  local keys = nil
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0, 768 * 1 }, {768, 768}, {0,0}, 1},
      {"northeast", { 0, 768 * 6 }, {768, 768}, {0,0}, 1},
      {"east",      { 0, 768 * 0 }, {768, 768}, {0,0}, 1},
      {"southeast", { 0, 768 * 3 }, {768, 768}, {0,0}, 1},
      {"south",     nil, nil, nil, 0},
      {"southwest", nil, nil, nil, 0},
      {"west",      nil, nil, nil, 0},
      {"northwest", nil, nil, nil, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 768 * 4 }, {768, 768}, {0,0}, 2},
      {"northeast", { 0, 768 * 5 }, {768, 768}, {0,0}, 2},
      {"east",      { 0, 768 * 7 }, {768, 768}, {0,0}, 2},
      {"southeast", { 0, 768 * 2 }, {768, 768}, {0,0}, 2},
      {"south",     nil, nil, nil, 0},
      {"southwest", nil, nil, nil, 0},
      {"west",      nil, nil, nil, 0},
      {"northwest", nil, nil, nil, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { 768 * 2, 1 * 768 }, {768, 768}, {0,0}, 2}, -- piece 04
      {"northeast", { 768 * 2, 6 * 768 }, {768, 768}, {0,0}, 2}, -- piece 13
      {"east",      { 768 * 2, 3 * 768 }, {768, 768}, {0,0}, 2}, -- piece 08
      {"southeast", { 768 * 2, 0 * 768 }, {768, 768}, {0,0}, 2}, -- piece 01
      {"south",     { 768 * 2, 5 * 768 }, {768, 768}, {0,0}, 2}, -- piece 12
      {"southwest", { 768 * 2, 2 * 768 }, {768, 768}, {0,0}, 2}, -- piece 05
      {"west",      { 768 * 2, 7 * 768 }, {768, 768}, {0,0}, 2}, -- piece 16
      {"northwest", { 768 * 2, 4 * 768 }, {768, 768}, {0,0}, 2}, -- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { 768 * 4, 1 * 768 }, {768, 768}, {0,0}, 2}, -- piece 03
      {"northeast", { 768 * 4, 6 * 768 }, {768, 768}, {0,0}, 2}, -- piece 14
      {"east",      { 768 * 4, 3 * 768 }, {768, 768}, {0,0}, 2}, -- piece 07
      {"southeast", { 768 * 4, 0 * 768 }, {768, 768}, {0,0}, 2}, -- piece 02
      {"south",     { 768 * 4, 5 * 768 }, {768, 768}, {0,0}, 2}, -- piece 11
      {"southwest", { 768 * 4, 2 * 768 }, {768, 768}, {0,0}, 2}, -- piece 06
      {"west",      { 768 * 4, 7 * 768 }, {768, 768}, {0,0}, 2}, -- piece 15
      {"northwest", { 768 * 4, 4 * 768 }, {768, 768}, {0,0}, 2}, -- piece 10
    }
  end
  return keys
end


function dummy_rails_ramp_pictures()
  return
  {
    north = {},
    northeast = {},
    east = {},
    southeast = {},
    south = {},
    southwest = {},
    west = {},
    northwest = {},
    render_layers = {},
  }
end

function shift_rail_gfx(rail_graphics, shift)
  for k, tab in pairs(rail_graphics) do
    if (k ~= "segment_visualisation_endings") and (type(tab) == "table") then
      if tab.filename ~= nil then
        if tab.draw_as_shadow then
          tab.shift = util.add_shift(tab.shift, {3.87, 2.75 - 3}) -- { -shift[2] - 0.5, shift[1] })
        else
          tab.shift = util.add_shift(tab.shift, shift)
        end
      else
        shift_rail_gfx(tab, shift)
      end
    end
  end
  return rail_graphics
end

function shift_fence_gfx(fence_graphics, shift)
  shift_rail_gfx(fence_graphics.side_A.fence, shift)
  shift_rail_gfx(fence_graphics.side_B.fence, shift)
  for i = 1, 4 do
    shift_rail_gfx(fence_graphics.side_A.ends[i], shift)
    shift_rail_gfx(fence_graphics.side_B.ends[i], shift)
  end
  return fence_graphics
end
