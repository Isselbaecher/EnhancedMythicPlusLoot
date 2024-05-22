local _, EMPL = ...
EMPL.loaded = false

SLASH_ENHANCEDMYTHICPLUSLOOT1 = "/empl"
SlashCmdList.ENHANCEDMYTHICPLUSLOOT = EMPL.MainFrame.Toggle

SLASH_FRAMESTK1 = "/fs"
SlashCmdList.FRAMESTK = function()
    LoadAddOn("Blizzard_DebugTools")
    FrameStackTooltip_Toggle()
end

SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

local enteredWorld = false
local addonLoaded = false

local function OnEvent(self, event, arg1, arg2)
    local playerSpecChanged = false
    local reloaded = false
    if (event == "PLAYER_ENTERING_WORLD") and arg1 then
        f:UnregisterEvent("PLAYER_ENTERING_WORLD")
        enteredWorld = true
    elseif (event == "PLAYER_ENTERING_WORLD") and arg2 then
        f:UnregisterEvent("PLAYER_ENTERING_WORLD")
        reloaded = true
    elseif (event == "ADDON_LOADED") and (arg1 == "EnhancedMPlusLoot") then
        f:UnregisterEvent("ADDON_LOADED")
        addonLoaded = true
    elseif (event == "PLAYER_SPECIALIZATION_CHANGED") and EMPL.loaded then
        playerSpecChanged = true
        EMPL.Config:Initialize()
        EMPL.LootTables:getMPlusLootDummy()
        EMPL.LootTables:getMPlusLoot()
        EMPL.MainFrame:Update()
        EMPL.GroupFinderFrame:Update()
    end

    if (enteredWorld and addonLoaded and not playerSpecChanged) or (reloaded and addonLoaded) then
        EMPL.loaded = true
        EMPL.Config:Initialize()
        EMPL.LootTables:getMPlusLootDummy()
        EMPL.MainFrame:Init()
        EMPL.GroupFinderFrame:Toggle()
    end
end

f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
f:SetScript("OnEvent", OnEvent)
