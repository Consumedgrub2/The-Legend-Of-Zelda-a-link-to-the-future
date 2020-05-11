local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

end

function enemy_door:on_dead()
  map:open_doors("door", "door_1")
end