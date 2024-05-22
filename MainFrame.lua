local _, EMPL = ...
EMPL.MainFrame = {}
local MainFrame = EMPL.MainFrame
local mFrame
local childFrameByDungeon
local childFrameBySlot
local frameWidth = 480
local frameHeight = 600

function MainFrame:CreateFrame()
    if EMPL.loaded == false then
        return
    end
    mFrame = CreateFrame("Frame", "MythicPlusLootMainFrame", UIParent, "UIPanelDialogTemplate")
    mFrame:SetSize(frameWidth, frameHeight)
    mFrame:SetPoint("CENTER")
    mFrame:SetMovable(true)
    mFrame:EnableMouse(true)
    mFrame:RegisterForDrag("LeftButton")
    mFrame:SetScript("OnDragStart", mFrame.StartMoving)
    mFrame:SetScript("OnDragStop", mFrame.StopMovingOrSizing)
    mFrame:SetClampedToScreen(true)
    mFrame:SetFrameStrata("DIALOG")
    mFrame:Hide()

    mFrame.optionsButton = CreateFrame("Button", "EMPLMainFrameConfigButton", mFrame, "UIPanelButtonTemplate")
    mFrame.optionsButton:ClearAllPoints()
    mFrame.optionsButton:SetPoint("TOPLEFT", mFrame, "TOPLEFT", frameWidth - 116, -5)
    mFrame.optionsButton:SetSize(90, 18)
    mFrame.optionsButton:SetText("Options")
    mFrame.optionsButton:SetScript("OnClick", function()
        EMPL.Config.Toggle()
    end)
    mFrame.optionsButton:SetFrameLevel(4)

    mFrame.sortByDungeon = CreateFrame("Button", "EMPLMainFrameSortByDungeonButton", mFrame, "UIPanelButtonTemplate")
    mFrame.sortByDungeon:ClearAllPoints()
    mFrame.sortByDungeon:SetPoint("TOPLEFT", mFrame, "TOPLEFT", 7, -5)
    mFrame.sortByDungeon:SetSize(90, 18)
    mFrame.sortByDungeon:SetText("By Dungeon")
    mFrame.sortByDungeon:SetScript("OnClick", function()
        childFrameBySlot:Hide()
        mFrame.ScrollFrame:SetScrollChild(childFrameByDungeon)
        childFrameByDungeon:Show()
        EMPLdb.byDungeonSelected = true
    end)
    mFrame.sortByDungeon:SetFrameLevel(4)

    mFrame.sortBySlot = CreateFrame("Button", "EMPLMainFrameSortBySlotButton", mFrame, "UIPanelButtonTemplate")
    mFrame.sortBySlot:ClearAllPoints()
    mFrame.sortBySlot:SetPoint("TOPLEFT", mFrame, "TOPLEFT", 94, -5)
    mFrame.sortBySlot:SetSize(90, 18)
    mFrame.sortBySlot:SetText("By Slot")
    mFrame.sortBySlot:SetScript("OnClick", function()
        childFrameByDungeon:Hide()
        mFrame.ScrollFrame:SetScrollChild(childFrameBySlot)
        childFrameBySlot:Show()
        EMPLdb.byDungeonSelected = false
    end)
    mFrame.sortBySlot:SetFrameLevel(4)

    mFrame.getData = CreateFrame("Button", "EMPLMainFrameGetDataButton", mFrame, "UIPanelButtonTemplate")
    mFrame.getData:ClearAllPoints()
    mFrame.getData:SetPoint("TOPLEFT", mFrame, "TOPLEFT", 94 + 83, -5)
    mFrame.getData:SetSize(90, 18)
    mFrame.getData:SetText("Get Data")
    mFrame.getData:SetScript("OnClick", function()
        childFrameByDungeon:Hide()
        childFrameBySlot:Hide()
        EMPL.LootTables:getMPlusLoot(true)
        EMPL.MainFrame:Update()
        EMPL.GroupFinderFrame:Update()
        childFrameByDungeon:Show()
    end)
    mFrame.sortBySlot:SetFrameLevel(4)

    mFrame.ScrollFrame = CreateFrame("ScrollFrame", "EMPLMainFrameScrollFrame", mFrame, "UIPanelScrollFrameTemplate")
    mFrame.ScrollFrame:SetPoint("TOPLEFT", mFrame, "TOPLEFT", 0, -30)
    mFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", mFrame, "BOTTOMRIGHT", -5, 8)
    mFrame.ScrollFrame:SetClipsChildren(true)
    mFrame.ScrollFrame:EnableMouseWheel(true)
    mFrame.ScrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local newValue = self:GetVerticalScroll() - (delta * 30)
        if newValue < 0 then
            newValue = 0
        elseif newValue > self:GetVerticalScrollRange() then
            newValue = self:GetVerticalScrollRange()
        end
        self:SetVerticalScroll(newValue)
    end)

    mFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    mFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", mFrame.ScrollFrame, "TOPRIGHT", -20, -20)
    mFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", mFrame.ScrollFrame, "BOTTOMRIGHT", -20, 20)

    childFrameByDungeon = MainFrame:generateChildFrame(EMPLdb.lootByDungeon, true)
    childFrameBySlot = MainFrame:generateChildFrame(EMPLdb.lootBySlot, false)
    mFrame.ScrollFrame:SetScrollChild(childFrameByDungeon)
    return mFrame
