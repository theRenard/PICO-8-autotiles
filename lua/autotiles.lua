cls(3)

-- Constants
local drawStep = false
local dungeonWidth = 128
local dungeonHeight = 128

-- Tiles
local emptyTile = nil
local rockTile = 4
local wallTile = 5
local floorTile = 7
local openDoorTile = 12
local closedDoorTile = 8
local exitTile = 9

local dungeon = create2DArr(dungeonWidth, dungeonHeight, rockTile)
local ruledDungeon = create2DArr(dungeonWidth, dungeonHeight, rockTile)

function addRandomPoints()
    for i = 1, 50 do
        local x = intRnd(dungeonWidth) + 1
        local y = intRnd(dungeonHeight) + 1
        dungeon[x][y] = floorTile
    end
end

function setTiles()
    forEachArr2D(
        dungeon, function(x, y)
            setTileAt(x, y)
        end
    )
end

function isInBounds(x, y)
    return x <= dungeonWidth and y <= dungeonHeight and x > 0 and y > 0
end

function setTileAt(x, y)
    for _, rule in pairs(rules) do
        if rule.active then
            local match = true
            for i = 1, #directions[rule.size] do
                local pos = directions[rule.size][i]
                local dx = pos[1]
                local dy = pos[2]
                if isInBounds(x + dx, y + dy) then
                    local tile = rule.pattern[i]
                    if tile == 'all' then
                        match = true
                    elseif dungeon[x + dx][y + dy] != tile then
                        match = false
                        break
                    end
                else
                    match = false
                    break
                end
            end
            if match then
                if rnd() < rule.chance then
                    local sprite = getRandomItem(rule.sprites)
                    ruledDungeon[x][y] = sprite
                end
            end
        end
    end
end

function drawDungeon()
    forEachArr2D(
        ruledDungeon, function(x, y)
            if ruledDungeon[x][y] != nil then
                pset(x - 1, y - 1, ruledDungeon[x][y])
            end
        end
    )
end

_init = function()
    addRandomPoints()
    setTiles()
end

-- the coordinates of the upper left corner of the camera
cam_x = 0
cam_y = 0

function _update()
    if (btn(0) and cam_x > 0) cam_x -= 10
    if (btn(1) and cam_x < 895) cam_x += 10
    if (btn(2) and cam_y > 0) cam_y -= 10
    if (btn(3) and cam_y < 127) cam_y += 10
    -- (the camera stops with the bottom of
    -- the screen at row 32.)
end

function _draw()
    cls(3)
    -- set the camera to the current location
    camera(cam_x, cam_y)

    -- draw the entire map at (0, 0), allowing
    -- the camera and clipping region to decide
    -- what is shown
    drawDungeon()

    -- reset the camera then print the camera
    -- coordinates on screen
    camera()
    --   print('('..cam_x..', '..cam_y..')', 0, 0, 7)
end