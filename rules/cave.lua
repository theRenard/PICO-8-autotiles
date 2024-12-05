-- tiles by https://adamatomic.itch.io/cavernas

local e = 0
local r = 5 --rock
local n = -r -- not rock
local a = 'all'

-- rule = {
--   active = bool,
--   stopOnMatch = bool,
--   chance = 0 - 1,
--   sprites = { sprite_number },
--   pattern = { type }, // a = all, r = rock, -r = not rock
-- }

caveRules = {
  -- background
  {
    -- background all
    {
      sprites = { 39, 40, 55, 56 },
      chance = 0.2,
      pattern = {
        n
      }
    },
    -- torch
    {
      block = {
        { 15 },
        { 31 },
      },
      chance = 0.01,
      stopOnMatch = true,
      pattern = {
        n, n, n,
        n, n, n,
        n, n, n,
      }
    },
  },
  -- cave all
  {
    -- stairs
    {
      sprites = { 35 },
      stopOnMatch = true,
      pattern = {
        a, a, a, a, a,
        r, n, n, a, a,
        r, r, r, a, a,
        r, r, r, a, a,
        r, n, n, a, a,
      }
    },
    {
      sprites = { 35 },
      stopOnMatch = true,
      pattern = {
        r, n, n, a, a,
        r, r, r, a, a,
        r, r, r, a, a,
        r, n, n, a, a,
        a, a, a, a, a,
      }
    },
    -- plants
    {
      chance = 0.3,
      sprites = { 21, 22, 23, 24 },
      pattern = {
        a, r, a,
        a, n, a,
        a, a, a
      }
    },
    -- dirt
    {
      chance = 0.3,
      sprites = { 9, 10, 11, 12, 13, 14, 33 },
      pattern = {
        a, a, a,
        a, n, a,
        a, r, a
      }
    },
    -- jumps
    {
      sprites = { 51 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        a, r, a,
        a, n, a
      }
    },
    -- top right corner
    {
      sprites = { 16 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        n, r, a,
        a, a, a
      }
    },
    -- top left corner
    {
      sprites = { 18 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        a, r, n,
        a, a, a
      }
    },
    -- bottom left corner
    {
      sprites = { 48 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        n, r, a,
        a, n, a
      }
    },
    -- bottom right corner
    {
      sprites = { 50 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, r, n,
        a, n, a
      }
    },
    -- top side
    {
      sprites = { 17 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        a, r, a,
        a, a, a
      }
    },
    -- bottom side
    {
      sprites = { 49 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, r, a,
        a, n, a
      }
    },
    -- left side
    {
      sprites = { 32 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        n, r, a,
        a, a, a
      }
    },
    -- right side
    {
      sprites = { 34 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, r, n,
        a, a, a
      }
    },
    -- inner
    {
      sprites = { 1, 2, 3, 4, 5, 6 },
      chance = 0.2,
      stopOnMatch = true,
      pattern = {
        r
      }
    },
    -- solo
    {
      sprites = { 51 },
      pattern = {
        n, n, n,
        n, r, n,
        n, n, n
      }
    }
  },

}