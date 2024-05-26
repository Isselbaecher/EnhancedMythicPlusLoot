---@class EnhancedMPlusLoot: AceAddon, AceConsole-3.0, AceEvent-3.0, AceGUI-3.0, AceTimer-3.0, AceHook-3.0
EnhancedMPlusLoot = LibStub("AceAddon-3.0"):NewAddon("EnhancedMPlusLoot", "AceConsole-3.0", "AceEvent-3.0",
    "AceTimer-3.0", "AceHook-3.0")
EnhancedMPlusLoot.L = LibStub("AceLocale-3.0"):GetLocale("EnhancedMPlusLoot")

function EnhancedMPlusLoot:InitMinimapIcon()
    local icon = LibStub("LibDBIcon-1.0")
    local EnhancedMPlusLootLDB = LibStub("LibDataBroker-1.1"):NewDataObject("EnhancedMPlusLoot", {
        type = "data source",
        text = "EnhancedMPlusLoot",
        icon = "Interface\\Addons\\EnhancedMPlusLoot\\images\\EMPL",
        OnClick = function()
			self:OpenMainFrame()
        end
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
	self:RegisterLootNotification()
end

function EnhancedMPlusLoot:OnDisable()
    self:UnhookAll()
end

