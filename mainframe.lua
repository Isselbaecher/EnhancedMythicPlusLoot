local AceGUI = LibStub("AceGUI-3.0")
local L = EnhancedMPlusLoot.L

local filterLootBy = {
    stamina = false,
    strength = false,
    agility = false,
    intellect = false,
    crit = false,
    haste = false,
    mastery = false,
    versatility = false
}

function EnhancedMPlusLoot:applyFilters()
    local lootContainerRows = EnhancedMPlusLoot.lootContainerRows
    EnhancedMPlusLoot.scroll:SetScroll(0)
    EnhancedMPlusLoot.scroll:DoLayout()
    for _, row in pairs(lootContainerRows) do
        if not row.isHeader then
            local item = row.item
            if filterLootBy.stamina and not item.hasStamina then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.strength and not item.hasStrength then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.agility and not item.hasAgility then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.intellect and not item.hasIntellect then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.crit and not item.hasCrit then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.haste and not item.hasHaste then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.mastery and not item.hasMastery then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            elseif filterLootBy.versatility and not item.hasVersatility then
                row.frame:Hide()
                row:SetHeight(1)
                row:SetAutoAdjustHeight(true)
            else
                row.frame:Show()
                row:SetAutoAdjustHeight(true)
            end
        end
    end
end

function EnhancedMPlusLoot:CreateFilterContainer()
    local filter = AceGUI:Create("SimpleGroup")
    local checkboxwidth = 90
    local buttonMargin = 20
    local filterGroupWidth = 0.70
    local byGroupWidth = 1 - filterGroupWidth

    filter:SetLayout("Flow")
    filter:SetFullWidth(true)

    local filterGroup = AceGUI:Create("SimpleGroup")
    filterGroup:SetRelativeWidth(filterGroupWidth)
    filter:AddChild(filterGroup)

    local byGroup = AceGUI:Create("SimpleGroup")
    byGroup:SetRelativeWidth(byGroupWidth)
    filter:AddChild(byGroup)

    local divider = AceGUI:Create("Heading")
    divider:SetFullWidth(true)
    filter:AddChild(divider)

    local mainstats = AceGUI:Create("SimpleGroup")
    mainstats:SetFullWidth(true)
    mainstats:SetLayout("Flow")
    filterGroup:AddChild(mainstats)

    local secondstats = AceGUI:Create("SimpleGroup")
    secondstats:SetFullWidth(true)
    secondstats:SetLayout("Flow")
    filterGroup:AddChild(secondstats)

    -- Filter buttons
    -- Stam
    local stamFilter = AceGUI:Create("CheckBox")
    stamFilter:SetLabel(L["Stamina"])
    stamFilter:SetWidth(checkboxwidth)
    stamFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.stamina = value
        EnhancedMPlusLoot:applyFilters()
    end)
    mainstats:AddChild(stamFilter)

    -- Str
    local strFilter = AceGUI:Create("CheckBox")
    strFilter:SetLabel(L["Strength"])
    strFilter:SetWidth(checkboxwidth)
    strFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.strength = value
        EnhancedMPlusLoot:applyFilters()
    end)
    mainstats:AddChild(strFilter)

    -- Agi
    local agiFilter = AceGUI:Create("CheckBox")
    agiFilter:SetLabel(L["Agility"])
    agiFilter:SetWidth(checkboxwidth)
    agiFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.agility = value
        EnhancedMPlusLoot:applyFilters()
    end)
    mainstats:AddChild(agiFilter)

    -- Int
    local intFilter = AceGUI:Create("CheckBox")
    intFilter:SetLabel(L["Intellect"])
    intFilter:SetWidth(checkboxwidth + buttonMargin)
    intFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.intellect = value
        EnhancedMPlusLoot:applyFilters()
    end)
    mainstats:AddChild(intFilter)

    -- Crit
    local critFilter = AceGUI:Create("CheckBox")
    critFilter:SetLabel(L["Crit"])
    critFilter:SetWidth(checkboxwidth)
    critFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.crit = value
        EnhancedMPlusLoot:applyFilters()
    end)
    secondstats:AddChild(critFilter)

    -- Haste
    local hasteFilter = AceGUI:Create("CheckBox")
    hasteFilter:SetLabel(L["Haste"])
    hasteFilter:SetWidth(checkboxwidth)
    hasteFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.haste = value
        EnhancedMPlusLoot:applyFilters()
    end)
    secondstats:AddChild(hasteFilter)

    -- Mastery
    local masteryFilter = AceGUI:Create("CheckBox")
    masteryFilter:SetLabel(L["Mastery"])
    masteryFilter:SetWidth(checkboxwidth)
    masteryFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.mastery = value
        EnhancedMPlusLoot:applyFilters()
    end)
    secondstats:AddChild(masteryFilter)

    -- Versa
    local versaFilter = AceGUI:Create("CheckBox")
    versaFilter:SetLabel(L["Versatility"])
    versaFilter:SetWidth(checkboxwidth + buttonMargin)
    versaFilter:SetCallback("OnValueChanged", function(_, _, value)
        filterLootBy.versatility = value
        EnhancedMPlusLoot:applyFilters()
    end)
    secondstats:AddChild(versaFilter)

    local buttonGroup = AceGUI:Create("SimpleGroup")
    buttonGroup:SetFullWidth(true)
    buttonGroup:SetLayout("Flow")
    byGroup:AddChild(buttonGroup)

    -- Buttons
    local lootByDungeonButton = AceGUI:Create("Button")
    lootByDungeonButton:SetText(L["Loot by Dungeon"])
    lootByDungeonButton:SetWidth(150)
    lootByDungeonButton:SetCallback("OnClick", function()
        EnhancedMPlusLoot.scroll:ReleaseChildren()
        EnhancedMPlusLoot.lootContainer = {}
        EnhancedMPlusLoot.lootContainer = EnhancedMPlusLoot:CreateLootContainer(true)
        local lootContainer = EnhancedMPlusLoot.lootContainer
        EnhancedMPlusLoot.scroll:AddChild(lootContainer)
        EnhancedMPlusLoot:applyFilters()
    end)
    buttonGroup:AddChild(lootByDungeonButton)

    local lootBySlotButton = AceGUI:Create("Button")
    lootBySlotButton:SetText(L["Loot by Slot"])
    lootBySlotButton:SetWidth(150)
    lootBySlotButton:SetCallback("OnClick", function()
        EnhancedMPlusLoot.scroll:ReleaseChildren()
        EnhancedMPlusLoot.lootContainer = {}
        EnhancedMPlusLoot.lootContainer = EnhancedMPlusLoot:CreateLootContainer(false)
        local lootContainer = EnhancedMPlusLoot.lootContainer
        EnhancedMPlusLoot.scroll:AddChild(lootContainer)
        EnhancedMPlusLoot:applyFilters()
    end)
    buttonGroup:AddChild(lootBySlotButton)

    return filter
