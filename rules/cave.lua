local e = 0
local r = 5  --rock
local a = 'all'

-- rule = {
--   active = bool,
--   stopOnMatch = bool,
--   chance = 0 - 1,
--   sprites = { sprite_number },
--   pattern = { type }, // a = all, r = rock, -r = not rock
-- }

caveRules = {
  -- plants
  {
    chance = 0.3,
    sprites = { 17, 19 },
    pattern = {
      a, r, a,
      a, -r, a,
      a, a, a
    }
  },
  -- dirt
  {
    chance = 0.3,
    sprites = { 37 },
    pattern = {
      a, a, a,
      a, -r, a,
      a, r, a
    }
  },
  -- jumps
  {
    sprites = { 34 },
    stopOnMatch = true,
    pattern = {
      a, -r, a,
      a, r, a,
      a, -r, a
    }
  },
  -- top left corner
  {
    sprites = { 20 },
    stopOnMatch = true,
    pattern = {
      a, -r, a,
      -r, r, a,
      a, a, a
    }
  },
  -- top right corner
  {
    sprites = { 23 },
    stopOnMatch = true,
    pattern = {
      a, -r, a,
      a, r, -r,
      a, a, a
    }
  },
  -- bottom left corner
  {
    sprites = { 52 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      -r, r, a,
      a, -r, a
    }
  },
  -- bottom right corner
  {
    sprites = { 55 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, r, -r,
      a, -r, a
    }
  },
  -- top side
  {
    sprites = { 21 },
    stopOnMatch = true,
    pattern = {
      a, -r, a,
      a, r, a,
      a, a, a
    }
  },
  -- bottom side
  {
    sprites = { 53 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, r, a,
      a, -r, a
    }
  },
  -- left side
  {
    sprites = { 36 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      -r, r, a,
      a, a, a
    }
  },
  -- right side
  {
    sprites = { 39 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, r, -r,
      a, a, a
    }
  },
  -- inner
  {
    sprites = { 2, 3, 4, 5, 6, 7 },
    stopOnMatch = true,
    pattern = {
      r
    }
  },
  -- solo
  {
    sprites = { 33 },
    pattern = {
      -r, -r, -r,
      -r, r, -r,
      -r, -r, -r
    }
  },
}