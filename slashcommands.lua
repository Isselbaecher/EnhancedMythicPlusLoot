local L = EnhancedMPlusLoot.L

function EnhancedMPlusLoot:RunSlashCommand(command)
    command = command:lower()

    if command == "cleartracked" then
        self:DeleteTrackedLootTables()
    elseif command == "getloot" then
        self:ReloadLootTables()
    elseif command == "config" then
        self:ToggleMenu()
    elseif command == "" then
        self:ToggleMainFrame()
    else
        local helpmessage = L["Usage"] .. ": /epml [" .. L["command"] .. "]\n"
        helpmessage= helpmessage .. "config - " .. L["open settings"] .. "\n"
        helpmessage= helpmessage .. "getloot - " .. L["refresh loot tables"] .. "\n"
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
