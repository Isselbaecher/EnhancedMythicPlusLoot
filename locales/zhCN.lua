local L = LibStub("AceLocale-3.0"):NewLocale("EnhancedMPlusLoot", "zhCN", false, true)
if not L then
    return
end

-- Big thanks to Mr7eiz for the translation
-- 斜杠命令
L["Usage"] = "帮助"
L["command"] = "设置"
L["toggle loot tracker"] = "已换战利品追踪器"
L["open settings"] = "打开设置"
L["refresh loot tables"] = "刷新战利品表格"
L["clear loot tables"] = "清除战利品表格"
L["clear tracked loot table"] = "清除已追踪的战利品"

-- 配置
L["Loot tracker window"] = "战利品追踪器窗口"
L["Enable the loot tracker window."] = "启用战利品追踪器窗口"
L["Tracked loot popup"] = "已追踪战利品弹出"
L["Enable the tracked loot popup."] = "启用已追踪战利品弹出"
L["Mythic+ Level"] = "M+ 等级"
L["Set the Mythic+ level to use for loot tables."] = "设置用于战利品表格的M+ 等级"
L["Main Display"] = "主显示"
L["Items"] = "物品"
L["Item Font"] = "设置物品字体"
L["Set the font for the item name."] = "字体描边"
L["Item Font Flags"] = "字体描边"
L["Set the font flags for the item name."] = "字体描边"
L["Item Font Size"] = "物品字体大小"
L["Set the font size for the item name."] = "设置物品名称的字体大小"
L["Short Dungeon Names"] = "简短地下城名称"
L["Use short dungeon names."] = "使用简短地下城名称"
L["Dungeon Font"] = "地下城字体"
L["Set the font for the dungeon name."] = "设置地下城名称的字体"
L["Dungeon Font Flags"] = "字体描边"
L["Set the font flags for the dungeon name."] = "字体描边"
L["Dungeon Font Size"] = "地下城字体大小"
L["Set the font size for the dungeon name."] = "设置地下城名称的字体大小"
L["Loot Tracker"] = "已追踪战利品"
L["Display Icons"] = "显示图标"
L["Display item icons in the loot tracker."] = "在战利品追踪器中显示物品图标"
L["Display Item Names"] = "显示物品名称"
L["Display item names in the loot tracker."] = "在战利品追踪器中显示物品名称"
L["Dungeons"] = "地下城"
L["Set the font size for the divider text (dungeon/slot)."] = "设置分隔符文本（地下城/部位）的字体大小"
L["Set the font for the divider text (dungeon/slot)."] = "设置分隔符文本（地下城/部位）的字体"
L["Set the font flags for the divider text (dungeon/slot)."] = "设置分隔符文本（地下城/部位）的字体描边"
L["Divider"] = "分隔符"
L["Divider Font"] = "分隔符字体"
L["Divider Font Flags"] = "字体描边"
L["Divider Font Size"] = "分隔符字体大小"
L["Hide minimap icon"] = "隐藏小地图图标"
L["Hides the minimap icon."] = "隐藏小地图图标"
L["Reset tracked loot"] = "重置已追踪物品"
L["Reload dungeon loot"] = "重置地下城掉落"
L["Reloads the dungeon loot tables from the adventure journal"] = "重新加载地下城掉落列表"

-- 生成战利品表格
L["Fetch loot - "] = "获取战利品 - "
L["success"] = "成功"
L["failed"] = "失败"
L["incomplete"] = "不完整"
L["start"] = "开始"
L["waiting for another "] = "等待 "
L[" seconds"] = " 秒"

-- 框架
L["Filter"] = "过滤器"
L["Stamina"] = "耐力"
L["Strength"] = "力量"
L["Agility"] = "敏捷"
L["Intellect"] = "智力"
L["Crit"] = "爆击"
L["Haste"] = "急速"
L["Mastery"] = "精通"
L["Versatility"] = "全能"

L["Track"] = "追踪"

L["Loot by Dungeon"] = "按地下城分类"
L["Loot by Slot"] = "按部位分类"

-- 小地图
L["Left-click"] = "左键点击"
L["Right-click"] = "右键点击"
L["to toggle the main frame"] = "已切换主框架"
L["to toggle the options menu"] = "已切换选项菜单"

-- 聊天
L["Whisper"] = "密语"
L["Groupchat"] = "团队聊天"
L["Old M+ SeasonId"] = "旧版M+ 赛季ID"
L["New M+ SeasonId"] = "新版M+ 赛季ID"
L["Do you need "] = "请问"
L["?"] = "您要吗？能否交易给我？"

L["No season currently active"] = "当前没有活跃的赛季"
L["Loot is currently being fetched and may be inaccurate"] = "当前正在获取战利品，可能不准确"
L["season is not yet active - loot may be incorrect"] = "赛季尚未激活 - 战利品可能不正确"
L["loot may be inaccurate"]="战利品可能不准确"
L["Loot is currently being fetched"]="正在获取战利品"


--- TWW S1
L["The War Within Season 1"] = "地心之战第一赛季"

-- 地下城
L["Mists of Tirna Scithe"] = "塞兹仙林的迷雾"
L["Necrotic Wake"] = "通灵战潮"
L["Siege of Boralus"] = "围攻伯拉勒斯"
L["Grim Batol"] = "格瑞姆巴托"
L["Ara-Kara"] = "艾拉-卡拉，回响之城"
L["City of Threads"] = "千丝之城"
L["The Stonevault"] = "矶石宝库"
L["The Dawnbreaker"] = "破晨号"

-- 地下城简称
L["MOTS"] = "迷雾"
L["NW"] = "通灵"
L["SOB"] = "围攻"
L["GB"] = "格瑞"
L["AK"] = "艾拉"
L["COT"] = "千丝"
L["SV"] = "矶石"
L["DB"] = "破晨号"

--- TWW S2
L["The War Within Season 2"] = "地心之战第二赛季"

-- Dungeons
L["Cinderbrew Meadery"] = "燧酿酒庄"
L["Darkflame Cleft"] = "暗焰裂口"
L["Priory of the sacred Flame"] = "圣焰隐修院"
L["The Rookery"] = "驭雷栖巢"
L["Operation: Floodgate"] = "水闸行动"
L["Theater of Pain"] = "伤逝剧场"
L["Operation: Mechagon"] = "麦卡贡行动"
L["The Motherlode!!"] = "暴富矿区！！"

-- Dungeon Short
L["CM"] = "酒庄"
L["DC"] = "裂口"
L["POF"] = "隐修院"
L["TR"] = "驭雷"
L["OF"] = "水闸"
L["TOP"] = "剧场"
L["OM"] = "麦卡贡"
L["TM"] = "暴富"
