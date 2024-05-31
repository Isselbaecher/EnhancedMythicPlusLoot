local L = EnhancedMPlusLoot.L
local fontFlags = {
    [""] = L["None"],
    ["OUTLINE"] = L["Outline"],
    ["THICKOUTLINE"] = L["Thick Outline"],
    ["nil, MONOCHROME"] = L["Monochrome"],
    ["OUTLINE , MONOCHROME"] = L["Monochrome Outline"],
    ["THICKOUTLINE , MONOCHROME"] = L["Monochrome Thick Outline"]
}

local menu = {
    name = "EnhancedMPlusLoot",
    handler = EnhancedMPlusLoot,
    type = "group",
    get = function(i)
        return EnhancedMPlusLoot.db.profile[i[#i]]
    end,
    set = function(i, val)
        EnhancedMPlusLoot.db.profile[i[#i]] = val
    end,
    childGroups = "tab",
    args = {
        lootTrackerWindowEnabled = {
            name = L["Loot tracker window"],
            desc = L["Enable the loot tracker window."],
            type = "toggle",
            order = 1,
        },
        trackedLootPopupEnabled = {
            name = L["Tracked loot popup"],
            desc = L["Enable the tracked loot popup."],
            type = "toggle",
            order = 2,
        },
        mythicPlusLevel = {
            name = L["Mythic+ Level"],
            desc = L["Set the Mythic+ level to use for loot tables."],
            type = "range",
            min = 1,
            max = 10,
            step = 1,
            order = 3,
            width = "full"
        },
        mainDisplay = {
            name = L["Main Display"],
            type = "group",
            order = 4,
            childGroups = "tree",
            args = {
                items = {
                    type = "group",
                    name = L["Items"],
                    order = 1,
                    args = {
                        mainDisplayItemFontSize = {
                            name = L["Item Font Size"],
                            desc = L["Set the font size for the item name."],
                            type = "range",
                            min = 8,
                            max = 24,
                            step = 1,
                            order = 3,
                            width = "full"
                        },
                        mainDisplayItemFont = {
                            name = L["Item Font"],
                            desc = L["Set the font for the item name."],
                            type = "select",
                            dialogControl = "LSM30_Font",
                            values = AceGUIWidgetLSMlists.font,
                            order = 1
                        },
                        mainDisplayItemFontFlags = {
                            name = L["Item Font Flags"],
                            desc = L["Set the font flags for the item name."],
                            type = "select",
                            values = fontFlags,
                            order = 2
                        }
                    }
                },
                divider = {
                    type = "group",
                    name = L["Divider"],
                    order = 2,
                    args = {
                        mainDisplayDividerFontSize = {
                            name = L["Divider Font Size"],
                            desc = L["Set the font size for the divider text (dungeon/slot)."],
                            type = "range",
                            min = 8,
                            max = 24,
                            step = 1,
                            order = 6,
                            width = "full"
                        },
                        mainDisplayDividerFont = {
                            name = L["Divider Font"],
                            desc = L["Set the font for the divider text (dungeon/slot)."],
                            type = "select",
                            dialogControl = "LSM30_Font",
                            values = AceGUIWidgetLSMlists.font,
                            order = 4
                        },
                        mainDisplayDividerFontFlags = {
                            name = L["Divider Font Flags"],
                            desc = L["Set the font flags for the divider text (dungeon/slot)."],
                            type = "select",
                            values = fontFlags,
                            order = 5
                        }
                    }
                }
            }
        },
        lootTracker = {
            name = L["Loot Tracker"],
            type = "group",
            order = 5,
            childGroups = "tree",
            args = {
                items = {
                    type = "group",
                    name = L["Items"],
                    order = 2,
                    args = {
                        lootTrackerDislpayIcons = {
                            name = L["Display Icons"],
                            desc = L["Display item icons in the loot tracker."],
                            width = "full",
                            type = "toggle",
                            order = 1
                        },
                        lootTrackerItemFont = {
                            name = L["Item Font"],
                            desc = L["Set the font for the item name."],
                            type = "select",
                            dialogControl = "LSM30_Font",
                            values = AceGUIWidgetLSMlists.font,
                            order = 4
                        },
                        lootTrackerItemFontFlags = {
                            name = L["Item Font Flags"],
                            desc = L["Set the font flags for the item name."],
                            type = "select",
                            values = fontFlags,
                            order = 4
                        },
                        lootTrackerItemFontSize = {
                            name = L["Item Font Size"],
                            desc = L["Set the font size for the item name."],
                            type = "range",
                            min = 8,
                            max = 24,
                            step = 1,
                            width = "full",
                            order = 5
                        }
                    }
                },
                dungeons = {
                    type = "group",
                    name = L["Dungeons"],
                    order = 3,
                    args = {
                        lootTrackerDungeonFont = {
                            name = L["Dungeon Font"],
                            desc = L["Set the font for the dungeon name."],
                            type = "select",
                            dialogControl = "LSM30_Font",
                            values = AceGUIWidgetLSMlists.font,
                            order = 6
                        },
                        lootTrackerDungeonFontFlags = {
                            name = L["Dungeon Font Flags"],
                            desc = L["Set the font flags for the dungeon name."],
                            type = "select",
                            values = fontFlags,
                            order = 7
                        },
                        lootTrackerDungeonFontSize = {
                            name = L["Dungeon Font Size"],
                            desc = L["Set the font size for the dungeon name."],
                            type = "range",
                            width = "full",
                            min = 8,
                            max = 24,
                            step = 1,
                            order = 8
                        }
                    }
                }
            }
        },
        resetTrackedLootTables = {
            name = L["Reset tracked loot"],
            desc = L["Reset tracked loot"],
            confirm = true,
            type = "execute",
            func = function()
                EnhancedMPlusLoot:DeleteTrackedLootTables()
            end,
            order = 4,
        },
        reloadLootTables = {
            name = L["Reload dungeon loot"],
            desc = L["Reloads the dungeon loot tables from the adventure journal"],
            confirm = true,
            type = "execute",
            order = 4,
            func = function()
                EnhancedMPlusLoot:ReloadLootTables()
            end
        },
    }
}

function EnhancedMPlusLoot:InitOptions()
    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("EnhancedMPlusLoot", menu)
    self.menu = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("EnhancedMPlusLoot", "EnhancedMPlusLoot")
end

function EnhancedMPlusLoot:OpenMenu()
    InterfaceOptionsFrame_OpenToCategory(self.menu)
    InterfaceOptionsFrame_OpenToCategory(self.menu)
end
