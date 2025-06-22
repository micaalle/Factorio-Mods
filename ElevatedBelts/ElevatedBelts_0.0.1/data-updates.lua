local byte_0 = string.byte("a")-1
local tint = {0.65, 0.65, 0.65}
local speeds_names = {} 
local speeds = {} 

for _, prototype in pairs(data.raw["underground-belt"]) do
  if not speeds_names[prototype.speed] then
    table.insert(speeds, prototype.speed)
    local prototype_copy = util.table.deepcopy(prototype)

    prototype_copy.type = "linked-belt"
    prototype_copy.name = "linked-"..prototype.name
    speeds_names[prototype.speed] = prototype_copy.name

    prototype_copy.hidden_in_factoriopedia = true 
    prototype_copy.minable.result = prototype_copy.name
    prototype_copy.fast_replaceable_group = "linked-belt"
    prototype_copy.localised_name = {"entity-name.linked-belts", {"entity-name."..prototype.name}}

    if prototype.next_upgrade then
      prototype_copy.next_upgrade = "linked-"..prototype.next_upgrade
    end
    --[[
    for _, sprite_4_way in pairs(prototype_copy.structure) do -- should maybe be a bit more general to deal with differently defined sprites
      sprite_4_way.sheet.tint = tint
    end
    --]]

prototype_copy.structure = {
    direction_out = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        y = 341,
        shift = util.by_pixel(24, -45)
      }
    },
    direction_in = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        shift = util.by_pixel(24, -45)
      }
    },
    direction_out_side_loading = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        y = 341*3,
        shift = util.by_pixel(24, -45)
      }
    },
    direction_in_side_loading = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        y = 341*2,
        shift = util.by_pixel(24, -45)
      }
    },
    back_patch = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        shift = util.by_pixel(24, -45)
      }
    },
    front_patch = {
      sheet = {
        filename = "__ElevatedBelts__/graphics/entity/elevated-belts/elevated-belt-test-no.png",
        priority = "extra-high",
        width = 343,
        height = 341,
        scale = 0.5,
        shift = util.by_pixel(24, -45)
      }
    },
  }


    if prototype.icons then
      for _, icon in pairs(prototype_copy.icons) do
        icon.tint = tint
      end
    else
      prototype_copy.icons = {{icon=prototype.icon, tint=tint, icon_size=prototype.icon_size}}
      prototype_copy.icon = nil
    end

    local item = {
      type = "item",
      name = prototype_copy.name,

      icons = prototype_copy.icons,
      subgroup = data.raw.item[prototype.name].subgroup or prototype_copy.subgroup or "belt",

      place_result = prototype_copy.name,
      stack_size = 10,
    }

    local recipe = { 
      type = "recipe",
      name = prototype_copy.name,
      enabled = false, 
      ingredients = {{type="item", name=prototype.name, amount=2}},
      results     = {{type="item", name=prototype_copy.name, amount=2}}
    }

    data:extend{prototype_copy, item, recipe}

    for _, technology in pairs(data.raw.technology) do
      for _, modifier in pairs(technology.effects or {}) do 
        if modifier.type == "unlock-recipe" then
          if modifier.recipe == prototype.name then 
            table.insert(technology.effects, {type = "unlock-recipe", recipe = prototype_copy.name})
            break
          end
        end
      end
    end
  end
end

table.sort(speeds)
local _, prev_speed = next(speeds)
for i, speed in pairs(speeds) do
  data.raw.item[speeds_names[speed]].order = "l"..string.char(i + byte_0) 
  prev_speed = speed
end