end

EnhancedMPlusLoot.lootContainerRows = {}
function EnhancedMPlusLoot:CreateLootContainer(byDungeon)
    local dividerFont = self.db.profile.mainDisplayDividerFont
    local dividerFontPath = self:getFontPath(dividerFont)
    local dividerFontFlags = self.db.profile.mainDisplayDividerFontFlags
    local dividerFontSize = self.db.profile.mainDisplayDividerFontSize

    local itemFont = self.db.profile.mainDisplayItemFont
    local itemFontPath = self:getFontPath(itemFont)
    local itemFontFlags = self.db.profile.mainDisplayItemFontFlags
    local itemFontSize = self.db.profile.mainDisplayItemFontSize

    local isByDungeon = true
    if byDungeon == nil then
        isByDungeon = true
    else
        isByDungeon = byDungeon
    end
    local specId = self.specId

    local lootContainer = AceGUI:Create("SimpleGroup")
    lootContainer:SetLayout("List")
    lootContainer:SetFullWidth(true)
    lootContainer:SetFullHeight(true)

    local loot = {}
    if isByDungeon then
        loot = self.db.profile.loot[specId].lootByDungeon
    else
        loot = self.db.profile.loot[specId].lootBySlot
    end
    local i = 1
    for _, loot in pairs(loot) do
        local headerSet = false

        for itemId, item in pairs(loot) do

            -- HEADER ROW
            if not headerSet then
                local row = AceGUI:Create("SimpleGroup")
                self.lootContainerRows[i] = row
                row:SetFullWidth(true)
                row:SetLayout("Flow")
                lootContainer:AddChild(row)

                local header = AceGUI:Create("Heading")
                if isByDungeon then
                    header:SetText(item.dungeonName)
                else
                    header:SetText(item.slot)
                end
                header:SetFullWidth(true)
                header.label:SetFont(dividerFontPath, dividerFontSize, dividerFontFlags)
                self.lootContainerRows[i]:AddChild(header)
                self.lootContainerRows[i].isHeader = true

                i = i + 1
                headerSet = true
            end

            -- DATA ROW
            local row = AceGUI:Create("SimpleGroup")
            self.lootContainerRows[i] = row
            row:SetFullWidth(true)
            row:SetLayout("Flow")
            lootContainer:AddChild(row)

            self.lootContainerRows[i].isHeader = false
            self.lootContainerRows[i].item = item

            -- Track checkbox
            local itemCheckbox = AceGUI:Create("CheckBox")
            itemCheckbox:SetLabel("")
            itemCheckbox:SetWidth(40)
            itemCheckbox:SetCallback("OnEnter", function(widget, event, value)
                GameTooltip:SetOwner(widget.frame, "ANCHOR_LEFT", 0, 0)
                GameTooltip:SetText(L["Track"])
                GameTooltip:Show()
            end)
            itemCheckbox:SetCallback("OnLeave", function(widget, event, value)
                GameTooltip:Hide()
            end)
            itemCheckbox:SetCallback("OnValueChanged", function(widget, event, value)
                if value then
                    self.db.profile.loot[specId].trackedLoot[itemId] = item
                else
                    self.db.profile.loot[specId].trackedLoot[itemId] = nil
                end

                self:HideLootFrame()
                self:ShowLootFrame()
            end)

            itemCheckbox:SetValue(false)
            local trackedLoot = self.db.profile.loot[specId].trackedLoot
            if trackedLoot and trackedLoot[itemId] then
                itemCheckbox:SetValue(true)
            end
            self.lootContainerRows[i]:AddChild(itemCheckbox)

            -- Dungeon or slot
            local dungeonOrSlot = AceGUI:Create("Label")
            if isByDungeon then
                dungeonOrSlot:SetText(item.slot)
                dungeonOrSlot:SetWidth(100)
            else
                dungeonOrSlot:SetText(item.dungeonShortName)
                dungeonOrSlot:SetWidth(50)
            end
            dungeonOrSlot:SetFont(itemFontPath, itemFontSize, itemFontFlags)
            self.lootContainerRows[i]:AddChild(dungeonOrSlot)

            -- Item icon and text
            local itemLabel = AceGUI:Create("InteractiveLabel")
            itemLabel:SetText(item.link)
            itemLabel:SetCallback("OnEnter", function(widget, event, value)
                GameTooltip:SetOwner(widget.frame, "ANCHOR_LEFT", 0, 0)
                GameTooltip:SetHyperlink(item.link)
                GameTooltip:Show()
            end)
            itemLabel:SetCallback("OnLeave", function(widget, event, value)
                GameTooltip:Hide()
            end)
            itemLabel:SetCallback("OnClick", function(widget, event, value)
                if IsModifiedClick("CHATLINK") then
                    ChatEdit_InsertLink(item.link)
                end
            end)
            itemLabel:SetWidth(300)
            itemLabel:SetFont(itemFontPath, itemFontSize, itemFontFlags)
            itemLabel:SetImage(item.icon)
            itemLabel:SetImageSize(18, 18)
            self.lootContainerRows[i]:AddChild(itemLabel)

            i = i + 1
        end
    end

    return lootContainer
