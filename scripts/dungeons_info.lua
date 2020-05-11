-- Define the existing dungeons and their floors for the minimap menu.
local dungeons_info = {


  ["dungeon_1"] = {
    floor_width = 1920,
    floor_height = 1200,
    lowest_floor = -3,
    highest_floor = 0,
    maps = {
      "ALTTF_Maps/Overworld_4/Dungeon_1/dungeon_1", "ALTTF_Maps/Overworld_4/Dungeon_1/dungeon_2", "ALTTF_Maps/Overworld_4/Dungeon_1/dungeon_3", "ALTTF_Maps/Overworld_4/Dungeon_1/dungeon_4"
    },
    boss = {
      floor = -3,
      savegame_variable = "dungeon_1_boss",
      x = 960,
      y = 480 + 224,
    },
  },
}

return dungeons_info