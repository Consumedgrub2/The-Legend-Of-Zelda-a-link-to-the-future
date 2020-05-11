-- Lua script of map ALTTF_Maps/initial_starting_map.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
  
local game = map:get_game()
local dialog_status = game:get_value("save", 1)
if dialog_status ~= 1 then
    game:start_dialog("ALTTF.Gamestory.game_story_1")
    game:set_value("save", 1)
  end
end

 

local game = map:get_game()
local dialog_status = game:get_value("save_music", 1)
if dialog_status ~= 1 then
    sol.audio.play_music("beginning")
    game:set_value("save_music", 1)
end
  -- You can initialize the movement and sprites of various
  -- map entities here.

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
