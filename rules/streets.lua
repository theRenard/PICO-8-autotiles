local e = 0
local s = 5  --street
local w = -s -- wlkway
local a = 'all'

streetRules = {
  -- 3x vertical crosswalk
  {
    block = {
      { 69 },
      { 85 },
      { 101 },
    },
    chance = 0.4,
    sprites = { 106 },
    stopOnMatch = true,
    pattern = {
      a, w, w, w, a,
      s, s, s, s, s,
      s, s, s, s, s,
      s, s, s, s, s,
      a, w, w, w, a,
    }
  },
  -- 3x horizontal crosswalk
  {
    block = {
      { 112, 113, 114 },
    },
    chance = 0.4,
    sprites = { 106 },
    stopOnMatch = true,
    pattern = {
      a, s, s, s, a,
      w, s, s, s, w,
      w, s, s, s, w,
      w, s, s, s, w,
      a, s, s, s, a,
    }
  },
  -- top left corner
  {
    sprites = { 64 },
    stopOnMatch = true,
    pattern = {
      w, w, a,
      w, s, s,
      a, s, a
    }
  },
  -- top right corner
  {
    sprites = { 66 },
    stopOnMatch = true,
    pattern = {
      a, w, w,
      s, s, w,
      a, s, a
    }
  },
  -- bottom left corner
  {
    sprites = { 96 },
    stopOnMatch = true,
    pattern = {
      a, s, a,
      w, s, s,
      w, w, a
    }
  },
  -- bottom right corner
  {
    sprites = { 98 },
    stopOnMatch = true,
    pattern = {
      a, s, a,
      s, s, w,
      w, w, a
    }
  },
  -- top left corner
  {
    sprites = { 67 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, s, s,
      a, s, w
    }
  },
  -- top right corner
  {
    sprites = { 68 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      s, s, a,
      w, s, a
    }
  },
  -- bottom left corner
  {
    sprites = { 83 },
    stopOnMatch = true,
    pattern = {
      a, s, w,
      a, s, s,
      a, a, a
    }
  },
  -- bottom right corner
  {
    sprites = { 84 },
    stopOnMatch = true,
    pattern = {
      w, s, a,
      s, s, a,
      a, a, a
    }
  },
  -- left side
  {
    sprites = { 80 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      w, s, a,
      a, a, a
    }
  },
  -- right side
  {
    sprites = { 82 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, s, w,
      a, a, a
    }
  },
  -- top side
  {
    sprites = { 65 },
    stopOnMatch = true,
    pattern = {
      a, w, a,
      a, s, a,
      a, a, a
    }
  },
  -- bottom side
  {
    sprites = { 97 },
    stopOnMatch = true,
    pattern = {
      a, a, a,
      a, s, a,
      a, w, a
    }
  },
  -- all
  {
    sprites = { 81, 118 },
    -- stopOnMatch = true,
    pattern = {
      s
    }
  },
}