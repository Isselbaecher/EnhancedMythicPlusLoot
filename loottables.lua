local L = EnhancedMPlusLoot.L

local dungeonIDs = {{
    shortName = L["NO"],
    fullName = L["Nokhud Offensive"],
    id = 1198
}, {
    shortName = L["AA"],
    fullName = L["Algethar Academy"],
    id = 1201
}, {
    shortName = L["RLP"],
    fullName = L["Ruby Life Pools"],
    id = 1202
}, {
    shortName = L["AV"],
    fullName = L["Azure Vault"],
    id = 1203
}, {
    shortName = L["NEL"],
    fullName = L["Neltharus"],
    id = 1199
}, {
    shortName = L["BH"],
    fullName = L["Brackenhide Hollow"],
    id = 1196
}, {
    shortName = L["HOI"],
    fullName = L["Halls of Infusion"],
    id = 1204
}, {
    shortName = L["ULD"],
    fullName = L["Uldaman"],
    id = 1197
}}

local statMapping = {
    ["ITEM_MOD_STAMINA_SHORT"] = "hasStamina",
    ["ITEM_MOD_STRENGTH_SHORT"] = "hasStrength",
    ["ITEM_MOD_AGILITY_SHORT"] = "hasAgility",
    ["ITEM_MOD_INTELLECT_SHORT"] = "hasIntellect",
    ["ITEM_MOD_CRIT_RATING_SHORT"] = "hasCrit",
    ["ITEM_MOD_HASTE_RATING_SHORT"] = "hasHaste",
    ["ITEM_MOD_MASTERY_RATING_SHORT"] = "hasMastery",
    ["ITEM_MOD_VERSATILITY"] = "hasVersatility"
}

function EnhancedMPlusLoot:ReloadLootTables()
    self:DeleteDungeonLootTables()
    self:InitLootTables()
end

function EnhancedMPlusLoot:DeleteDungeonLootTables()
    local specId = self.specId
    self.db.profile.loot[specId].corruptData = true
    self.db.profile.loot[specId].lootByDungeon = {}
    self.db.profile.loot[specId].lootBySlot = {}
    self.db.profile.loot[specId].allLoot = {}
    self:UpdateMainFrame()
end

function EnhancedMPlusLoot:DeleteTrackedLootTables()
    local specId = self.specId
    self.db.profile.loot[specId].trackedLoot = {}
end

function EnhancedMPlusLoot:GenerateLootTables()
    local lootByDungeon = {}
    local lootBySlot = {}
    local allLoot = {}

    local classId = self.playerClassId
    local specId = self.specId
    local mythiDifficulty = 8
    local mythicPlusLevel = self.db.profile.mythicPlusLevel

    EJ_ClearSearch()
    C_EncounterJournal.ResetSlotFilter()
    EJ_ResetLootFilter()
    EJ_SetLootFilter(classId, specId)
    EJ_SetDifficulty(mythiDifficulty)
    C_EncounterJournal.SetPreviewMythicPlusLevel(mythicPlusLevel)

    local corruptData = false

    for _, dungeon in pairs(dungeonIDs) do
        lootByDungeon[dungeon.id] = {}

        EJ_SelectInstance(dungeon.id)
        local numLoot = EJ_GetNumLoot()

        for i = 1, numLoot do
            local currentLoot = C_EncounterJournal.GetLootInfoByIndex(i)
            local lootStats = C_Item.GetItemStats("item:" .. tostring(currentLoot.itemID))
            if currentLoot.name ~= nil and currentLoot.slot ~= nil and currentLoot.slot ~= '' then
                local loot = {
                    name = currentLoot.name,
                    link = currentLoot.link,
                    slot = currentLoot.slot,
                    icon = currentLoot.icon,
                    hasStamina = false,
                    hasStrength = false,
                    hasAgility = false,
                    hasIntellect = false,
                    hasCrit = false,
                    hasHaste = false,
                    hasMastery = false,
                    hasVersatility = false,
                    dungeonName = dungeon.fullName,
                    dungeonShortName = dungeon.shortName
                }

                for varname, statname in pairs(statMapping) do
                    if lootStats[varname] then
                        loot[statname] = true
                    end
                end

                lootBySlot[currentLoot.slot] = lootBySlot[currentLoot.slot] or {}
                lootBySlot[currentLoot.slot][currentLoot.itemID] = loot
                lootByDungeon[dungeon.id][currentLoot.itemID] = loot
                allLoot[currentLoot.itemID] = loot
            else
                corruptData = true
            end
        end
    end

    if not corruptData then
        self.db.profile.loot[specId].lootByDungeon = lootByDungeon
        self.db.profile.loot[specId].lootBySlot = lootBySlot
        self.db.profile.loot[specId].allLoot = allLoot
    end

    self.db.profile.loot[specId].corruptData = corruptData
end

function EnhancedMPlusLoot:TryGenerateLootTablesNTimes(delay, maxTries, currentTry)
    local specId = self.specId
    currentTry = currentTry or 1
    self:GenerateLootTables()

    if not self.db.profile.loot[specId].corruptData then
        self:Print(L["Fetch loot - "] .. L["success"])
        self:UpdateMainFrame()
        return
    elseif currentTry == 1 then
        delay = 1
        self:Print(L["Fetch loot - "] .. L["start"])
    else
        delay = delay + 5
        self:Print(L["Fetch loot - "] .. L["waiting for another "] .. delay .. L[" seconds"])
    end

    if currentTry <= maxTries then
        self:ScheduleTimer("TryGenerateLootTablesNTimes", delay, delay, maxTries, currentTry + 1)
    else
        self:Print(L["Fetch loot - "] .. L["failed"])
    end
end

function EnhancedMPlusLoot:InitLootTables()
    self.playerClassId = select(3, UnitClass("player"))

    self.specNum = GetSpecialization()
    local specNum = self.specNum

    self.specId = GetSpecializationInfo(specNum)
    local specId = self.specId

    self.db.profile.loot[specId] = self.db.profile.loot[specId] or {}
    self.db.profile.loot[specId].corruptData = self.db.profile.loot[specId].corruptData or true
    self.db.profile.loot[specId].trackedLoot = self.db.profile.loot[specId].trackedLoot or {}

    if self.db.profile.loot[specId].corruptData then
        self:CancelAllTimers()
        self:TryGenerateLootTablesNTimes(1, specId, 10)
    end
end