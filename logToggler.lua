LogToggler = LogToggler or {}

LogToggler.name = "LogToggler"
LogToggler.savedVars = {}

-- Icon paths as constants
LogToggler.ICONS = {
    DISABLED = "LogToggler/imgs/log_disabled.dds",
    DISABLED_HOVER = "LogToggler/imgs/log_disabled_hover.dds",
    ENABLED = "LogToggler/imgs/log_enabled.dds",
    ENABLED_HOVER = "LogToggler/imgs/log_enabled_hover.dds"
}

-- Localization strings
LogToggler.strings = {
    ENABLE_LOG = "Enable encounter log",
    DISABLE_LOG = "Disable encounter log",
    LOG_ENABLED_MSG = "Encounter log enabled.",
    LOG_DISABLED_MSG = "Encounter log disabled."
}

function OnAddOnLoaded(eventCode, addOnName)
    if (addOnName ~= "LogToggler") then return end

    -- Check for required libraries
    if not LibChatMenuButton then
        d("[LogToggler] Error: LibChatMenuButton not found!")
        return
    end

    if not LibAddonMenu2 then
        d("[LogToggler] Error: LibAddonMenu2 not found!")
        return
    end

    LogToggler.savedVars = ZO_SavedVars:NewAccountWide("LogToggler_Data", 1, nil, {})

    ZO_CreateStringId("SI_BINDING_NAME_LT_TOGGLE_ENCOUNTERLOG", "LogToggler")

    LogToggler.loadSavedData()
    LogToggler.createButton()
    LogToggler.createSettings()

    EVENT_MANAGER:UnregisterForEvent(LogToggler.name, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(LogToggler.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
