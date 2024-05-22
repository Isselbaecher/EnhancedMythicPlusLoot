local _, EMPL = ...
EMPL.LootTables = {}
local LootTables = EMPL.LootTables

EMPL.dungeonIDs = {{
    shortName = "NO",
    fullName = "Nokhud Offensive",
    id = 1198
}, {
    shortName = "AA",
    fullName = "Algethar Academy",
    id = 1201
}, {
    shortName = "RLP",
    fullName = "Ruby Life Pools",
    id = 1202
}, {
    shortName = "AV",
    fullName = "Azure Vault",
    id = 1203
}, {
    shortName = "NEL",
    fullName = "Neltharus",
    id = 1199
}, {
    shortName = "BH",
    fullName = "Brackenhide Hollow",
    id = 1196
}, {
    shortName = "HOI",
    fullName = "Halls of Infusion",
    id = 1204
}, {
    shortName = "ULD",
    fullName = "Uldaman",
    id = 1197
}}

function LootTables:getMPlusLoot(reload)
    local force = reload or false
    if EMPLdb.loadedOnce and not force and EMPLdb.lootIntegritySuccess then
        return
    end
    local itemsByDungeon = {}
    local itemsBySlot = {}
    local items = {}
    local _, _, playerClass = UnitClass("player")
    local tmpSpec = GetSpecialization()
    local playerSpecialization, _, _, _, _, _, _ = GetSpecializationInfo(tmpSpec)
    local maxwait = 100000

    EJ_ClearSearch()
    C_EncounterJournal.ResetSlotFilter()
    EJ_ResetLootFilter()

    EJ_SetLootFilter(playerClass, playerSpecialization)
    EJ_SetDifficulty(8)
    C_EncounterJournal.SetPreviewMythicPlusLevel(EMPLdb.mythicPlusLevel)
    EMPLdb.lootIntegritySuccess = true
    for _, dungeon in pairs(EMPL.dungeonIDs) do
        itemsByDungeon[dungeon.fullName] = {}
        EJ_SelectInstance(dungeon.id)
        local numItems = EJ_GetNumLoot()
        local successfulItems = 0
        for i = 1, numItems do
            local currentItem = C_EncounterJournal.GetLootInfoByIndex(i)
            local wait = 0
            while currentItem.name == nil or currentItem.slot == nil do
                wait = wait + 1
                if wait > maxwait then
                    currentItem = C_EncounterJournal.GetLootInfoByIndex(i)
                    break
                end
            end
            if currentItem.name ~= nil and currentItem.slot ~= nil and currentItem.slot ~= '' then
                local item = {
                    dungeonShortName = dungeon.shortName,
                    dungeonFullname = dungeon.fullName,
                    name = currentItem.name,
                    icon = currentItem.icon,
                    link = currentItem.link,
                    slot = currentItem.slot:gsub("Held In ", ""),
                    id = currentItem.itemID
                }
                itemsByDungeon[dungeon.fullName][#itemsByDungeon[dungeon.fullName] + 1] = item
                if itemsBySlot[item.slot] == nil then
                    itemsBySlot[item.slot] = {}
                end
                itemsBySlot[item.slot][#itemsBySlot[item.slot] + 1] = item
                items[item.name] = item
                successfulItems = successfulItems + 1
            else
                EMPLdb.lootIntegritySuccess = false
            end
        end
        if successfulItems < numItems then
            EMPLdb.lootIntegritySuccess = false
        end
    end
    EMPLdb.lootByDungeon = itemsByDungeon
    EMPLdb.lootBySlot = itemsBySlot
    EMPLdb.loot = items
    EMPLdb.loadedOnce = true
end

function LootTables:getMPlusLootDummy()
    local _, _, playerClass = UnitClass("player")
    local tmpSpec = GetSpecialization()
    local playerSpecialization, _, _, _, _, _, _ = GetSpecializationInfo(tmpSpec)
    local maxwait = 100000

    EJ_ClearSearch()
    C_EncounterJournal.ResetSlotFilter()
    EJ_ResetLootFilter()

    EJ_SetLootFilter(playerClass, playerSpecialization)
    EJ_SetDifficulty(8)
    C_EncounterJournal.SetPreviewMythicPlusLevel(EMPLdb.mythicPlusLevel)
    for _, dungeon in pairs(EMPL.dungeonIDs) do
        EJ_SelectInstance(dungeon.id)
        local numItems = EJ_GetNumLoot()
        for i = 1, numItems do
            local currentItem = C_EncounterJournal.GetLootInfoByIndex(i)
            local wait = 0
            while currentItem.name == nil or currentItem.slot == nil do
                wait = wait + 1
                if wait > maxwait then
                    currentItem = C_EncounterJournal.GetLootInfoByIndex(i)
                    break
                end
            end
        end
    end
end

function LootTables:Reset()
    EMPLdb.trackedLoot = {}
    EMPLdb.lootIntegritySuccess = false
    EMPLdb.loadedOnce = false
    EMPLdb.lootByDungeon = nil
    EMPLdb.lootBySlot = nil
    EMPLdb.loot = nil
end

function LootTables:Init() 
    LootTables:getMPlusLootDummy()
    EMPLdb.lootByDungeon = EMPLdb.lootByDungeon or {}
    EMPLdb.lootBySlot = EMPLdb.lootBySlot or {}
    EMPLdb.loot = EMPLdb.loot or {}
    EMPLdb.loadedOnce = true
end