end

function EnhancedMPlusLoot:UpdateMainFrame()
    if not self.mainFrame then
        return
    end
    self.mainFrame:Release()
    self.mainFrame = nil
    self:ToggleMainFrame()
end

EnhancedMPlusLoot.lootContainer = nil
EnhancedMPlusLoot.scroll = nil
EnhancedMPlusLoot.mainFrame = nil
function EnhancedMPlusLoot:ToggleMainFrame()
    if self.mainFrame then
        self.mainFrame:Release()
        self.mainFrame = nil
        return
    end
    -------------------------------------------------------------------------
    -- Main Frame
    -------------------------------------------------------------------------
    self.mainFrame = AceGUI:Create("Window")
    local frame = self.mainFrame
    local status = self.db.profile.mainFrameStatus
    frame:SetStatusTable(status)

    frame:SetTitle("Enhanced Mythic Plus Loot")
    frame:SetCallback("OnClose", function(widget)
        local status = self.db.profile.mainFrameStatus
        status.width = widget.frame:GetWidth()
        status.height = widget.frame:GetHeight()
        AceGUI:Release(widget)
        EnhancedMPlusLoot.mainFrame = nil
    end)
    frame:SetLayout("Flow")

    -- Fix close button position
    frame.closebutton:SetPoint("TOPRIGHT", -2, -3)
    -- frame:SetHeight(600)

    -- Make ESC work
    _G["EnhancedMPlusLootMainFrame"] = frame.frame
    tinsert(UISpecialFrames, "EnhancedMPlusLootMainFrame")

    -- Fix visibility
    local dialogbg = frame.frame:CreateTexture(nil, "BACKGROUND")
    dialogbg:SetTexture(137056)
    dialogbg:SetPoint("TOPLEFT", 8, -24)
    dialogbg:SetPoint("BOTTOMRIGHT", -6, 8)
    dialogbg:SetVertexColor(0, 0, 0, .3)

    -------------------------------------------------------------------------
    -- Filter container
    -------------------------------------------------------------------------
    local filter = self:CreateFilterContainer()
    frame:AddChild(filter)

    local scrollcontainer = AceGUI:Create("SimpleGroup")
    scrollcontainer:SetFullWidth(true)
    scrollcontainer:SetFullHeight(true)
    scrollcontainer:SetLayout("Fill")
    frame:AddChild(scrollcontainer)

    self.scroll = AceGUI:Create("ScrollFrame")
    local scroll = EnhancedMPlusLoot.scroll
    scroll:SetLayout("Flow")
    scrollcontainer:AddChild(scroll)

    self.lootContainer = self:CreateLootContainer(true)
    local lootContainer = self.lootContainer
    scroll:AddChild(lootContainer)
end
