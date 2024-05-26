local L = EnhancedMPlusLoot.L

function EnhancedMPlusLoot:RunSlashCommand(command)
    command = command:lower()

    if command == "clearloot" then
        self:ClearLootTables()
    elseif command == "cleartracked" then
        self:ClearTrackedLoot()
    elseif command == "getloot" then
        self:TryGenerateLootTablesNTimes(1, 5)
    elseif command == "config" then
        self:OpenMenu()
    elseif command == "" then
        self:OpenMainFrame()
    else
        local helpmessage = "Usage: /epml [" .. L["command"] .. "]\n"
        --helpmessage= helpmessage .. "tracker - " .. L["toggle loot tracker"] .. "\n"
        helpmessage= helpmessage .. "config - " .. L["open settings"] .. "\n"
        helpmessage= helpmessage .. "getloot - " .. L["refresh loot tables"] .. "\n"
        helpmessage= helpmessage .. "clearloot - " .. L["clear loot tables"] .. "\n"
        helpmessage= helpmessage .. "cleartracked - " .. L["clear tracked loot table"] .. "\n"
        self:Print(helpmessage)
    end
end

function EnhancedMPlusLoot:InitSlashCommands()
    self:RegisterChatCommand("empl", "RunSlashCommand")
    self:RegisterChatCommand("e", "RunSlashCommand")
    self:RegisterChatCommand("enhancedmplusloot", "RunSlashCommand")
    self:RegisterChatCommand("enhancedmythicplusloot", "RunSlashCommand")
end
