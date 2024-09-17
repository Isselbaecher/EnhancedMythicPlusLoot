local AceGUI = LibStub("AceGUI-3.0")
local L = EnhancedMPlusLoot.L

function EnhancedMPlusLoot:RegisterLootNotificationEvent()
    self:RegisterEvent("ENCOUNTER_LOOT_RECEIVED", "ShowLootNotificationFrameHook")
end

local numLootNotifications = 0
function EnhancedMPlusLoot:CreateNotificationFrame(item, link, player, class)
    local frameWidth = 600
    local playerLabelWidth = 200
    local itemWidth = frameWidth - playerLabelWidth - 50

    local itemFont = self.db.profile.lootTrackerItemFont
    local itemFontPath = self.getFontPath(itemFont)
    local itemFontFlags = self.db.profile.lootTrackerItemFontFlags
    local itemFontSize = self.db.profile.lootTrackerItemFontSize

    -- Loot Frame
    local frame = AceGUI:Create("Window")
    local dialogbg = frame.frame:CreateTexture(nil, "BACKGROUND")
    dialogbg:SetTexture(137056)
    dialogbg:SetPoint("TOPLEFT", 8, -24)
    dialogbg:SetPoint("BOTTOMRIGHT", -6, 8)
    dialogbg:SetVertexColor(0, 0, 0, .5)
    frame:SetTitle("Enhanced Mythic Plus Loot")
    frame.closebutton:SetPoint("TOPRIGHT", -2, -3)
    frame:SetPoint("CENTER", 0, 220 - 1 * (numLootNotifications * 110))
    frame:EnableResize(false)
    frame:SetLayout("Flow")
    frame:SetWidth(frameWidth)
    frame:SetHeight(110)
    frame:SetCallback("OnClose", function(widget)
        numLootNotifications = numLootNotifications - 1
        widget:Release()
    end)

    local itemFrame = AceGUI:Create("SimpleGroup")
    itemFrame:SetLayout("Flow")
    itemFrame:SetFullWidth(true)
    itemFrame:SetAutoAdjustHeight(true)
    frame:AddChild(itemFrame)

    -- Player
    local playerLabel = AceGUI:Create("Label")
    playerLabel:SetText(player)
    local classColor = C_ClassColor.GetClassColor(class)
    playerLabel:SetColor(classColor.r, classColor.g, classColor.b)
    playerLabel:SetWidth(playerLabelWidth)
    playerLabel:SetFont(itemFontPath, itemFontSize, itemFontFlags)
    itemFrame:AddChild(playerLabel)

    -- Item icon and text
    local itemLabel = AceGUI:Create("InteractiveLabel")
    itemLabel:SetText(link)
    itemLabel:SetCallback("OnEnter", function(widget, event, value)
        GameTooltip:SetOwner(widget.frame, "ANCHOR_LEFT", 0, 0)
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
    end)
    itemLabel:SetCallback("OnLeave", function(widget, event, value)
        GameTooltip:Hide()
    end)
    itemLabel:SetCallback("OnClick", function(widget, event, value)
        if IsModifiedClick("CHATLINK") then
            ChatEdit_InsertLink(link)
        end
    end)
    itemLabel:SetImage(item.icon)
    itemLabel:SetImageSize(18, 18)
    itemLabel:SetWidth(itemWidth)
    itemLabel:SetFont(itemFontPath, itemFontSize, itemFontFlags)
    itemFrame:AddChild(itemLabel)

    local buttonGroup = AceGUI:Create("SimpleGroup")
    buttonGroup:SetLayout("Flow")
    buttonGroup:SetFullWidth(true)
    buttonGroup:SetAutoAdjustHeight(true)
    frame:AddChild(buttonGroup)

    -- Buttons
    local whisper = AceGUI:Create("Button")
    whisper:SetText(L["Whisper"])
    whisper:SetRelativeWidth(0.5)
    whisper.player = player
    whisper.link = link
    whisper:SetCallback("OnClick", function(self)
        SendChatMessage(L["Do you need "] .. self.link .. L["?"], "WHISPER", nil, self.player)
    end)
    buttonGroup:AddChild(whisper)

    local groupchat = AceGUI:Create("Button")
    groupchat:SetText(L["Groupchat"])
    groupchat:SetRelativeWidth(0.5)
    groupchat:SetCallback("OnClick", function(self)
        groupchat.link = link
        SendChatMessage(L["Do you need "] .. self.link .. L["?"], "PARTY")
    end)
    buttonGroup:AddChild(groupchat)

    numLootNotifications = numLootNotifications + 1
end

function EnhancedMPlusLoot:ShowLootNotificationFrameHook(...)
    local _, _, itemId, link, _, player, class = ...
    local ownName = GetUnitName("player", true)

    if player == ownName then
        return
    end

    local trackedLootPopupEnabled = self.db.profile.trackedLootPopupEnabled
    local trackedLoot = self.db.profile.loot[self.specId].trackedLoot or {}
    local item = trackedLoot[itemId] or nil
    if trackedLootPopupEnabled and item ~= nil then
        self:CreateNotificationFrame(item, link, player, class)
    end
end
