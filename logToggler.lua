LT = LT or {}
LT.name = "LogToggler"
LT.savedVars = { }

function OnAddOnLoaded(eventCode, addOnName)
	if (addOnName ~= "LogToggler") then return end

    LT.savedVars = ZO_SavedVars:NewAccountWide("LT_Data", 1, nil, {})

	table.setStringList({
		["SI_BINDING_NAME_LT"] = "LogToggler",
	})

    LT.loadSavedData()
    LT.createButton()
    LT.createSettings()

    EVENT_MANAGER:RegisterForEvent(LT.name.."ZoneChange", EVENT_PLAYER_ACTIVATED, LT.zoneChanged)
    EVENT_MANAGER:UnregisterForEvent(LT.name, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(LT.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
