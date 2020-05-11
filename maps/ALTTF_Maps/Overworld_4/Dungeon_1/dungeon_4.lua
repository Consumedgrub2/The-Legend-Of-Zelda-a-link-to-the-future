local map = ...
local game = map:get_game()

-- To check if we already beat the boss, so we can let the player out of the boss room.

function map:on_started()
  if game:get_value("dungeon_1_boss") then
   out_1:set_enabled(true)
 else
   out_1:set_enabled(false)
  end
end
  
-- Function to check if the boss was already killed or is still alive so we know what music to play.

function map:on_opening_transition_finished()
  if game:get_value("dungeon_1_boss") then
    sol.audio.play_music("in the cave PH")
    else
  sol.audio.play_music("boss")
 end
end

--[[ Code to execute when the boss dies. We then set a savegame.
But first, we need to check if the boss was killed
or else the value "dungeon_1_boss" will return nil when the map is loaded
after the boss was already killed.
--]]
if not game:get_value"dungeon_1_boss" then
  function dungeon_1_boss:on_dead()
  sol.audio.play_music("in the cave PH")
  sol.audio.play_sound("piece_of_heart")
  heart_container:set_enabled(true)
  game:set_value("dungeon_1_boss", true)
 end
end


-- Next we check to see if the item the hero picked up is itself, so we can enable the crystal pickup.
-- I know, it's horrible that we have to do it this way, if only there was a pickable:on_picked().

function map:on_obtained_treasure(treasure_item, treasure_variant)
  local treasure_name = treasure_item:get_name()
  if treasure_name=="consumables/heart_container" then
    crystal_1:set_enabled(true)
  elseif treasure_name=="quest/crystal_1" then
    out_1:set_enabled(true)
  end
end

--[[
If there was a pickable:on_picked(), it would look like this:

function a_pickable_item:on_picked()
  crystal_1:set_enabled(true)
end
--]]