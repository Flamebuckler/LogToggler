LT = LT or {}

LT.showButtonDefault = true
LT.showReminderDefault = false

function LT.createSettings()
    local LAM = LibAddonMenu2
    local panelName =  LT.name.." - Options"

    local panelData = {
        type = "panel",
        name = LT.name,
        author = "@Flamebuckler",
    }
    local panel = LAM:RegisterAddonPanel(panelName, panelData)

    local optionsData = {
        {
            type = "checkbox",
            name = "Show button",
            tooltip = "Shows the chat windows button",
            getFunc = function() return LT.getShowButton() end,
            setFunc = function(value) LT.setShowButton(value) end
        },
        {
            type = "checkbox",
            name = "Show reminder",
            tooltip = "Shows an activation reminder when entering a trial",
            getFunc = function() return LT.getShowReminder() end,
            setFunc = function(value) LT.setShowReminder(value) end
        }
    }

    LAM:RegisterOptionControls(panelName, optionsData)
end

function LT.loadSavedData()
    -- ShowButtom
    if LT.savedVars.showButton == nil then
        LT.showButton = LT.showButtonDefault
    else
        LT.showButton = LT.savedVars.showButton
    end

    -- showReminder
    if LT.savedVars.showReminder == nil then
        LT.showReminder = LT.showReminderDefault
    else
        LT.showReminder = LT.savedVars.showReminder
    end
end

-- ShowButtom
function LT.setShowButton(value)
    LT.showButton = value
	LT.savedVars.showButton = value
    LT.updateVisibiliy()
end
function LT.getShowButton()
    return LT.showButton
end

-- ShowReminder
function LT.setShowReminder(value)
    LT.showReminder = value
	LT.savedVars.showReminder = value
end
function LT.getShowReminder()
    return LT.showReminder
end
