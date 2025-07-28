LT = LT or {}

local trialZoneIds = {
    [636] = true, -- Hel Ra Citadel
    [638] = true, -- Aetherian Archive
    [639] = true, -- Sanctum Ophidia
    [725] = true, -- Maw of Lorkhaj
    [975] = true, -- Halls of Fabrication
    [1000] = true, -- Asylum Sanctorium
    [1051] = true, -- Cloudrest
    [1121] = true, -- Sunspire
    [1196] = true, -- Kynes Aegis
    [1207] = true, -- Rockgrove
    [1227] = true, -- Dreadsail Reef
    [1427] = true, -- Sanity's Edge
    [1478] = true, -- Lucent Citadel
}

local mainText = "You have entered a trial!"
local secondaryText = "Don't forget to enable the encounter log."
local lastZoneId = nil

function LT.zoneChanged()
    local zoneId = GetZoneId(GetUnitZoneIndex("player"))
    local trialId = trialZoneIds[zoneId] 

    if trialZoneIds[zoneId] and LT.isReminder() and zoneId ~= lastZoneId then
        lastZoneId = zoneId
        LT.showMessage()
    else
        lastZoneId = nil
    end
end

function LT.showMessage()
    d(mainText.." "..secondaryText)

    local params = CENTER_SCREEN_ANNOUNCE:CreateMessageParams(CSA_CATEGORY_LARGE_TEXT, SOUNDS.ENLIGHTENED_STATE_GAINED)
    params:SetCSAType(CENTER_SCREEN_ANNOUNCE_TYPE_POI_DISCOVERED)
    params:SetText(mainText, secondaryText )
    params:SetLifespanMS(10000)
    CENTER_SCREEN_ANNOUNCE:AddMessageWithParams(params)
end

function LT.isReminder()
    if IsEncounterLogEnabled() then return false end

    return LT.getShowReminder()
end