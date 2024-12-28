-- tiles by https://adamatomic.itch.io/cavernas

local e = 0
local r = 5 --rock
local n = -r -- not rock
local a = 'all'

caveRules = {
  -- background
  {
    -- background all
    {
      sprites = { 39, 40, 55, 56 },
      chance = 0.2,
      stop = false,
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
      stop = false,
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
      stop = false,
      pattern = {
        a, a, a,
        a, n, a,
        a, r, a
      }
    },
    -- jumps
    {
      sprites = { 51 },
      pattern = {
        a, n, a,
        a, r, a,
        a, n, a
      }
    },
    -- top right corner
    {
      sprites = { 16 },
      pattern = {
        a, n, a,
        n, r, a,
        a, a, a
      }
    },
    -- top left corner
    {
      sprites = { 18 },
      pattern = {
        a, n, a,
        a, r, n,
        a, a, a
      }
    },
    -- bottom left corner
    {
      sprites = { 48 },
      pattern = {
        a, a, a,
        n, r, a,
        a, n, a
      }
    },
    -- bottom right corner
    {
      sprites = { 50 },
      pattern = {
        a, a, a,
        a, r, n,
        a, n, a
      }
    },
    -- top side
    {
      sprites = { 17 },
      pattern = {
        a, n, a,
        a, r, a,
        a, a, a
      }
    },
    -- bottom side
    {
      sprites = { 49 },
      pattern = {
        a, a, a,
        a, r, a,
        a, n, a
      }
    },
    -- left side
    {
      sprites = { 32 },
      pattern = {
        a, a, a,
        n, r, a,
        a, a, a
      }
    },
    -- right side
    {
      sprites = { 34 },
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
      pattern = {
        r
      }
    },
    -- solo
    {
      sprites = { 51 },
      stop = false,
      pattern = {
        n, n, n,
        n, r, n,
        n, n, n
      }
    }
  },

}