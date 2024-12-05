local e = 0
local s = 5 --street
local w = 6 -- sidewalk
local q = 12 -- water
local a = 'all'

cityRules = {
  -- street all
  {
    -- street 3x vertical crosswalk
    {
      block = {
        { 69 },
        { 85 },
        { 101 }
      },
      offsetY = -1,
      chance = 0.2,
      stopOnMatch = true,
      pattern = {
        a, -s, -s, -s, a,
        s, s, s, s, s,
        s, s, s, s, s,
        s, s, s, s, s,
        a, -s, -s, -s, a
      }
    },
    -- street 2x vertical crosswalk
    {
      block = {
        { 69 },
        { 101 }
      },
      offsetY = -1,
      chance = 0.2,
      stopOnMatch = true,
      pattern = {
        a, -s, -s, -s, a,
        s, s, s, s, s,
        s, s, s, s, s,
        -s, -s, -s, -s, -s,
        a, a, a, a, a
      }
    },
    -- street 3x horizontal crosswalk
    {
      block = {
        { 112, 113, 114 }
      },
      offsetX = -1,
      chance = 0.4,
      stopOnMatch = true,
      pattern = {
        a, s, s, s, a,
        -s, s, s, s, -s,
        -s, s, s, s, -s,
        -s, s, s, s, -s,
        a, s, s, s, a
      }
    },
    -- street 2x horizontal crosswalk
    {
      block = {
        { 112, 114 }
      },
      offsetX = -1,
      chance = 0.2,
      stopOnMatch = true,
      pattern = {
        a, s, s, a, a,
        -s, s, s, -s, a,
        -s, s, s, -s, a,
        -s, s, s, -s, a,
        a, s, s, a, a
      }
    },
    -- street vrtical parking place
    {
      sprites = { 100 },
      chance = 0.1,
      stopOnMatch = true,
      pattern = {
        a, s, -s,
        a, s, -s,
        a, s, w
      }
    },
    -- street horizontal parking place
    {
      sprites = { 100 },
      chance = 0.1,
      stopOnMatch = true,
      pattern = {
        -s, -s, -s,
        s, s, s,
        a, a, a
      }
    },
    -- street top left corner
    {
      sprites = { 64 },
      stopOnMatch = true,
      pattern = {
        -s, -s, a,
        -s, s, s,
        a, s, a
      }
    },
    -- street top right corner
    {
      sprites = { 66 },
      stopOnMatch = true,
      pattern = {
        a, -s, -s,
        s, s, -s,
        a, s, a
      }
    },
    -- street bottom left corner
    {
      sprites = { 96 },
      stopOnMatch = true,
      pattern = {
        a, s, a,
        -s, s, s,
        -s, -s, a
      }
    },
    -- street bottom right corner
    {
      sprites = { 98 },
      stopOnMatch = true,
      pattern = {
        a, s, a,
        s, s, -s,
        -s, -s, a
      }
    },
    -- street top left corner
    {
      sprites = { 67 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, s, s,
        a, s, w
      }
    },
    -- street top right corner
    {
      sprites = { 68 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        s, s, a,
        -s, s, a
      }
    },
    -- street bottom left corner
    {
      sprites = { 83 },
      stopOnMatch = true,
      pattern = {
        a, s, -s,
        a, s, s,
        a, a, a
      }
    },
    -- street bottom right corner
    {
      sprites = { 84 },
      stopOnMatch = true,
      pattern = {
        -s, s, a,
        s, s, a,
        a, a, a
      }
    },
    -- street left side
    {
      sprites = { 80 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        -s, s, a,
        a, a, a
      }
    },
    -- street right side
    {
      sprites = { 82 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, s, -s,
        a, a, a
      }
    },
    -- street top side
    {
      sprites = { 65 },
      stopOnMatch = true,
      pattern = {
        a, -s, a,
        a, s, a,
        a, a, a
      }
    },
    -- street bottom side
    {
      sprites = { 97 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, s, a,
        a, -s, a
      }
    },
    -- street all
    {
      sprites = { 81, 99, 81 },
      -- stopOnMatch = true,
      pattern = {
        s
      }
    }
  },
  -- walkway all
  {
    -- walkway top left corner
    {
      sprites = { 77 },
      stopOnMatch = true,
      pattern = {
        -w, -w, a,
        -w, w, w,
        a, w, a
      }
    },
    -- walkway top right corner
    {
      sprites = { 79 },
      stopOnMatch = true,
      pattern = {
        a, -w, -w,
        w, w, -w,
        a, w, a
      }
    },
    -- walkway bottom left corner
    {
      sprites = { 109 },
      stopOnMatch = true,
      pattern = {
        a, w, a,
        -w, w, w,
        -w, -w, a
      }
    },
    -- walkway bottom right corner
    {
      sprites = { 111 },
      stopOnMatch = true,
      pattern = {
        a, w, a,
        w, w, -w,
        -w, -w, a
      }
    },
    -- walkway left side + lamp
    {
      sprites = { 108 },
      stopOnMatch = true,
      chance = 0.1,
      pattern = {
        a, a, a,
        -w, w, a,
        a, a, a
      }
    },
    -- walkway left side
    {
      sprites = { 93 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        -w, w, a,
        a, a, a
      }
    },
    -- walkway right side + lamp
    {
      sprites = { 107 },
      stopOnMatch = true,
      chance = 0.1,
      pattern = {
        a, a, a,
        a, w, -w,
        a, a, a
      }
    },
    -- walkway right side
    {
      sprites = { 95 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, w, -w,
        a, a, a
      }
    },
    -- walkway top side
    {
      sprites = { 78 },
      stopOnMatch = true,
      pattern = {
        a, -w, a,
        a, w, a,
        a, a, a
      }
    },
    -- walkway bottom side
    {
      sprites = { 110 },
      stopOnMatch = true,
      pattern = {
        a, a, a,
        a, w, a,
        a, -w, a
      }
    },
    -- walkway all
    {
      sprites = { 94 },
      -- stopOnMatch = true,
      pattern = {
        w
      }
    }
  },
  -- water
  {
    -- water top pier
    {
      sprites = { 106 },
      stopOnMatch = true,
      pattern = {
        a, w, a,
        a, q, a,
        a, a, a
      }
    },
    -- waves
    {
      sprites = { 119, 120 },
      chance = 0.2,
      stopOnMatch = true,
      pattern = {
        q
      }
    },
    -- water all
    {
      sprites = { 118 },
      stopOnMatch = true,
      pattern = {
        q
      }
    }
  }
}