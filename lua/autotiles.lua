-- Copyright (c) 2024 Daniele Tabanella under the MIT license

function make_map(rules, level)
    -- Constants
    local w, h = #level, #level[1]
    local ruled_lvl, skip = mk2darr(w, h, 0), mk2darr(w, h, false)

    local dirs = {
        [1] = { { 0, 0 } },
        [3] = {},
        [5] = {}
    }

    for y = -1, 1 do
        for x = -1, 1 do
            add(dirs[3], { x, y })
        end
    end

    for y = -2, 2 do
        for x = -2, 2 do
            add(dirs[5], { x, y })
        end
    end

    local function in_bound(x, y)
        return x <= w and y <= h and x > 0 and y > 0
    end

    local function set_tl(x, y)
        if level[x][y] == 0 or skip[x][y] then
            return
        end
        for rule_group in all(rules) do
            for rule in all(rule_group) do
                local active = rule.active == nil or rule.active
                if active then
                    local match = false
                    local size = ({ [1] = 1, [9] = 3, [25] = 5 })[#rule.pattern] or 1
                    for i = 1, #dirs[size] do
                        local dx, dy = dirs[size][i][1], dirs[size][i][2]
                        local tile = rule.pattern[i]
                        if in_bound(x + dx, y + dy) then
                            -- if the tile is 'all' then it will match any tile
                            -- if the tile is a number then it will match that specific tile
                            -- if the tile is a negative number then it will match any tile except that specific tile
                            if tile == 'all' or (tile > 0 and level[x + dx][y + dy] == tile) or (tile < 0 and level[x + dx][y + dy] != -tile) then
                                match = true
                            else
                                match = false
                                break
                            end
                        else
                            -- if the tile is out of bounds then it will match only if the tile is 'all' or 0
                            if tile == 'all' or tile == 0 then
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
                            if rule.block then
                                local blk_h, blk_w = #rule.block, #rule.block[1]
                                local start_x, start_y = x + (rule.offsetX or 0), y + (rule.offsetY or 0)
                                for dy = 1, blk_h do
                                    for dx = 1, blk_w do
                                        ruled_lvl[start_x + dx - 1][start_y + dy - 1] = rule.block[dy][dx]
                                        -- we don't want to check these tiles again
                                        skip[start_x + dx - 1][start_y + dy - 1] = true
                                    end
                                end
                            elseif rule.sprites then
                                local sprite = get_rnd_item(rule.sprites)
                                ruled_lvl[x][y] = sprite
                            end
                            -- stop is false only if it's not defined
                            local stop = rule.stop == nil or rule.stop
                            if stop then
                                -- if stop is true then it will stop checking the other rules
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    local function make_tiles()
        foreach_2darr(
            level, function(x, y)
                set_tl(x, y)
            end
        )
    end

    function draw_map(dx, dy)
        foreach_2darr(
            level, function(x, y)
                local color = level[x][y]
                if color != nil and color != 0 then
                    pset(x - 1 + dx, y - 1 + dy, level[x][y])
                end
            end
        )
    end

    local function set_map()
        foreach_2darr(
            ruled_lvl, function(x, y)
                mset(x - 1, y - 1, ruled_lvl[x][y])
            end
        )
    end

    make_tiles()
    set_map()
end