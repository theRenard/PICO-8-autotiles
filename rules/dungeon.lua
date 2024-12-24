-- tiles by https://kenney.nl/assets/micro-roguelike

local e = 0
local s = 5 --external pathway
local b = -s -- not external pathway
local w = 6 -- internal pathway
local n = -w -- not internal pathway
local q = 12 -- water
local g = 11 -- grass
local a = 'all'

dungeonRules = {
  -- walls & pathways
  {
    -- random tree on internal pathway
    {
      sprites = { 164, 165, 166, 167, 171, 172, 145, 145, 145, 145, 145, 145 },
      -- chance = 0.4,
      stopOnMatch = false,
      pattern = {
        w
      }
    },
    -- random bottom door
    {
      sprites = { 130, 162 },
      chance = 0.1,
      pattern = {
        a, a, a,
        w, w, w,
        a, s, a
      }
    },
    -- random top door
    {
      sprites = { 169, 162 },
      chance = 0.1,
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
      pattern = {
        a, a, a,
        w, w, w,
        a, s, a
      }
    },
    -- top right corner
    {
      sprites = { 128 },
      pattern = {
        a, s, a,
        s, w, a,
        a, a, a
      }
    },
    -- top left corner
    {
      sprites = { 131 },
      pattern = {
        a, s, a,
        a, w, s,
        a, a, a
      }
    },
    -- bottom right corner
    {
      sprites = { 160 },
      pattern = {
        a, a, a,
        s, w, a,
        a, s, a
      }
    },
    -- bottom left corner
    {
      sprites = { 163 },
      pattern = {
        a, a, a,
        a, w, s,
        a, s, a
      }
    },
    -- bottom left inner corner
    {
      sprites = { 176 },
      pattern = {
        a, w, s,
        a, w, w,
        a, a, a
      }
    },
    -- top left inner corner
    {
      sprites = { 178 },
      pattern = {
        a, a, a,
        a, w, w,
        a, w, s
      }
    },
    -- bottom right inner corner
    {
      sprites = { 177 },
      pattern = {
        s, w, a,
        w, w, a,
        a, a, a
      }
    },
    -- top right inner corner
    {
      sprites = { 179 },
      pattern = {
        a, a, a,
        w, w, a,
        s, w, a
      }
    },
    -- top wall
    {
      sprites = { 129 },
      pattern = {
        a, s, a,
        w, w, w,
        a, a, a
      }
    },
    -- bottom wall
    {
      sprites = { 129 },
      pattern = {
        a, a, a,
        w, w, w,
        a, s, a
      }
    },
    -- left wall
    {
      sprites = { 144 },
      pattern = {
        a, a, a,
        s, w, a,
        a, a, a
      }
    },
    -- right wall
    {
      sprites = { 147 },
      pattern = {
        a, a, a,
        a, w, s,
        a, a, a
      }
    },
    -- external pathway with random trees
    {
      sprites = { 164, 165, 166, 167, 171, 172, 145, 145, 145, 145, 145, 145 },
      chance = 0.1,
      pattern = {
        s
      }
    },
    {
      sprites = { 145 },
      pattern = {
        s
      }
    },
  },
  -- water
  {
    -- water top right corner
    {
      sprites = { 143 },
      pattern = {
        a, -q, a,
        q, q, -q,
        a, q, a
      }
    },
    -- water top left corner
    {
      sprites = { 141 },
      pattern = {
        a, -q, a,
        -q, q, q,
        a, q, a
      }
    },
    -- water bottom right corner
    {
      sprites = { 175 },
      pattern = {
        a, q, a,
        q, q, -q,
        a, -q, a
      }
    },
    -- water bottom left corner
    {
      sprites = { 173 },
      pattern = {
        a, q, a,
        -q, q, q,
        a, -q, a
      }
    },
    -- water top wall
    {
      sprites = { 142 },
      pattern = {
        a, -q, a,
        q, q, q,
        a, a, a
      }
    },
    -- water bottom wall
    {
      sprites = { 174 },
      pattern = {
        a, a, a,
        q, q, q,
        a, -q, a
      }
    },
    -- water left wall
    {
      sprites = { 157 },
      pattern = {
        a, q, a,
        -q, q, a,
        a, q, a
      }
    },
    -- water right wall
    {
      sprites = { 159 },
      pattern = {
        a, q, a,
        a, q, -q,
        a, q, a
      }
    },
    -- water
    {
      sprites = { 158 },
      pattern = {
        q
      }
    }
  },
  -- grass
  {
    {
      sprites = { 172 },
      pattern = {
        g
      }
    }
  }

}