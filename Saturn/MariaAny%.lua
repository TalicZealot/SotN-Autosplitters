-- Castlevania: Nocturne in the Moonlight / Sotn Saturn autosplitter for LiveSplit made by TalicZealot
-- Base code by Trysdyn Black
-- Requires LiveSplit 1.7+

world = -1
stage = -1
boss = false
local started = false
local splits = {}
splits["Hippogryph"] =
{
    on = true,
    split = false
}
splits["SecondCastle"] =
{
    on = true,
    split = false
}
splits["Medusa"] =
{
    on = true,
    split = false
}
splits["Shaft"] =
{
    on = true,
    split = false
}
local hippoSpawned = false
local medusaSpawned = false
local shaftSpawned = false

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
    splits["Hippogryph"].split = false
    splits["SecondCastle"].split = false
    splits["Medusa"].split = false
    splits["Shaft"].split = false
    hippoSpawned = false
    medusaSpawned = false
    shaftSpawned = false
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

    local mapXposition = MapXposition()
    local mapYposition = MapYposition()
    local bossEntityHp = BossHp()

    if splits["Hippogryph"].on and not splits["Hippogryph"].split then

        if bossEntityHp > 1  and (mapXposition == 23 or mapXposition == 24) and mapYposition == 13 then
            hippoSpawned = true
        elseif hippoSpawned and bossEntityHp < 1  and (mapXposition == 23 or mapXposition == 24) and mapYposition == 13 then
            print("Split: Hippogryph")
            pipe_handle:write("split\r\n")
            pipe_handle:flush()
            splits["Hippogryph"].split = true
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

    if splits["Medusa"].on and not splits["Medusa"].split then
        if bossEntityHp > 1 and (mapXposition == 39 or mapXposition == 40) and mapYposition == 50 then
            medusaSpawned = true
        elseif medusaSpawned and bossEntityHp < 1 and (mapXposition == 39 or mapXposition == 40) and mapYposition == 50 then
            print("Split: Medusa")
            pipe_handle:write("split\r\n")
            pipe_handle:flush()
            splits["Medusa"].split = true
        end
    end

    if splits["Shaft"].on and not splits["Shaft"].split then
        if bossEntityHp > 1 and mapXposition == 31 and mapYposition == 34 then
            shaftSpawned = true
        elseif shaftSpawned and bossEntityHp < 1 and mapXposition == 31 and mapYposition == 34 then
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