-- Lua script of map ALTTF_Maps/Overworld_4/Dungeon_1/dungeon_2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
  if game:get_value("chest", true) then --if the chest was already opened
    chest_wsk:set_enabled(true)
  end
  if game:get_value("switch_2", true) then
    switch_2:set_enabled(false)
  end
  if game:get_value("switch_3", true) then
    switch_3:set_enabled(false)
  end
end

--Switches

function switch_1:on_activated()
  sol.audio.play_sound("chest_appears")
  chest_wsk:set_enabled(true) --enable the chest
  game:set_value("chest", true)
end

function switch_2:on_activated()
  sol.audio.play_sound("secret")
  map:open_doors("door_2", "door_2_a")
  game:set_value("switch_2", true)
end

function switch_3:on_activated()
  sol.audio.play_sound("secret")
  map:open_doors("door_after_big_chest_2", "door_after_big_chest")
  game:set_value("switch_3", true)
end

-- Enemies

function enemy_bk:on_dead()
  map:open_doors("door_3", "door_3_a") -- opens doors when a certain enemy is killed.
end
