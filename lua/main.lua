local currentRules = 0

function tileNumberToCoords(tile_number)
  local x = tile_number % 16 * 8
  local y = flr(tile_number / 16) * 8
  return x, y
end


function readPixelMap(startX, startY, endX, endY)
  -- read pixels from sprite sheet
  -- from y=64 to 81 and from x=0 to 32
  local level = create2DArr(endX - startX + 1, endY - startY + 1)
  for x = startX, endX do
      for y = startY, endY do
          local color = sget(x, y)
          level[x - startX + 1][y - startY + 1] = color
      end
  end
  return level
end

function createCave()
  local startX, startY = tileNumberToCoords(192)
  local endX, endY = tileNumberToCoords(255)
  local level = readPixelMap(startX, startY, endX + 8, endY + 8) -- cave
  createMap(caveRules, level)
end

function createCity()
  local startX, startY = tileNumberToCoords(192)
  local endX, endY = tileNumberToCoords(255)
  local level = readPixelMap(startX, startY, endX + 8, endY + 8) -- city
  createMap(cityRules, level)
end

function createDungeon()
  local startX, startY = tileNumberToCoords(192)
  local endX, endY = tileNumberToCoords(255)
  local level = readPixelMap(startX, startY, endX + 8, endY + 8) -- dungeon
  createMap(dungeonRules, level)
end

_init = function()
  createTiles()
end

function createTiles()
  if currentRules < 0 then currentRules = 2 end
  if currentRules > 2 then currentRules = 0 end
  if currentRules == 0 then createDungeon() end
  if currentRules == 1 then createCity() end
  if currentRules == 2 then createCave() end
end

function nextRules()
  currentRules += 1
  createTiles()
end

function previousRules()
  currentRules -= 1
  createTiles()
end

-- the coordinates of the upper left corner of the camera
cam_x = 0
cam_y = 0

function _update()
  if (btn(0) and cam_x > 0) cam_x -= 10
  if (btn(1) and cam_x < 895 - 8) cam_x += 10
  if (btn(2) and cam_y > 0) cam_y -= 10
  if (btn(3) and cam_y < 127) cam_y += 10
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
  map(0, 0, 0, 0, 128, 128)
  -- drawMiniMap(cam_x, cam_y)

  -- reset the camera then print the camera
  -- coordinates on screen
  camera()
  --   print('('..cam_x..', '..cam_y..')', 0, 0, 7)
end