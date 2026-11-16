-- Reset technology effects for all forces
for _, force in pairs(game.forces) do
    force.reset_technology_effects()
end
