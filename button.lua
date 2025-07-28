LT = LT or {}

function LT.createButton()
    LT.button = LibChatMenuButton.addChatButton("LogTogglerChatButton", LT.buttonIcon(), LT.buttonTooltip(), function() LT.toggleLogs() end)
    LT.updateVisibiliy()
    LT.updateButtonIcon()
end

function LT.toggleLogs()
    if IsEncounterLogEnabled() then
        SetEncounterLogEnabled(false)
        d("Encounter log disabled.")
    else
        SetEncounterLogEnabled(true)
        d("Encounter log enabled.")
    end

    LT.button:edit({["tooltip"] = LT.buttonTooltip()})
    LT.updateButtonIcon()
end

function LT.buttonTooltip()
    if IsEncounterLogEnabled() then
        return "Disable encounter log"
    else
        return "Enable encounter log"
    end
end

function LT.updateButtonIcon()
    local logIcon = "LogToggler/imgs/log_disabled.dds"
    local logHoverIcon ="LogToggler/imgs/log_disabled_hover.dds"

    if IsEncounterLogEnabled() then
        logIcon = "LogToggler/imgs/log_enabled.dds"
        logHoverIcon ="LogToggler/imgs/log_enabled_hover.dds"
    end

    LT.button:edit({["imagePath"] = logIcon})
    LT.button:edit({["imagePathHover"] = logHoverIcon})
end

function LT.buttonIcon()
    return {"LogToggler/imgs/log_disabled.dds","LogToggler/imgs/log_disabled_hover.dds"}
end

function LT.updateVisibiliy()
    if LT.showButton then
        LT.button:show()
    else
        LT.button:hide()
    end
end