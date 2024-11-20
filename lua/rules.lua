local e = nil
local r = 4
local w = 5
local f = 7
local o = 12
local c = 8
local e = 9
local n = nil
local a = 'all'

-- do this programmatically
directions = {}
directions[1] = { { 0, 0 } }
directions[3] = { { -1, -1 }, { 0, -1 }, { 1, -1 }, { -1, 0 }, { 0, 0 }, { 1, 0 }, { -1, 1 }, { 0, 1 }, { 1, 1 } }

rules = {
  floor = {
    highlight = true,
    active = true,
    chance = 0.3,
    sprites = { 12 },
    size = 1,
    pattern = {
      a,
    }
  },
  plants = {
    highlight = true,
    active = true,
    chance = 1,
    sprites = { 1 },
    size = 3,
    pattern = {
      a, f, a,
      a, a, a,
      a, a, a
    }
  },
  -- walls = {
  --   highlight = true,
  --   active = true,
  --   chance = 1,
  --   sprites = { 1 },
  --   size = 1,
  --   pattern = {
  --     w
  --   }
  -- }
}