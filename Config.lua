local _, EMPL = ...
EMPL.Config = {}

local Config = EMPL.Config
local cFrame
local mythicPlusLevelsaved = 5

local defaults = {
    mythicPlusLevel = 10,
    showGroupFinderFrame = true,
}

function Config:Initialize()
    if EMPL.loaded == false then
        return
    end
    EMPLdb = EMPLdb or {}
    EMPLdb.trackedLoot = EMPLdb.trackedLoot or {}
    EMPLdb.lootIntegritySuccess = EMPLdb.lootIntegritySuccess or false
    for k, v in pairs(defaults) do
        if EMPLdb[k] == nil then
            EMPLdb[k] = v
        end
    end
    mythicPlusLevelsaved = EMPLdb.mythicPlusLevel
end

function Config:Reset()
    if EMPL.loaded == false then
        return
    end
    for k, v in pairs(defaults) do
        EMPLdb[k] = v
    end
    mythicPlusLevelsaved = EMPLdb.mythicPlusLevel
    print("EMPL: DB has been resetted to default")
end

function Config:UpdateTrackedLoot()
    if EMPL.loaded == false then
        return
    end

end

function Config:Toggle()
    local menu = cFrame or Config:CreateMenu()
    menu:SetShown(not menu:IsShown())
    if not menu:IsShown() then
        mythicPlusLevelsaved = EMPLdb.mythicPlusLevel
    end
end

function Config:CreateButton(point, relativeFrame, relativePoint, xOffset, yOffset, text)
    local button = CreateFrame("Button", nil, cFrame, "UIPanelButtonTemplate")
    button:ClearAllPoints()
    button:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    button:SetSize(100, 25)
    button:SetText(text)
    return button
end

function Config:CreateMenu() 
    if EMPL.loaded == false then
        return
    end
    cFrame = CreateFrame("Frame", "EMPLOptions", UIParent, "BasicFrameTemplateWithInset")
    cFrame:SetSize(300, 280)
    cFrame:SetPoint("CENTER")
    cFrame.title = cFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cFrame.title:SetPoint("CENTER", cFrame.TitleBg, "CENTER", 5, 0)
    cFrame.title:SetText("Enhanced Mythic+ Loot Config")
    cFrame.title:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    cFrame:SetMovable(true)
    cFrame:EnableMouse(true)
    cFrame:RegisterForDrag("LeftButton")
    cFrame:SetScript("OnDragStart", cFrame.StartMoving)
    cFrame:SetScript("OnDragStop", cFrame.StopMovingOrSizing)
    cFrame:SetClampedToScreen(true)
    cFrame:SetFrameStrata("DIALOG")
    cFrame:SetToplevel(true)
    cFrame:Hide()

    cFrame.mythicPlusLevel = CreateFrame("Slider", "EMPLMythicPlusLevel", cFrame, "OptionsSliderTemplate")
    cFrame.mythicPlusLevel:SetSize(200, 20)
    cFrame.mythicPlusLevel:SetPoint("TOP", cFrame, "TOP", 0, -40)
    cFrame.mythicPlusLevel:SetMinMaxValues(1, 10)
    cFrame.mythicPlusLevel:SetValueStep(1)
    cFrame.mythicPlusLevel:SetObeyStepOnDrag(true)
    cFrame.mythicPlusLevel:SetValue(EMPLdb.mythicPlusLevel)
    cFrame.mythicPlusLevel:SetScript("OnValueChanged", function(self, value)
        mythicPlusLevelsaved = value
        if (mythicPlusLevelsaved ~= EMPLdb.mythicPlusLevel) then
            cFrame.mythicPlusLevelText:SetText("Mythic+ Level: " .. EMPLdb.mythicPlusLevel .. " -> " .. mythicPlusLevelsaved)
            cFrame.saveButton:Enable()
        else
            cFrame.mythicPlusLevelText:SetText("Mythic+ Level: " .. EMPLdb.mythicPlusLevel)
            cFrame.saveButton:Disable()
        end
    end)
    cFrame.mythicPlusLevelText = cFrame.mythicPlusLevel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cFrame.mythicPlusLevelText:SetPoint("TOP", cFrame.mythicPlusLevel, "BOTTOM", 0, -5)
    cFrame.mythicPlusLevelText:SetText("Mythic+ Level: " .. EMPLdb.mythicPlusLevel)
    cFrame.mythicPlusLevel.Low:SetText("1")
    cFrame.mythicPlusLevel.High:SetText("10")

    cFrame.toggleGroupFinderFrame = EMPL.Config:CreateButton("TOP", cFrame, "TOP", 0, -90, "Group Finder Frame: " .. (EMPLdb.showGroupFinderFrame and "Enabled" or "Disabled"))
    cFrame.toggleGroupFinderFrame:SetSize(200, 30)
    cFrame.toggleGroupFinderFrame:SetScript("OnClick", function()
        EMPLdb.showGroupFinderFrame = not EMPLdb.showGroupFinderFrame
        cFrame.toggleGroupFinderFrame:SetText("Group Finder Frame: " .. (EMPLdb.showGroupFinderFrame and "Enabled" or "Disabled"))
        EMPL.GroupFinderFrame:Toggle()
    end)

    cFrame.clearChecked = EMPL.Config:CreateButton("BOTTOM", cFrame, "BOTTOM", 0, 107, "Clear checkd items")
    cFrame.clearChecked:SetSize(200, 30)
    cFrame.clearChecked:SetScript("OnClick", function()
        EMPL.MainFrame:DestroyChildren()
        Config:ClearCheckedItems()
        EMPL.MainFrame:Update()
        EMPL.GroupFinderFrame:Update()
    end)

    cFrame.clearAll = EMPL.Config:CreateButton("BOTTOM", cFrame, "BOTTOM", 0, 72, "Clear all item data")
    cFrame.clearAll:SetSize(200, 30)
    cFrame.clearAll:SetScript("OnClick", function()
        EMPL.MainFrame:DestroyChildren()
        Config:ClearCheckedItems()
        EMPL.LootTables:Reset()
        EMPL.MainFrame:Update()
        EMPL.GroupFinderFrame:Update()
    end)

    cFrame.cancelButton = EMPL.Config:CreateButton("BOTTOM", cFrame, "BOTTOM", -60, 20, "Exit")
    cFrame.cancelButton:SetSize(100, 30)
    cFrame.cancelButton:SetScript("OnClick", function()
        Config:Toggle()
    end)

    cFrame.saveButton = EMPL.Config:CreateButton("BOTTOM", cFrame, "BOTTOM", 60, 20, "Save")
    cFrame.saveButton:SetSize(100, 30)
    cFrame.saveButton:SetScript("OnClick", function()
        if (mythicPlusLevelsaved ~= EMPLdb.mythicPlusLevel) then
            EMPLdb.mythicPlusLevel = mythicPlusLevelsaved
            EMPLdb.lootIntegritySuccess = false
            EMPL.MainFrame:DestroyChildren()
            EMPL.MainFrame:Update()
        end
    end)
    cFrame.saveButton:Disable()

    cFrame:Hide()
    return cFrame
end

function Config:ClearCheckedItems()
        EMPLdb.trackedLoot = {}
end