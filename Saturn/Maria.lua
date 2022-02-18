-- Castlevania: Nocturne in the Moonlight / Sotn Saturn autosplitter for LiveSplit made by TalicZealot
-- Base code by Trysdyn Black
-- Requires LiveSplit 1.7+

local started = false
local splits = {
    ["SecondCastle"] ={ on = true, split = false },
    ["Shaft"] = { on = true, split = false, spawned = false },
    ["Olrox"] = { on = true, split = false, boss = true },
    ["Doppleganger10"] = { on = true, split = false, boss = true },
    ["Granfaloon"] = { on = true, split = false, boss = true },
    ["Scylla"] = { on = true, split = false, boss = true },
    ["Solgra and Gaibon"] = { on = true, split = false, boss = true },	
    ["Hippogryph"] = { on = true, split = false, boss = true },
    ["Beelzebub"] = { on = true, split = false, boss = true },
    ["Karasuman"] = { on = true, split = false, boss = true },
    ["Trio"] = { on = true, split = false, boss = true },
    ["Cerberus"] = { on = true, split = false, boss = true },
    ["Medusa"] = { on = true, split = false, boss = true },
    ["Creature"] = { on = true, split = false, boss = true },
    ["LesserDemon"] = { on = true, split = false, boss = true },
    ["Doppleganger40"] = { on = true, split = false, boss = true },
    ["Akmodan"] = { on = true, split = false, boss = true },
    ["DarkwingBat"] = { on = true, split = false, boss = true },
    ["Galamoth"] = { on = true, split = false, boss = true },
    ["SkeletonLeader"] = { on = true, split = false, boss = true }
}
local bosses = {
	["Olrox"] = 0x05D834,
    ["Doppleganger10"] = 0x05D838,
    ["Granfaloon"] = 0x05D83C,
    ["Scylla"] = 0x05D844,
    ["Solgra and Gaibon"] = 0x05D848,	
    ["Hippogryph"] = 0x05D84C,
    ["Beelzebub"] = 0x05D850,
    ["Karasuman"] = 0x05D858,
    ["Trio"] = 0x05D85C,
    ["Cerberus"] = 0x05D864,
    ["Medusa"] = 0x05D86C,
    ["Creature"] = 0x05D870,
    ["LesserDemon"] = 0x05D874,
    ["Doppleganger40"] = 0x05D878,
    ["Akmodan"] = 0x05D87C,
    ["DarkwingBat"] = 0x05D880,
    ["Galamoth"] = 0x05D884,
    ["SkeletonLeader"] = 0x05D888
}


local function init_livesplit()
    pipe_handle = io.open("//./pipe/LiveSplit", 'a')

    if not pipe_handle then
        error("\nFailed to open LiveSplit named pipe!\n" ..
              "Please make sure LiveSplit is running and is at least 1.7, " ..
              "then load this script again")
    end

    pipe_handle:write("reset\r\n")
    pipe_handle:flush()
    print("Connected to LiveSplit")

    return pipe_handle
end

local function RestartSplits()
    for key, val in pairs(splits) do
        splits[key].split = false
    end
    splits["Shaft"].spawned = false
end

local function MapXposition()
    local mapXmin = memory.readbyte(0x05CE6A)
    local mapXoffset = memory.readbyte(0x05C685)
    return mapXmin + mapXoffset
end

local function MapYposition()
    local mapYmin = memory.readbyte(0x05CE76)
    local mapYoffset = memory.readbyte(0x05C5B7)
    return mapYmin + mapYoffset
end

local function InvertedCastle()
    return memory.readbyte(0x05D336) > 0
end

local function BossDefeated(address)
    return memory.read_s32_le(address) > 0
end

local function BossHp()
    return memory.read_s16_le(0x09D1B4)
end

local function Start()
    local hours = memory.readbyte(0x05C9D6)
    local minutes = memory.readbyte(0x05C9DA)
    local seconds = memory.readbyte(0x05C9DE)
    local frames = memory.readbyte(0x05C9E2)
    if hours == 0 and minutes == 0 and seconds == 15 and frames > 2 then
        started = true
        return true
    end
end

local function Restart()
    local hours = memory.readbyte(0x05C9D6)
    local minutes = memory.readbyte(0x05C9DA)
    local seconds = memory.readbyte(0x05C9DE)
    local frames = memory.readbyte(0x05C9E2)
    if hours == 0 and minutes == 0 and seconds < 10 then
        started = false
        return true
    end
end

local function main()

    if started == false and Start() then
        print("Start")
        pipe_handle:write("starttimer\r\n")
        pipe_handle:flush()
        return
    end

    if started == false then
        return
    end

    if Restart() then
        RestartSplits()
        print("Restart")
        pipe_handle:write("reset\r\n")
        pipe_handle:flush()
        return
    end

    for key, val in pairs(splits) do
        if splits[key].on and splits[key].split == false and splits[key].boss then
            if BossDefeated(bosses[key]) then
                print("Split: ".. key)
                pipe_handle:write("split\r\n")
                pipe_handle:flush()
                splits[key].split = true
            end
        end
    end

    if splits["SecondCastle"].on and not splits["SecondCastle"].split then
        if InvertedCastle() then
            print("Split: SecondCastle")
            pipe_handle:write("split\r\n")
            pipe_handle:flush()
            splits["SecondCastle"].split = true
        end
    end

    if splits["Shaft"].on and not splits["Shaft"].split then
        local mapXposition = MapXposition()
        local mapYposition = MapYposition()
        local bossEntityHp = BossHp()
        if bossEntityHp > 1 and bossEntityHp < 1300 and mapXposition == 31 and mapYposition == 34 then
            splits["Shaft"].spawned = true
        elseif splits["Shaft"].spawned and bossEntityHp < 1 and mapXposition == 31 and mapYposition == 34 then
            print("Split: Shaft")
            pipe_handle:write("split\r\n")
            pipe_handle:flush()
            splits["Shaft"].split = true
        end
    end

end

-- Set up our TCP socket to LiveSplit and send a reset to be sure
pipe_handle = init_livesplit()
memory.usememorydomain("Work Ram High")

while true do
    main()
    emu.frameadvance()
end