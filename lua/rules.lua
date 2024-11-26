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
  -- rocks
  {
    chance = 0.3,
    sprites = { 37 },
    pattern = {
      a, a, a,
      a, -w, a,
      a, w, a
    }
  },
  -- inner
  {
    sprites = { 2, 3, 4, 5, 6, 7 },
    pattern = {
      w
    }
  },
  -- top
  {
    sprites = { 21 },
    pattern = {
      a, -w, a,
      a, w, a,
      a, a, a
    }
  },
  -- bottom
  {
    sprites = { 53 },
    pattern = {
      a, a, a,
      a, w, a,
      a, -w, a
    }
  },
  -- left side
  {
    sprites = { 36 },
    pattern = {
      a, a, a,
      -w, w, a,
      a, a, a
    }
  },
  -- right side
  {
    sprites = { 39 },
    pattern = {
      a, a, a,
      a, w, -w,
      a, a, a
    }
  },
  -- top left corner
  {
    sprites = { 20 },
    pattern = {
      a, -w, a,
      -w, w, a,
      a, a, a
    }
  },
  -- top right corner
  {
    sprites = { 23 },
    pattern = {
      a, -w, a,
      a, w, -w,
      a, a, a
    }
  },
  -- bottom left corner
  {
    sprites = { 52 },
    pattern = {
      a, a, a,
      -w, w, a,
      a, -w, a
    }
  },
  -- bottom right corner
  {
    sprites = { 55 },
    pattern = {
      a, a, a,
      a, w, -w,
      a, -w, a
    }
  },

}