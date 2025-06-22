

local MAX_DISTANCE = 9
local render_layer = 132

local function sign(n)
  return (n > 0 and 1) or (n < 0 and -1) or 0
end

-- name conventions change!!
local function elevated_pipe_sprites(x_or_y, distance)
  local prefix = x_or_y == "x" and "elevated-pipe-horizontal" or "elevated-pipe-vertical"
  local sprites = {}

  if distance <= 0 then
    return {}
  elseif distance == 1 then
    table.insert(sprites, prefix .. "-center")
    return sprites
  end

  local suffix_start = x_or_y == "x" and "-left" or "-top"
  local suffix_end = x_or_y == "x" and "-right" or "-bottom"

  table.insert(sprites, prefix .. suffix_end)
  for _ = 2, distance - 1 do 
    table.insert(sprites, prefix .. "-center")
  end
  table.insert(sprites, prefix .. suffix_start)

  return sprites
end

local mod = {}

function mod.render_connection_to(connection, player_index)
  assert(type(player_index) == "number")
  connection.player_sprites[player_index] = {}

  local opacity = 1.0

  connection.sprites = connection.sprites or {}
  local player = game.get_player(player_index)

  for i, render_config in ipairs(connection.render_configs) do
    local sprite_id = rendering.draw_sprite(render_config)
    if sprite_id then
      connection.player_sprites[player_index][i] = rendering.draw_sprite(render_config)
      connection.player_sprites[player_index][i].color = {opacity, opacity, opacity, opacity}
      connection.player_sprites[player_index][i].players = {player_index}
      -- Calculate world position if offset + target entity exist
      local render_pos = render_config.target and render_config.target.offset
        and {
          x = render_config.target.entity.position.x + render_config.target.offset[1],
          y = render_config.target.entity.position.y + render_config.target.offset[2]
        } or {x = 0, y = 0}

      if player then
        player.print(string.format(
          "✔️ Rendered sprite: %s [idx: %d] at position (%.2f, %.2f)",
          render_config.sprite, i, render_pos.x, render_pos.y
        ))
      end
    elseif player then
      player.print("❌ Failed to render sprite at index: " .. i)
    end
  end
end


local function get_surface_data(surface)
  if not storage.surfacedata then storage.surfacedata = {} end
  local sd = storage.surfacedata[surface.index]
  if not sd then
    sd = {structs = {}, surface = surface}
    storage.surfacedata[surface.index] = sd
  end
  return sd
end

-- add belt for the link
local function add_belt_entity(entity)
  local sd = get_surface_data(entity.surface)
  sd.structs[entity.unit_number] = {
    entity = entity,
    connections = {},
  }
end


local function remove_belt_entity(entity)
  local sd = get_surface_data(entity.surface)
  local struct = sd.structs[entity.unit_number]
  if not struct then
    for _, player in pairs(game.connected_players) do
      player.print("⚠️ Tried to remove unknown belt: " .. entity.unit_number)
    end
    return
  end

  for _, other_struct in pairs(sd.structs) do
    if other_struct.connections and other_struct.connections[entity.unit_number] then
      other_struct.connections[entity.unit_number] = nil
    end
  end

  sd.structs[entity.unit_number] = nil
  for _, player in pairs(game.connected_players) do
    player.print("🧹 Removed belt: " .. entity.unit_number)
  end
end


