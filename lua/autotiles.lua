cls()

-- Constants
local dungeonWidth = 128
local dungeonHeight = 128

-- Tiles
local dungeon = create2DArr(dungeonWidth, dungeonHeight, 0)
local ruledDungeon = create2DArr(dungeonWidth, dungeonHeight, 0)

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
    for rule in all(rules) do
        local active = rule.active or true
        if active then
            local match = false
            local size = #rule.pattern == 1 and 1 or 3
            for i = 1, #directions[size] do
                local pos = directions[size][i]
                local dx = pos[1]
                local dy = pos[2]
                local tile = rule.pattern[i]
                if isInBounds(x + dx, y + dy) then
                    -- if the tile is 'all' then it will match any tile
                    -- if the tile is a number then it will match that specific tile
                    -- if the tile is a negative number then it will match any tile except that specific tile
                    if tile == 'all' or (tile > 0 and dungeon[x + dx][y + dy] == tile) or (tile < 0 and dungeon[x + dx][y + dy] != -tile) then
                        match = true
                    else
                        match = false
                        break
                    end
                else -- if the tile is out of bounds then it will match only if the tile is 'all'
                    if tile == 'all' then
                        match = true
                    else
                        match = false
                        break
                    end
                end
            end
            if match then
                local chance = rule.chance or 1
                if rnd() < chance then
                    local sprite = getRandomItem(rule.sprites)
                    ruledDungeon[x][y] = sprite
                end
            end
        end
    end
end

function readPixelMap(startX, startY, endX, endY)
    -- read pixels from sprite sheet
    -- from y=64 to 81 and from x=0 to 32
    for x = startX, endX do
        for y = startY, endY do
            local color = sget(x, y)
            dungeon[x - startX + 1][y - startY + 1] = color
        end
    end
end

function drawMiniMap(dx, dy)
    forEachArr2D(
        dungeon, function(x, y)
            local color = dungeon[x][y]
            if color != nil and color != 0 then
                pset(x - 1 + dx, y - 1 + dy, dungeon[x][y])
            end
        end
    )
end

function getSprite(sprite)
    -- sprite is a number that can have 'h' or 'v' in front of it
    -- to indicate that it is a horizontally or vertically flipped sprite
    local flip = ''
    if sub(sprite, 1, 1) == 'h' then
        flip = 'h'
        sprite = sub(sprite, 2)
    elseif sub(sprite, 1, 1) == 'v' then
        flip = 'v'
        sprite = sub(sprite, 2)
    end
    return sprite, flip

end

function createMap()
    forEachArr2D(
        ruledDungeon, function(x, y)
            if ruledDungeon[x][y] != nil then
                mset(x - 1, y - 1, ruledDungeon[x][y])
            end
        end
    )
end

_init = function()
    readPixelMap(64, 0, 128, 32)
    setTiles()
    createMap()
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
    cls()
    -- set the camera to the current location
    camera(cam_x, cam_y)

    -- draw the entire map at (0, 0), allowing
    -- the camera and clipping region to decide
    -- what is shown
    map(0, 0, 0, 0, 64, 64)
    drawMiniMap(cam_x, cam_y)

    -- reset the camera then print the camera
    -- coordinates on screen
    camera()
    --   print('('..cam_x..', '..cam_y..')', 0, 0, 7)
end