local AceGUI = LibStub("AceGUI-3.0")
local L = EnhancedMPlusLoot.L

EnhancedMPlusLoot.lootFrame = nil
EnhancedMPlusLoot.showLootFrame = false

function EnhancedMPlusLoot:HookLootFrame()
    self:HookScript(PVEFrame, "OnShow", "ShowLootFrameHook")
    self:HookScript(PVEFrame, "OnHide", "HideLootFrameHook")
end

function EnhancedMPlusLoot:CreateLootFrame()
    local frameWidth = 390
    local dungeonWidth = 40
    local itemWidth = frameWidth - dungeonWidth - 30

    -- Loot frame
    local frame = AceGUI:Create("Window")
    frame:SetTitle("Enhanced Mythic Plus Loot")
    frame.closebutton:SetPoint("TOPRIGHT", -2, -3)
    frame:SetPoint("TOPLEFT", PVEFrame, "RIGHT", -5, -100)
    frame:EnableResize(false)
    frame:SetLayout("Flow")
    frame:SetAutoAdjustHeight(true)
    frame.frame:SetFrameStrata("LOW")
    frame:SetCallback("OnClose", function(widget)
        widget:Release()
        EnhancedMPlusLoot.lootFrame = nil
    end)
    -- Fix visibility
    local dialogbg = frame.frame:CreateTexture(nil, "BACKGROUND")
    dialogbg:SetTexture(137056)
    dialogbg:SetPoint("TOPLEFT", 8, -24)
    dialogbg:SetPoint("BOTTOMRIGHT", -6, 8)
    dialogbg:SetVertexColor(0, 0, 0, .3)

    -- List container
    local lootList = AceGUI:Create("SimpleGroup")
    lootList:SetFullWidth(true)
    lootList:SetAutoAdjustHeight(true)
    lootList:SetLayout("Flow")
    lootList.frame:SetFrameStrata("LOW")
    frame:AddChild(lootList)

    -- Content
    local specId = self.specId
    local lootById = self.db.profile.loot[specId].trackedLoot

    local itemFont = self.db.profile.lootTrackerItemFont
    local itemFontPath = self.getFontPath(itemFont)
    local itemFontFlags = self.db.profile.lootTrackerItemFontFlags
    local itemFontSize = self.db.profile.lootTrackerItemFontSize

    local dungeonFont = self.db.profile.lootTrackerDungeonFont
    local dungeonFontPath = self.getFontPath(dungeonFont)
    local dungeonFontFlags = self.db.profile.lootTrackerDungeonFontFlags
    local dungeonFontSize = self.db.profile.lootTrackerDungeonFontSize
    local lootTrackerDislpayIcons = self.db.profile.lootTrackerDislpayIcons

    local items = {}
    for id, tracked in pairs(lootById) do
        local item = lootById[id]
        if item ~= nil then
            items[#items + 1] = item
        end
    end

    table.sort(items, function(a, b)
        return a.dungeonShortName < b.dungeonShortName
    end)

    for _, item in pairs(items) do
        local itemFrame = AceGUI:Create("SimpleGroup")
        itemFrame:SetLayout("Flow")
        itemFrame:SetFullWidth(true)
        itemFrame:SetAutoAdjustHeight(true)
        lootList:AddChild(itemFrame)

        -- Dungeon
        local dungeonName = AceGUI:Create("Label")
        dungeonName:SetText(item.dungeonShortName)
        dungeonName:SetWidth(dungeonWidth)
        dungeonName:SetFont(dungeonFontPath, dungeonFontSize, dungeonFontFlags)
        itemFrame:AddChild(dungeonName)

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
        itemLabel:SetWidth(itemWidth)
        itemLabel:SetFont(itemFontPath, itemFontSize, itemFontFlags)
        if lootTrackerDislpayIcons then
            itemLabel:SetImage(item.icon)
            itemLabel:SetImageSize(18, 18)
        end

        itemFrame:AddChild(itemLabel)
    end

    -- Fix automatic height
    local contentHeight = lootList.frame:GetHeight()
    local status = {
        height = contentHeight + 57,
        width = frameWidth
    }
    frame:SetStatusTable(status)

    return frame
end

function EnhancedMPlusLoot:ShowLootFrame()
    local showLootFrame = self.showLootFrame
    if not showLootFrame then
        return
    end
    local lootFrameEnabled = self.db.profile.lootTrackerWindowEnabled
    if not lootFrameEnabled then
        return
    end
    local trackedLoot = self.db.profile.loot[self.specId].trackedLoot
    for items in pairs(trackedLoot) do
        if not self.lootFrame then
            self.lootFrame = self:CreateLootFrame()
            return
        end
    end
end

function EnhancedMPlusLoot:HideLootFrame()
    local lootFrame = self.lootFrame
    if lootFrame then
        lootFrame:Release()
        self.lootFrame = nil
    end
end

function EnhancedMPlusLoot:ShowLootFrameHook()
    local lootFrameEnabled = self.db.profile.lootTrackerWindowEnabled
    if not lootFrameEnabled then
        return
    end
    self.showLootFrame = true
    self:ShowLootFrame()
end

function EnhancedMPlusLoot:HideLootFrameHook()
    self.showLootFrame = false
    self:HideLootFrame()
end