end

function MainFrame:generateChildFrame(lootTable, byDungeon)
    local childFrame = CreateFrame("Frame", "EMPLMainFrameChildFrame", mFrame.ScrollFrame)
    childFrame:Hide()
    local childFrameSize = 0
    local childFrameSizeDefault = 100
    childFrame:SetSize(frameWidth - 40, childFrameSizeDefault)

    if lootTable == nil then
        local noDataString = mFrame.CreateFontString(childFrame, "overlay")
        noDataString:SetFontObject("GameFontNormalLarge")
        noDataString:SetJustifyH("LEFT")
        noDataString:SetPoint("CENTER", childFrame, "CENTER", 0, 0)
        noDataString:SetTextColor(1, 1, 1, 1)
        noDataString:SetText("No data available. Try 'Get Data' ;)")
        return childFrame
    end

    local offsetY = -12
    local offsetX = 20
    local itemOffsetX = 20
    local itemHeight = 30
    local headerHeight = 35
    for key, items in pairs(lootTable) do
        if not EMPLdb.lootIntegritySuccess then
            local dataIntegrityString = mFrame.CreateFontString(childFrame, "overlay")
            dataIntegrityString:SetFontObject("GameFontNormalLarge")
            dataIntegrityString:SetJustifyH("LEFT")
            dataIntegrityString:SetPoint("TOP", childFrame, "TOP", 5, -30)
            dataIntegrityString:SetTextColor(1, 0, 0, 1)
            dataIntegrityString:SetText("Data not fetched completely. Hit 'Get Data' again.")
            offsetY = offsetY - 60
        end

        childFrameSize = childFrameSize + headerHeight + (#items * itemHeight) + 10
        local dungeonString = mFrame.CreateFontString(childFrame, "overlay")
        dungeonString:SetFontObject("GameFontNormalLarge")
        dungeonString:SetJustifyH("LEFT")
        dungeonString:SetPoint("TOPLEFT", childFrame, "TOPLEFT", offsetX, offsetY)
        dungeonString:SetTextColor(1, 1, 1, 1)
        dungeonString:SetText(key)
        offsetY = offsetY - headerHeight

        for _, item in pairs(items) do
            local containerFrame = CreateFrame("Frame", "EMPLMainFrameContainerFrameItem" .. tostring(item.id),
                childFrame)
            local firstItemOffset = 24
            local secondItemOffset = firstItemOffset + 90
            local thirdItemOffset = secondItemOffset + 30

            local checkbox = CreateFrame("CheckButton",
                "EMPLMainFrameContainerFrameItem" .. tostring(item.id) .. "Checkbox", containerFrame,
                "UICheckButtonTemplate")
            checkbox:SetPoint("TOPLEFT", childFrame, "TOPLEFT", offsetX + itemOffsetX, offsetY)
            checkbox:SetSize(20, 20)
            checkbox:SetScript("OnClick", function(self)
                if self:GetChecked() then
                    EMPLdb.trackedLoot[item.name] = true
                else
                    EMPLdb.trackedLoot[item.name] = false
                end
                EMPL.GroupFinderFrame:Update()
                if byDungeon then
                    childFrameBySlot = MainFrame:generateChildFrame(EMPLdb.lootBySlot, false)
                else
                    childFrameByDungeon = MainFrame:generateChildFrame(EMPLdb.lootByDungeon, true)
                end
            end)
            local checked = false
            if EMPLdb.trackedLoot and EMPLdb.trackedLoot[item.name] then
                checked = EMPLdb.trackedLoot[item.name]
            end
            checkbox:SetChecked(checked)

            local itemSlot = mFrame.CreateFontString(containerFrame, "overlay")
            itemSlot:SetFontObject("GameFontNormal")
            itemSlot:SetJustifyH("LEFT")
            itemSlot:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
            itemSlot:SetPoint("TOPLEFT", childFrame, "TOPLEFT", offsetX + itemOffsetX + firstItemOffset, offsetY - 2)
            itemSlot:SetTextColor(1, 1, 1, 1)
            if byDungeon then
                itemSlot:SetText(item.slot)
            else
                itemSlot:SetText(item.dungeonShortName)
                secondItemOffset = secondItemOffset - 50
                thirdItemOffset = thirdItemOffset - 50
            end

            local icon = GetItemIcon(item.id);
            local itemIcon = CreateFrame("Frame", "EMPLIcon" .. tostring(item.id), containerFrame);
            itemIcon:SetPoint("TOPLEFT", childFrame, "TOPLEFT", offsetX + itemOffsetX + secondItemOffset, offsetY)
            itemIcon:SetSize(20, 20)
            itemIcon.texture = itemIcon:CreateTexture()
            itemIcon.texture:SetAllPoints()
            itemIcon.texture:SetTexture(icon)
            itemIcon:SetScript("OnEnter", function()
                GameTooltip:SetOwner(itemIcon, "ANCHOR_BOTTOMRIGHT", 15, 15);
                GameTooltip:SetHyperlink(item.link);
                GameTooltip:Show();
            end)
            itemIcon:SetScript("OnLeave", function()
                GameTooltip:Hide();
            end)

            local itemString = mFrame.CreateFontString(containerFrame, "overlay")
            itemString:SetFontObject("GameFontNormal")
            itemString:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
            itemString:SetJustifyH("LEFT")
            itemString:SetPoint("TOPLEFT", childFrame, "TOPLEFT", offsetX + itemOffsetX + thirdItemOffset, offsetY - 2)
            itemString:SetTextColor(1, 1, 1, 1)
            itemString:SetText(item.link)

            itemString:SetScript("OnEnter", function()
                GameTooltip:SetOwner(itemString, "ANCHOR_BOTTOMRIGHT", 15, 15);
                GameTooltip:SetHyperlink(item.link);
                GameTooltip:Show();
            end)
            itemString:SetScript("OnLeave", function()
                GameTooltip:Hide();
            end)

            offsetY = offsetY - itemHeight
        end
        offsetY = offsetY + itemHeight - headerHeight
    end
    if childFrameSize > childFrameSizeDefault then
        childFrame:SetSize(frameWidth - 40, childFrameSize)
    end
    return childFrame
end

function MainFrame:DestroyChildren() 
    childFrameByDungeon:Hide()
    childFrameByDungeon = {}

    childFrameBySlot:Hide()
    childFrameBySlot = {}
end

function MainFrame:Update()
    childFrameByDungeon = MainFrame:generateChildFrame(EMPLdb.lootByDungeon, true)
    childFrameBySlot = MainFrame:generateChildFrame(EMPLdb.lootBySlot, false)
    if mFrame:IsShown() then
        if EMPLdb.byDungeonSelected then
            mFrame.ScrollFrame:SetScrollChild(childFrameByDungeon)
            childFrameByDungeon:Show()
        else
            mFrame.ScrollFrame:SetScrollChild(childFrameBySlot)
            childFrameBySlot:Show()
        end
    end
end

function MainFrame:Toggle()
    local frame = mFrame or MainFrame:CreateFrame()
    frame:SetShown(not frame:IsShown())
    if frame:IsShown() then
        if EMPLdb.byDungeonSelected then
            mFrame.ScrollFrame:SetScrollChild(childFrameByDungeon)
            childFrameByDungeon:Show()
        else
            mFrame.ScrollFrame:SetScrollChild(childFrameBySlot)
            childFrameBySlot:Show()
        end
    else
        childFrameByDungeon:Hide()
        childFrameBySlot:Hide()

    end
end

function MainFrame:Init()
    local frame = mFrame or MainFrame:CreateFrame()
    EMPLdb.byDungeonSelected = EMPLdb.byDungeonSelected or true
end

