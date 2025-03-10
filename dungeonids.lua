local L = EnhancedMPlusLoot.L

local dfS4 = {
    {
        shortName = L["NO"],
        fullName = L["Nokhud Offensive"],
        id = 1198
    },
    {
        shortName = L["AA"],
        fullName = L["Algethar Academy"],
        id = 1201
    },
    {
        shortName = L["RLP"],
        fullName = L["Ruby Life Pools"],
        id = 1202
    },
    {
        shortName = L["AV"],
        fullName = L["Azure Vault"],
        id = 1203
    },
    {
        shortName = L["NEL"],
        fullName = L["Neltharus"],
        id = 1199
    },
    {
        shortName = L["BH"],
        fullName = L["Brackenhide Hollow"],
        id = 1196
    },
    {
        shortName = L["HOI"],
        fullName = L["Halls of Infusion"],
        id = 1204
    },
    {
        shortName = L["ULD"],
        fullName = L["Uldaman"],
        id = 1197
    }
}

local twwS1 = {
    {
        shortName = L["MOTS"],
        fullName = L["Mists of Tirna Scithe"],
        id = 1184
    },
    {
        shortName = L["NW"],
        fullName = L["Necrotic Wake"],
        id = 1182
    },
    {
        shortName = L["SOB"],
        fullName = L["Siege of Boralus"],
        id = 1023
    },
    {
        shortName = L["GB"],
        fullName = L["Grim Batol"],
        id = 71
    },
    {
        shortName = L["AK"],
        fullName = L["Ara-Kara"],
        id = 1271
    },
    {
        shortName = L["COT"],
        fullName = L["City of Threads"],
        id = 1274
    },
    {
        shortName = L["SV"],
        fullName = L["The Stonevault"],
        id = 1269
    },
    {
        shortName = L["DB"],
        fullName = L["The Dawnbreaker"],
        id = 1270
    }
}

local twwS2 = {
    {
        shortName = L["CM"],
        fullName = L["Cinderbrew Meadery"],
        id = 1272
    },
    {
        shortName = L["DC"],
        fullName = L["Darkflame Cleft"],
        id = 1210
    },
    {
        shortName = L["POF"],
        fullName = L["Priory of the sacred Flame"],
        id = 1267
    },
    {
        shortName = L["TR"],
        fullName = L["The Rookery"],
        id = 1268
    },
    {
        shortName = L["OF"],
        fullName = L["Operation: Floodgate"],
        id = 1298
    },
    {
        shortName = L["TOP"],
        fullName = L["Theater of Pain"],
        id = 1187
    },
    {
        shortName = L["OM"],
        fullName = L["Operation: Mechagon"],
        id = 1178
    },
    {
        shortName = L["TM"],
        fullName = L["The Motherlode!!"],
        id = 1012
    }
}

EnhancedMPlusLoot.seasonNames = {
    [0] = L["No season currently active"],
    [12] = L["Dragonflight Season 4"],
    [13] = L["The War Within Season 1"],
    [14] = L["The War Within Season 2"]
}

EnhancedMPlusLoot.dungeonIDs = {
    [0] = {},
    [12] = dfS4,
    [13] = twwS1,
    [14] = twwS2
}

EnhancedMPlusLoot.defaultSeasonId = 14
