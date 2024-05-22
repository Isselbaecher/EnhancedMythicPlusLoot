local _, EMPL = ...
EMPL.GroupFinderFrame = {}
local GroupFinderFrame = EMPL.GroupFinderFrame
local gFrame
local displayedItems = 0

function GroupFinderFrame:CreateFrame()
    local frameWidth = 350
    local frameHeight = 100
    if EMPL.loaded == false then
        return
    end
    gFrame = CreateFrame("Frame", "MythicPlusLoot", PVEFrame, "ChatBubbleTemplate")
    gFrame:SetSize(frameWidth, frameHeight)
    gFrame:SetPoint("TOPLEFT", LFDParentFrame, "RIGHT", 0, -100)
    gFrame:EnableMouse(true)
    gFrame:SetClampedToScreen(true)
    gFrame:SetFrameStrata("DIALOG")

    local offsetY = -20
    local offsetX = 10
    local itemOffsetX = 10
    local itemHeight = 24
    local headerHeight = 30
    local items = {}

    for name, tracked in pairs(EMPLdb.trackedLoot) do
        local item = EMPLdb.loot[name]
        if tracked then
            items[#items + 1] = item
        end
    end
    table.sort(items, function(a, b)
        return a.dungeonShortName < b.dungeonShortName
    end)
    displayedItems = #items
    gFrame:SetSize(frameWidth, #items * itemHeight + 35)

    for name, item in pairs(items) do
        local containerFrame = CreateFrame("Frame", UIParent, gFrame)
        local firstItemOffset = 0
        local secondItemOffset = firstItemOffset + 35
        local thirdItemOffset = secondItemOffset + 25

        local itemDungeon = gFrame.CreateFontString(containerFrame, "overlay")
        itemDungeon:SetFontObject("GameFontNormal")
        itemDungeon:SetJustifyH("LEFT")
        itemDungeon:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
        itemDungeon:SetPoint("TOPLEFT", gFrame, "TOPLEFT", offsetX + itemOffsetX + firstItemOffset, offsetY-1)
        itemDungeon:SetTextColor(1, 1, 1, 1)
        itemDungeon:SetText(item.dungeonShortName)

        local icon = GetItemIcon(item.id)
        local itemIcon = CreateFrame("Frame", "Icon", containerFrame)
        itemIcon:SetPoint("TOPLEFT", gFrame, "TOPLEFT", offsetX + itemOffsetX + secondItemOffset, offsetY)
        itemIcon:SetSize(18, 18)
        itemIcon.texture = itemIcon:CreateTexture()
        itemIcon.texture:SetAllPoints()
        itemIcon.texture:SetTexture(icon)
        itemIcon:SetScript("OnEnter", function()
            GameTooltip:SetOwner(itemIcon, "ANCHOR_BOTTOMRIGHT", 15, 15)
            GameTooltip:SetHyperlink(item.link)
            GameTooltip:Show()
        end)
        itemIcon:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        local itemString = gFrame.CreateFontString(containerFrame, "overlay")
        itemString:SetFontObject("GameFontNormal")
        itemString:SetJustifyH("LEFT")
        itemString:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
        itemString:SetPoint("TOPLEFT", gFrame, "TOPLEFT", offsetX + itemOffsetX + thirdItemOffset, offsetY-1)
        itemString:SetTextColor(1, 1, 1, 1)
        itemString:SetText(item.link)

        itemString:SetScript("OnEnter", function()
            GameTooltip:SetOwner(itemString, "ANCHOR_BOTTOMRIGHT", 15, 15)
            GameTooltip:SetHyperlink(item.link)
            GameTooltip:Show()
        end)
        itemString:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        offsetY = offsetY - itemHeight
    end
    gFrame:Hide()
    return gFrame
end

function GroupFinderFrame:Update()
    gFrame:Hide()
    gFrame = {}
    local frame = GroupFinderFrame:CreateFrame()
    GroupFinderFrame:Toggle()
end

function GroupFinderFrame:Toggle()
    local frame = gFrame or GroupFinderFrame:CreateFrame()
    local show = false
    if displayedItems > 0 and EMPLdb.showGroupFinderFrame then
        show = true
    end
    if show then
        frame:Show()
    else
        frame:Hide()
    end
end
