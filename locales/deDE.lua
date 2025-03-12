local L = LibStub("AceLocale-3.0"):NewLocale("EnhancedMPlusLoot", "deDE", false, true)
if not L then
    return
end

-- Slash Commands
L["Usage"] = "Hilfe"
L["command"] = "Befehl"
L["toggle loot tracker"] = "Lootmerker ein-/ausschalten"
L["open settings"] = "Einstellungen öffnen"
L["refresh loot tables"] = "Loot Tabellen aktualisieren"
L["clear loot tables"] = "Loot Tabellen löschen"
L["clear tracked loot table"] = "Gemerkten Loot löschen"

-- Config
L["Loot tracker window"] = "Lootmerker Fenster"
L["Enable the loot tracker window."] = "Lootmerker Fenster aktivieren"
L["Tracked loot popup"] = "Gemerkter Loot Popup"
L["Enable the tracked loot popup."] = "Gemerkter Loot Popup aktivieren"
L["Mythic+ Level"] = "Mythic+ Stufe"
L["Set the Mythic+ level to use for loot tables."] = "Setze die Mythic+ Stufe für die Loot Tabellen."
L["Main Display"] = "Hauptanzeige"
L["Item Font"] = "Item Schriftart"
L["Set the font for the item name."] = "Setze die Schriftart für die Item Namen."
L["Item Font Flags"] = "Item Schriftart Flags"
L["Set the font flags for the item name."] = "Setze die Schriftart Flags für die Item Namen."
L["Item Font Size"] = "Item Schriftgröße"
L["Set the font size for the item name."] = "Setze die Schriftgröße für die Item Namen."
L["Short Dungeon Names"] = "Kurze Dungeon Namen"
L["Use short dungeon names."] = "Benutze kurze Dungeon Namen."
L["Dungeon Font"] = "Dungeon Schriftart"
L["Set the font for the dungeon name."] = "Setze die Schriftart für die Dungeon Namen."
L["Dungeon Font Flags"] = "Dungeon Schriftart Flags"
L["Set the font flags for the dungeon name."] = "Setze die Schriftart Flags für die Dungeon Namen."
L["Dungeon Font Size"] = "Dungeon Schriftgröße"
L["Set the font size for the dungeon name."] = "Setze die Schriftgröße für die Dungeon Namen."
L["Loot Tracker"] = "Gemerkter Loot"
L["Display Icons"] = "Icons anzeigen"
L["Display item icons in the loot tracker."] = "Zeige Item Icons im Lootmerker."
L["Display Item Names"] = "Item Namen anzeigen"
L["Display item names in the loot tracker."] = "Zeige Item Namen im Lootmerker."
L["Items"] = true
L["Dungeons"] = true
L["Set the font size for the divider text (dungeon/slot)."] = "Setze die Schriftgröße für den Trennertext (Dungeon/Slot)."
L["Set the font for the divider text (dungeon/slot)."] = "Setze die Schriftart für den Trennertext (Dungeon/Slot)."
L["Set the font flags for the divider text (dungeon/slot)."] = "Setze die Schriftart Flags für den Trennertext (Dungeon/Slot)."

-- Generating loot tables
L["Fetch loot - "] = "Loot holen - "
L["success"] = "erfolgreich"
L["failed"] = "fehlgeschlagen"
L["incomplete"] = "unvollstaendig"
L["start"] = "starte"
L["waiting for another "] = "warte weitere "
L[" seconds"] = " Sekunden"

-- Frames
L["Filter"] = "Filter"
L["Stamina"] = "Ausdauer"
L["Strength"] = "Stärke"
L["Agility"] = "Beweglichkeit"
L["Intellect"] = "Intelligenz"
L["Crit"] = "Kritisch"
L["Haste"] = "Tempo"
L["Mast"] = "Meisterschaft"
L["Versatility"] = "Vielseitigkeit"

L["Track"] = "Merken"

L["Loot by Dungeon"] = "Loot nach Dungeon"
L["Loot by Slot"] = "Loot nach Slot"


-- Minimap
L["Left-click"] = "Links-klick"
L["Right-click"] = "Rechts-klick"
L["to toggle the main frame"] = "um das Hauptfenster zu öffnen"
L["to toggle the options menu"] = "um das Optionenmenü zu öffnen"

-- Chat
L["Whisper"] = "Flüstern"
L["Groupchat"] = "Gruppenchat"
L["Old M+ SeasonId"] = "Alte M+ SeasonId"
L["New M+ SeasonId"] = "Neue M+ SeasonId"

------------------------------------------
L["No season currently active"] = "Momentan ist keine Season aktiv"
L["Loot is currently being fetched and may be inaccurate"] = "Loot wird momentan geladen und kann ungenau sein"
L["season is not yet active - loot may be incorrect"] = "Keine Season aktiv - loot kann ungenau sein"


------------------------------------------
--- TWW S1
------------------------------------------
L["The War Within Season 1"] = true

-- Dungeons
L["Mists of Tirna Scithe"] = "Die Nebel von Tirna Scithe"
L["Necrotic Wake"] = "Die Nekrotische Schneise"
L["Siege of Boralus"] = "Die Belagerung von Boralus"
L["Grim Batol"] = true
L["Ara-Kara"] = true
L["City of Threads"] = "Stadt der Fäden"
L["The Stonevault"] = "Der Steinbruch"
L["The Dawnbreaker"] = "Der Morgenbringer"

-- Dungeon Short
L["MOTS"] = "NVTS"
L["NW"] = "NS"
L["SOB"] = "BVB"
L["GB"] = true
L["AK"] = true
L["COT"] = "SDF"
L["SV"] = "SB"
L["DB"] = "MB"

------------------------------------------
--- TWW S2
------------------------------------------
L["The War Within Season 2"] = true

-- Dungeons
L["Cinderbrew Meadery"] = "Metbrauerei Glutbräu"
L["Darkflame Cleft"] = "Dunkelflammenspalt"
L["Priory of the sacred Flame"] = "Priorat der Heiligen Flamme"
L["The Rookery"] = "Die Brutstätte"
L["Operation: Floodgate"] = "Operation: Schleuse"
L["Theater of Pain"] = "Theater der Schmerzen"
L["Operation: Mechagon"] = true
L["The MOTHERLODE!!"] = "Das RIESENFLÖZ!!"

-- Dungeon Short
L["CM"] = "MG"
L["DC"] = "DF"
L["POF"] = "PDHF"
L["TR"] = "DB"
L["OF"] = true
L["TOP"] = "TDS"
L["OM"] = true
L["TM"] = true
