local L = LibStub("AceLocale-3.0"):NewLocale("EnhancedMPlusLoot", "enUS", true, true)
if not L then
    return
end

-- Slash Commands
L["Usage"] = true
L["command"] = true
L["toggle loot tracker"] = true
L["open settings"] = true
L["refresh loot tables"] = true
L["clear loot tables"] = true
L["clear tracked loot table"] = true

-- Config
L["Loot tracker window"] = true
L["Enable the loot tracker window."] = true
L["Tracked loot popup"] = true
L["Enable the tracked loot popup."] = true
L["Mythic+ Level"] = true
L["Set the Mythic+ level to use for loot tables."] = true
L["Main Display"] = true
L["Item Font"] = true
L["Set the font for the item name."] = true
L["Item Font Flags"] = true
L["Set the font flags for the item name."] = true
L["Item Font Size"] = true
L["Set the font size for the item name."] = true
L["Short Dungeon Names"] = true
L["Use short dungeon names."] = true
L["Dungeon Font"] = true
L["Set the font for the dungeon name."] = true
L["Dungeon Font Flags"] = true
L["Set the font flags for the dungeon name."] = true
L["Dungeon Font Size"] = true
L["Set the font size for the dungeon name."] = true
L["Loot Tracker"] = true
L["Display Icons"] = true
L["Display item icons in the loot tracker."] = true
L["Display Item Names"] = true
L["Display item names in the loot tracker."] = true
L["Items"] = true
L["Dungeons"] = true
L["Set the font size for the divider text (dungeon/slot)."] = true
L["Set the font for the divider text (dungeon/slot)."] = true
L["Set the font flags for the divider text (dungeon/slot)."] = true
L["Divider"] = true
L["Divider Font"] = true
L["Divider Font Flags"] = true
L["Divider Font Size"] = true
L["Hide minimap icon"] = true
L["Hides the minimap icon."] = true
L["Reset tracked loot"] = true
L["Reload dungeon loot"] = true
L["Reloads the dungeon loot tables from the adventure journal"] = true

-- Generating loot tables
L["Fetch loot - "] = true
L["success"] = true
L["failed"] = true
L["incomplete"] = true
L["start"] = true
L["waiting for another "] = true
L[" seconds"] = true

-- Frames
L["Filter"] = true
L["Stamina"] = true
L["Strength"] = true
L["Agility"] = true
L["Intellect"] = true
L["Crit"] = true
L["Haste"] = true
L["Mast"] = true
L["Versatility"] = true
L["Other"] = true

L["Track"] = true

L["Loot by Dungeon"] = true
L["Loot by Slot"] = true


-- Minimap
L["Left-click"] = true
L["Right-click"] = true
L["to toggle the main frame"] = true
L["to toggle the options menu"] = true

-- Chat
L["Whisper"] = true
L["Groupchat"] = true
L["Old M+ SeasonId"] = true
L["New M+ SeasonId"] = true
L["Do you need "] = true
L["?"] = true

------------------------------------------
L["No season currently active"] = true
L["Loot is currently being fetched and may be inaccurate"] = true
L["season is not yet active - loot may be incorrect"] = true
L["loot may be inaccurate"] = true
L["Loot is currently being fetched"] = true


------------------------------------------
--- TWW S1
------------------------------------------
L["The War Within Season 1"] = true

-- Dungeons
L["Mists of Tirna Scithe"] = true
L["Necrotic Wake"] = true
L["Siege of Boralus"] = true
L["Grim Batol"] = true
L["Ara-Kara"] = true
L["City of Threads"] = true
L["The Stonevault"] = true
L["The Dawnbreaker"] = true

-- Dungeon Short
L["MOTS"] = "MISTS"
L["NW"] = true
L["SOB"] = "SIEGE"
L["GB"] = true
L["AK"] = "ARAK"
L["COT"] = true
L["SV"] = true
L["DB"] = "DAWN"

------------------------------------------
--- TWW S2
------------------------------------------
L["The War Within Season 2"] = true

-- Dungeons
L["Cinderbrew Meadery"] = true
L["Darkflame Cleft"] = true
L["Priory of the sacred Flame"] = true
L["The Rookery"] = true
L["Operation: Floodgate"] = true
L["Theater of Pain"] = true
L["Operation: Mechagon"] = true
L["The Motherlode!!"] = true

-- Dungeon Short
L["CM"] = true
L["DC"] = true
L["POF"] = true
L["TR"] = true
L["OF"] = true
L["TOP"] = true
L["OM"] = true
L["TM"] = true
