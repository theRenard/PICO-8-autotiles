-- tiles by https://kenney.nl/assets/micro-roguelike

local e = 0
local s = 5 --external pathway
local b = -s -- not external pathway
local w = 6 -- internal pathway
local n = -w -- not internal pathway
local q = 12 -- water
local g = 11 -- grass
local a = 'all'

-- rule = {
--   active = bool,
--   stopOnMatch = bool,
--   chance = 0 - 1,
--   sprites = { sprite_number },
--   pattern = { type }, // a = all, r = rock, -r = not rock
-- }

dungeonRules = {
  -- walls & pathways
  {
    -- random tree
    {
      sprites = { 164, 165, 166, 167, 171, 172, 145, 145, 145, 145, 145, 145 },
      -- chance = 0.4,
      -- stopOnMatch = true,
      pattern = {
        w
      }
    },
    -- random bottom door
    {
      sprites = { 130, 162 },
      chance = 0.1,
      stopOnMatch = true,
      pattern = {
        a, a, a,
        w, w, w,
        a, s, a
      }
    },
    -- random top door
    {
      sprites = { 132, 162 },
      chance = 0.1,
      stopOnMatch = true,
      pattern = {
        a, s, a,
        w, w, w,
        a, a, a
      }
    },
    -- random trap
    {
      sprites = { 161 },
      chance = 0.1,
      stopOnMatch = true,
      pattern = {
        a, a, a,
        w, w, w,
        a, n, a
      }
    },
    -- top right corner
    {
      sprites = { 128 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        n, w, a,
        a, a, a
      }
    },
    -- top left corner
    {
      sprites = { 131 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        a, w, n,
        a, a, a
      }
    },
    -- bottom right corner
    {
      sprites = { 160 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        n, w, a,
        a, n, a
      }
    },
    -- bottom left corner
    {
      sprites = { 163 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, w, n,
        a, n, a
      }
    },
    -- top wall
    {
      sprites = { 129 },
      stopOnMatch = true,
      pattern = {
        a, n, a,
        w, w, w,
        a, a, a
      }
    },
    -- bottom wall
    {
      sprites = { 129 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        w, w, w,
        a, n, a
      }
    },
    -- left wall
    {
      sprites = { 144 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        n, w, a,
        a, a, a
      }
    },
    -- right wall
    {
      sprites = { 147 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, w, n,
        a, a, a
      }
    },
    -- wall
    {
      sprites = { 145 },
      pattern = {
        s
      }
    }
  }
}