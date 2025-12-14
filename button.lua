LogToggler = LogToggler or {}

function LogToggler.createButton()
    local icons = LogToggler.getButtonIcons()
    LogToggler.button = LibChatMenuButton.addChatButton(
        "LogTogglerChatButton",
        icons,
        LogToggler.getButtonTooltip(),
        function() LogToggler.toggleLogs() end
    )
    LogToggler.updateVisibility()
    LogToggler.updateButtonIcon()
end

function LogToggler.toggleLogs()
    if IsEncounterLogEnabled() then
        SetEncounterLogEnabled(false)
        d(LogToggler.strings.LOG_DISABLED_MSG)
    else
        SetEncounterLogEnabled(true)
        d(LogToggler.strings.LOG_ENABLED_MSG)
    end

    if LogToggler.button then
        LogToggler.button:edit({ ["tooltip"] = LogToggler.getButtonTooltip() })
        LogToggler.updateButtonIcon()
    end
end

function LogToggler.getButtonTooltip()
    if IsEncounterLogEnabled() then
        return LogToggler.strings.DISABLE_LOG
    else
        return LogToggler.strings.ENABLE_LOG
    end
end

function LogToggler.updateButtonIcon()
    if not LogToggler.button then return end

    local icons = LogToggler.getButtonIcons()
    LogToggler.button:edit({
        ["imagePath"] = icons[1],
        ["imagePathHover"] = icons[2]
    })
end

function LogToggler.getButtonIcons()
    if IsEncounterLogEnabled() then
        return { LogToggler.ICONS.ENABLED, LogToggler.ICONS.ENABLED_HOVER }
    else
        return { LogToggler.ICONS.DISABLED, LogToggler.ICONS.DISABLED_HOVER }
    end
end

function LogToggler.updateVisibility()
    if not LogToggler.button then return end

    if LogToggler.showButton then
        LogToggler.button:show()
    else
        LogToggler.button:hide()
    end
end