--update the links
function mod.update_belt_connections()
  local tick = game.tick
  for _, sd in pairs(storage.surfacedata or {}) do
    for unit_number, struct in pairs(sd.structs or {}) do
      if not struct.entity.valid then
        
        -- check on hte link and remove
        remove_belt_entity(struct.entity)
        goto continue_struct
      end

      local entity = struct.entity
      local neighbour = entity.linked_belt_neighbour

      if neighbour and neighbour.valid and neighbour.name == entity.name then

        local connection = struct.connections[neighbour.unit_number]
        if connection then
          connection.updated_at = tick
          goto continue_connection
        end

        local x_diff = entity.position.x - neighbour.position.x
        local y_diff = entity.position.y - neighbour.position.y
        local abs_x = math.abs(x_diff)
        local abs_y = math.abs(y_diff)

        if abs_x > 1 or abs_y > 1 then
          connection = {
            updated_at = tick,
            render_configs = {},
            player_sprites = {},
          }

          if x_diff > 1 then
            local sprites = elevated_pipe_sprites("x", x_diff - 1)
            for i = 1, abs_x - 1 do
              table.insert(connection.render_configs, {
                sprite = sprites[i],
                surface = entity.surface,
                target = {
                  entity = entity,
                  offset = {-i, 0},
                },
                render_layer = tostring(render_layer + 0),
              })
            end
          else
            local sprites = elevated_pipe_sprites("y", y_diff - 1)
            for i = 1, y_diff -1 do
              table.insert(connection.render_configs, {
                sprite = sprites[i],
                surface = entity.surface,
                target = {
                  entity = entity,
                  offset = {0, -i},
                },
                render_layer = tostring(render_layer + 0),
              })
            end
          end

          struct.connections[neighbour.unit_number] = connection

          for _, player in pairs(game.connected_players) do
            mod.render_connection_to(connection, player.index)
          end
        end
      else
        struct.connections = {}
      end

      ::continue_connection::
      ::continue_struct::
    end
  end
end


local function get_player_handler(player_index)
  if not storage.players then storage.players = {} end
  storage.players[player_index] = storage.players[player_index] or {}
  return storage.players[player_index]
end


script.on_event(defines.events.on_built_entity, function(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and entity.type == "linked-belt") then return end

  add_belt_entity(entity)

  local player_index = event.player_index
  local player_handler = get_player_handler(player_index)

  player_handler.last_belt = player_handler.last_belt or nil

  if player_handler.last_belt and player_handler.last_belt.valid and not entity.linked_belt_neighbour then
    local pos1 = player_handler.last_belt.position
    local pos2 = entity.position
    local dx = math.abs(pos1.x - pos2.x)
    local dy = math.abs(pos1.y - pos2.y)

    local aligned_horizontally = (dy == 0) and (dx <= MAX_DISTANCE)
    local aligned_vertically = (dx == 0) and (dy <= MAX_DISTANCE)

    if aligned_horizontally or aligned_vertically then
      player_handler.last_belt.linked_belt_type = "input"
      entity.linked_belt_type = "output"
      entity.connect_linked_belts(player_handler.last_belt)
      player_handler.render_obj.destroy()

      player_handler.last_belt = nil
      player_handler.render_obj = nil

      mod.update_belt_connections() 
    else

      player_handler.last_belt = entity
    end
  else

    player_handler.last_belt = entity
    player_handler.render_obj = rendering.draw_sprite{
      target = entity,
      sprite = "utility/crafting_machine_recipe_not_unlocked",
      surface = entity.surface,
      only_in_alt_mode = false,
      x_scale = 0.6,
      y_scale = 0.6,
      tint = {b = 1},
    }
  end
end)


local function on_belt_removed(entity)
  if not (entity and entity.valid and entity.type == "linked-belt") then return end
  remove_belt_entity(entity)

  if storage.players then
    for player_index, data in pairs(storage.players) do
      if data.last_belt and data.last_belt == entity then
        if type(data.render_obj) == "number" and rendering.is_valid(data.render_obj) then
          rendering.destroy(data.render_obj)
        end
        data.last_belt = nil
        data.render_obj = nil
      end
    end
  end
end

script.on_event({defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity, defines.events.on_entity_died}, function(event)
  on_belt_removed(event.entity)
end)

script.on_event(defines.events.on_player_created, function(event)
  local player_index = event.player_index
  for _, sd in pairs(storage.surfacedata or {}) do
    for _, struct in pairs(sd.structs or {}) do
      for _, connection in pairs(struct.connections or {}) do
        mod.render_connection_to(connection, player_index)
      end
    end
  end
end)

script.on_nth_tick(60, function()
  mod.update_belt_connections()
end)

script.on_init(function()
  storage = storage or {}
  storage.surfacedata = storage.surfacedata or {}
  storage.players = storage.players or {}
end)
