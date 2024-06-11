---@class EnhancedMPlusLoot: AceAddon, AceConsole-3.0, AceEvent-3.0, AceGUI-3.0, AceTimer-3.0, AceHook-3.0
EnhancedMPlusLoot = LibStub("AceAddon-3.0"):NewAddon("EnhancedMPlusLoot", "AceConsole-3.0", "AceEvent-3.0",
    "AceTimer-3.0", "AceHook-3.0")
EnhancedMPlusLoot.L = LibStub("AceLocale-3.0"):GetLocale("EnhancedMPlusLoot")
local L = EnhancedMPlusLoot.L

function EnhancedMPlusLoot:InitMinimapIcon()
    local icon = LibStub("LibDBIcon-1.0")
    local MINIMAP_TOOLTIP_BT_LEFT = "|cff33ff99" .. L["Left-click"] .. "|r |cffffffff" .. L["to toggle the main frame"] .. "|r"
	local MINIMAP_TOOLTIP_BT_RIGHT = "|cff33ff99" .. L["Right-click"] .. "|r |cffffffff" .. L["to toggle the options menu"] .. "|r"

    local EnhancedMPlusLootLDB = LibStub("LibDataBroker-1.1"):NewDataObject("EnhancedMPlusLoot", {
        type = "data source",
        text = "EnhancedMPlusLoot",
        icon = "Interface\\Addons\\EnhancedMPlusLoot\\images\\EMPL",
        OnClick = function(_, button)
            if button == "LeftButton" then
                self:ToggleMainFrame()
            elseif button == "RightButton" then
                self:ToggleMenu()
            end
        end,
        OnTooltipShow = function(tooltip)
			if not tooltip or not tooltip.AddLine then return end
			tooltip:AddLine("EnhancedMPlusLoot")
			tooltip:AddLine(MINIMAP_TOOLTIP_BT_LEFT)
			tooltip:AddLine(MINIMAP_TOOLTIP_BT_RIGHT)
		end,
    })
    icon:Register("EnhancedMPlusLoot", EnhancedMPlusLootLDB, self.db.profile.minimap)
end

function EnhancedMPlusLoot:OnInitialize()
    self:InitSlashCommands()
    self:InitDb()
	self:InitMinimapIcon()
end

function EnhancedMPlusLoot:OnEnable()
    self:InitOptions()
    self:InitLootTables()
    self:HookLootFrame()
	self:RegisterLootNotificationEvent()
    self:RegisterSpecChangeEvent()
end

function EnhancedMPlusLoot:OnDisable()
    self:UnhookAll()
end

