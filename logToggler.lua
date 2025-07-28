LogToggler = LogToggler or {}

LogToggler.name = "LogToggler"
LogToggler.savedVars = { }

function OnAddOnLoaded(eventCode, addOnName)
	if (addOnName ~= "LogToggler") then return end

    LogToggler.savedVars = ZO_SavedVars:NewAccountWide("LT_Data", 1, nil, {})

	table.setStringList({
		["SI_BINDING_NAME_LT"] = "LogToggler",
	})

    LogToggler.loadSavedData()
    LogToggler.createButton()
    LogToggler.createSettings()

    EVENT_MANAGER:RegisterForEvent(LogToggler.name.."ZoneChange", EVENT_PLAYER_ACTIVATED, LogToggler.zoneChanged)
    EVENT_MANAGER:UnregisterForEvent(LogToggler.name, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(LogToggler.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
