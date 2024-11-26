local e = 0
local f = 2
local w = 5
local r = 1
local o = 12
local c = 8
local e = 9
local a = 'all'


-- rule = {
--   active = true,
--   stopOnMatch = false,
--   chance = 1,
--   sprites = { n },
--   pattern = { a, w, a, a, -w, a, a, a, a },
-- }

rules = {
  -- plants
  {
    chance = 0.3,
    sprites = { 17, 19 },
    pattern = {
      a, w, a,
      a, -w, a,
      a, a, a
    }
  },
  -- dirt
  {
    chance = 0.3,
    sprites = { 37 },
    pattern = {
      a, a, a,
      a, -w, a,
      a, w, a
    }
  },
  -- jumps
  {
    sprites = { 34 },
    stopOnMatch = true,
    pattern = {
      a, -w, a,
      a, w, a,
      a, -w, a
    }
  },
  -- top left corner
  {
    sprites = { 20 },
    stopOnMatch = true,
    pattern = {
      a, -w, a,
      -w, w, a,
      a, a, a
    }
  },
  -- top right corner
  {
    sprites = { 23 },
    stopOnMatch = true,
    pattern = {
      a, -w, a,
      a, w, -w,
      a, a, a
    }
  },
  -- bottom left corner
  {
    sprites = { 52 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      -w, w, a,
      a, -w, a
    }
  },
  -- bottom right corner
  {
    sprites = { 55 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, w, -w,
      a, -w, a
    }
  },
  -- top side
  {
    sprites = { 21 },
    stopOnMatch = true,
    pattern = {
      a, -w, a,
      a, w, a,
      a, a, a
    }
  },
  -- bottom side
  {
    sprites = { 53 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, w, a,
      a, -w, a
    }
  },
  -- left side
  {
    sprites = { 36 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      -w, w, a,
      a, a, a
    }
  },
  -- right side
  {
    sprites = { 39 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, w, -w,
      a, a, a
    }
  },
  -- inner
  {
    sprites = { 2, 3, 4, 5, 6, 7 },
    stopOnMatch = true,
    pattern = {
      w
    }
  },
  -- solo
  {
    sprites = { 33 },
    pattern = {
      -w, -w, -w,
      -w, w, -w,
      -w, -w, -w
    }
  },
}