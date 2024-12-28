local curr = 0
local width = 128
local height = 32
local startX = 0
local startY = 96

local level = mk2darr(width, height, 0)

foreach_2darr(
  level, function(x, y)
    level[x][y] = sget(x + startX - 1, y + startY - 1)
  end
)

function create_cave()
  -- make_map(caveRules, level)
end

function create_city()
  -- make_map(cityRules, level)
end

function create_dung()
  make_map(dungeonRules, level)
end

_init = function()
  createTiles()
end

function createTiles()
  if curr < 0 then curr = 2 end
  if curr > 2 then curr = 0 end
  if curr == 0 then create_dung() end
  if curr == 1 then create_city() end
  if curr == 2 then create_cave() end
end

function nextRules()
  curr += 1
  createTiles()
end

function previousRules()
  curr -= 1
  createTiles()
end

-- the coordinates of the upper left corner of the camera
cam_x = 0
cam_y = 0

function _update()
  if (btn(0) and cam_x > 0) cam_x -= 8
  if (btn(1) and cam_x < 895) cam_x += 8
  if (btn(2) and cam_y > 0) cam_y -= 8
  if (btn(3) and cam_y < 127) cam_y += 8
  -- (the camera stops with the bottom of
  -- the screen at row 32.)
  if (btn(4)) previousRules()
  if (btn(5)) nextRules()
end

function _draw()
  cls()
  -- set the camera to the current location
  camera(cam_x, cam_y)

  -- draw the entire map at (0, 0), allowing
  -- the camera and clipping region to decide
  -- what is shown
  map(0, 0, 0, 0, width, height)
  -- draw_map(cam_x, cam_y)

  -- reset the camera then print the camera
  -- coordinates on screen
  camera()
  --   print('('..cam_x..', '..cam_y..')', 0, 0, 7)
end