local item = ...

-- When it is created, this item creates another item randomly chosen
-- and then destroys itself.

-- Probability of each item between 0 and 1000.
local probabilities = {
  [{ "consumables/bomb_refill", 1 }]       = 8,    -- 1 bomb.
  [{ "consumables/bomb_refill", 2 }]       = 5,    -- 3 bombs.
  [{ "consumables/bomb_refill", 3 }]       = 2,    -- 8 bombs.
  [{ "consumables/arrow_refill", 1 }]      = 8,    -- 1 arrow.
  [{ "consumables/arrow_refill", 2 }]      = 5,    -- 5 arrows.
  [{ "consumables/arrow_refill", 3 }]      = 2,    -- 10 arrows.
  [{ "consumables/rupee", 1 }]      = 50,   -- 1 rupee.
  [{ "consumables/rupee", 2 }]      = 15,   -- 5 rupees.
  [{ "consumables/rupee", 3 }]      = 5,    -- 20 rupees.
  [{ "consumables/magic_jar", 1}] = 25,   -- Small magic jar.
  [{ "consumables/magic_jar", 2}] = 8,    -- Big magic jar.
  [{ "consumables/heart", 1}]       = 100,  -- Heart.
  [{ "consumables/fairy", 1}]       = 2,    -- Fairy.
}

function item:on_pickable_created(pickable)

  local treasure_name, treasure_variant = self:choose_random_item()
  if treasure_name ~= nil then
    local map = pickable:get_map()
    local x, y, layer = pickable:get_position()
    map:create_pickable{
      layer = layer,
      x = x,
      y = y,
      treasure_name = treasure_name,
      treasure_variant = treasure_variant,
    }
  end
  pickable:remove()
end

-- Returns an item name and variant.
function item:choose_random_item()

  local random = math.random(1000)
  local sum = 0

  for key, probability in pairs(probabilities) do
    sum = sum + probability
    if random < sum then
      return key[1], key[2]
    end
  end

  return nil
end

