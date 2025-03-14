Position = {}
--STILL GO THROUGH AND ADD ERROR STATEMENTS
require 'stdlib/core'

-- create table for storing coordinates
function Position.construct(x, y)
    return { x = x, y = y }
end

-- copy coordinates and return position
function Position.copy(pos)
    if not Position.is_valid(pos) then
        error("Invalid position")
    end
    pos = Position.to_table(pos)
    return { x = pos.x, y = pos.y }
end

-- creates a new position that is offset by x, y coordinates
function Position.offset(pos, x, y)
    if not Position.is_valid(pos) then
        error("Invalid position")
    end
    if #pos == 2 then
        return { x = pos[1] + x, y = pos[2] + y }
    else
        return { x = pos.x + x, y = pos.y + y }
    end
end

--- basic arithmetic functions

-- adds 2 positions
function Position.add(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return { x = pos1.x + pos2.x, y = pos1.y + pos2.y}
end

-- subtracts 2 positions
function Position.subtract(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return { x = pos1.x - pos2.x, y = pos1.y - pos2.y }
end

-- divide 2 positions
function Position.divide(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    if pos2.x == 0 or pos2.y == 0 then
        error("Cannot divide by zero")
    end
    return { x = pos1.x / pos2.x, y = pos1.y / pos2.y }
end

-- multiply 2 positions
function Position.multiply(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return { x = pos1.x * pos2.x, y = pos1.y * pos2.y }
end

-- mod 2 positions
function Position.modulus(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return { x = pos1.x % pos2.x, y = pos1.y % pos2.y }
end

--- distance formulas

-- formula for straight line distance between two points i.e Euclidean distance
function Position.distance(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return math.sqrt((pos2.x - pos1.x)^2 + (pos2.y - pos1.y)^2)
end

-- formula for distance between two points while only moving in right angles i.e Manhattan distance
function Position.manhattan_distance(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return math.abs(pos2.x - pos1.x) + math.abs(pos2.y - pos1.y)
end

--- additional functions

-- Check if the position is valid (either {x, y} table or {x, y} array)
function Position.is_valid(pos)
    return (type(pos) == "table" and (pos.x and pos.y)) or (#pos == 2)
end

-- dot product of two positions (vectors)
function Position.dot_product(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return pos1.x * pos2.x + pos1.y * pos2.y
end

-- normalize the position vector to have a length of 1
function Position.normalize(pos)
    if not Position.is_valid(pos) then
        error("Invalid position")
    end
    pos = Position.to_table(pos)

    local length = Position.distance({x = 0, y = 0}, pos)
    if length == 0 then return {x = 0, y = 0} end -- prevent division by zero

    return { x = pos.x / length, y = pos.y / length }
end

-- cross product of two 2D vectors (returns a scalar)
function Position.cross_product(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return pos1.x * pos2.y - pos1.y * pos2.x
end

-- angle between two position vectors (in radians)
function Position.angle_between(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)

    local dot = Position.dot_product(pos1, pos2)
    local mag1 = Position.distance({x = 0, y = 0}, pos1)
    local mag2 = Position.distance({x = 0, y = 0}, pos2)

    if mag1 == 0 or mag2 == 0 then return 0 end -- avoid division by zero

    return math.acos(dot / (mag1 * mag2))
end

-- linear interpolation between two positions
function Position.lerp(pos1, pos2, t)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return { x = pos1.x + (pos2.x - pos1.x) * t, y = pos1.y + (pos2.y - pos1.y) * t }
end

-- squared distance between two positions (avoiding sqrt for performance)
function Position.distance_squared(pos1, pos2)
    if not Position.is_valid(pos1) or not Position.is_valid(pos2) then
        error("Invalid position(s)")
    end
    pos1 = Position.to_table(pos1)
    pos2 = Position.to_table(pos2)
    return (pos2.x - pos1.x)^2 + (pos2.y - pos1.y)^2
end

-- reflect a vector across another vector
function Position.reflect(pos, normal)
    if not Position.is_valid(pos) or not Position.is_valid(normal) then
        error("Invalid position(s)")
    end
    pos = Position.to_table(pos)
    normal = Position.to_table(normal)

    local dot = Position.dot_product(pos, normal)
    return Position.subtract(pos, Position.multiply(normal, {x = 2 * dot, y = 2 * dot}))
end

-- rotate a position by an angle (in radians)
function Position.rotate(pos, angle)
    if not Position.is_valid(pos) then
        error("Invalid position")
    end
    pos = Position.to_table(pos)

    local cos_angle = math.cos(angle)
    local sin_angle = math.sin(angle)

    return { x = pos.x * cos_angle - pos.y * sin_angle, y = pos.x * sin_angle + pos.y * cos_angle }
end
