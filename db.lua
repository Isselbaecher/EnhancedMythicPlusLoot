local defaults = {
    profile = {
        dataVersion = 1,
        currentSeasonId = -2,

        -- General Settings
        trackedLootPopupEnabled = true,
        lootTrackerWindowEnabled = true,
        mythicPlusLevel = 5,

        -- Main Display
        mainDisplayItemFont = "Friz Quadrata TT",
        mainDisplayItemFontFlags = "OUTLINE",
        mainDisplayItemFontSize = 13,

        mainDisplayDividerFont = "Friz Quadrata TT",
        mainDisplayDividerFontFlags = "OUTLINE",
        mainDisplayDividerFontSize = 12,

        mainFrameStatus = {},

        -- Loot Tracker
        lootTrackerDislpayIcons = true,

        lootTrackerItemFont = "Friz Quadrata TT",
        lootTrackerItemFontFlags = "OUTLINE",
        lootTrackerItemFontSize = 13,

        lootTrackerDungeonFont = "Friz Quadrata TT",
        lootTrackerDungeonFontFlags = "OUTLINE",
        lootTrackerDungeonFontSize = 12,

        -- Save size and position
        mainDisplayWidth = nil,
        mainDisplayHeight = nil,
        mainDisplayTop = nil,
        mainDisplayLeft = nil,

        lootDisplayTop = nil,
        lootDisplayLeft = nil,

        minimap = {
            hide = false,
        },

        -- Loot
        loot = {}
        --[[ Structure of item table
            specid = {
                corruptData = true,
                lootByDungeon = {
                    dungeonId = {
                        itemId = {
                            name = "",
                            link = "",
                            slot = "",
                            icon = "",
                            dungeonName = "",
                            dungeonShortName = "",
                        }
                    }
                },
                lootBySlot = {
                    slot = {
                        itemId = {
                            name = "",
                            link = "",
                            slot = "",
                            icon = "",
                            dungeonName = "",
                            dungeonShortName = "",
                        }
                    }
                },
                allLoot = {
                    itemId = {
                        name = "",
                        link = "",
                        slot = "",
                        icon = "",
                        dungeonName = "",
                        dungeonShortName = "",
                    }
                },
                trackedLoot = {
                    itemId = {
                        name = "",
                        link = "",
                        slot = "",
                        icon = "",
                        dungeonName = "",
                        dungeonShortName = "",
                    }
                }
            }
        --]]
    }
}

function EnhancedMPlusLoot:InitDb()
    self.db = LibStub("AceDB-3.0"):New("EnhancedMPlusLootDB", defaults, true)
    if self.db.profile.dataVersion ~= 1 then
        self.db:ResetDB()
    end
end
