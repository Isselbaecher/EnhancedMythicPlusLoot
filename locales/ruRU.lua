local L = LibStub("AceLocale-3.0"):NewLocale("EnhancedMPlusLoot", "ruRU", false, true)
if not L then
    return
end

-- Slash Commands
L["Usage"] = "Использование"
L["command"] = "команда"
L["toggle loot tracker"] = "включить/выключить отслеживание добычи"
L["open settings"] = "открыть настройки"
L["refresh loot tables"] = "обновить таблицы добычи"
L["clear loot tables"] = "очистить таблицы добычи"
L["clear tracked loot table"] = "очистить таблицу отслеживаемой добычи"

-- Config
L["Loot tracker window"] = "Окно отслеживания добычи"
L["Enable the loot tracker window."] = "Включить окно отслеживания добычи."
L["Tracked loot popup"] = "Всплывающее окно с отслеживаемой добычей"
L["Enable the tracked loot popup."] = "Включить всплывающее окно отслеживаемой добычи."
L["Mythic+ Level"] = "Уровень М+"
L["Set the Mythic+ level to use for loot tables."] = "Установить уровень М+ для использования в таблицах добычи."
L["Main Display"] = "Главный экран"
L["Items"] = "Предметы"
L["Item Font"] = "Шрифт предмета"
L["Set the font for the item name."] = "Установить шрифт для названия предмета."
L["Item Font Flags"] = "Контур шрифтов предметов"
L["Set the font flags for the item name."] = "Установить контур шрифта для названия предмета."
L["Item Font Size"] = "Размер шрифта предмета"
L["Set the font size for the item name."] = "Установить размер шрифта для названия предмета."
L["Short Dungeon Names"] = "Короткие названия подземелий"
L["Use short dungeon names."] = "Использовать короткие названия подземелий."
L["Dungeon Font"] = "Шрифт подземелья"
L["Set the font for the dungeon name."] = "Установить шрифт для названия подземелья."
L["Dungeon Font Flags"] = "Контур шрифтов подземелий"
L["Set the font flags for the dungeon name."] = "Установить контур шрифта для названия подземелья."
L["Dungeon Font Size"] = "Размер шрифта подземелья"
L["Set the font size for the dungeon name."] = "Установить размер шрифта для названия подземелья."
L["Loot Tracker"] = "Отслеживание добычи"
L["Display Icons"] = "Отображение иконок"
L["Display item icons in the loot tracker."] = "Отображать иконки предметов в отслеживании добычи."
L["Display Item Names"] = "Отображение названий элементов"
L["Display item names in the loot tracker."] = "Отображать название предметов в отслеживании добычи."
L["Dungeons"] = "Подземелья"
L["Set the font size for the divider text (dungeon/slot)."] = "Установить размер шрифта для текста разделителя (подземелье/слот)."
L["Set the font for the divider text (dungeon/slot)."] = "Установить шрифт для текста разделителя (подземелье/слот)."
L["Set the font flags for the divider text (dungeon/slot)."] = "Установить контур шрифта для текста разделителя (подземелье/слот)"
L["Divider"] = "Разделитель"
L["Divider Font"] = "Шрифт разделителя"
L["Divider Font Flags"] = "Контур шрифта разделителя"
L["Divider Font Size"] = "Размер шрифта разделителя"
L["Reset tracked loot"] = "Сбросить отслеживаемую добычу"
L["Reload dungeon loot"] = "Перезагрузить добычу подземелья"
L["Reloads the dungeon loot tables from the adventure journal"] = "Перезагружает таблицы добычи подземелий из журнала приключений."

-- Generating loot tables
L["Fetch loot - "] = "Получить добычу - "
L["success"] = "успешно"
L["failed"] = "неудачно"
L["incomplete"] = "неполный"
L["start"] = "начало"
L["waiting for another "] = "ждем еще "
L[" seconds"] = " секунды"

-- Frames
L["Filter"] = "Фильтр"
L["Stamina"] = "Выносливость"
L["Strength"] = "Сила"
L["Agility"] = "Ловкость"
L["Intellect"] = "Интеллект"
L["Crit"] = "Крит. удар"
L["Haste"] = "Скорость"
L["Mastery"] = "Искусность"
L["Versatility"] = "Универсальность"
L["Other"] = "Другое"

L["Track"] = "Отслеживать"

L["Loot by Dungeon"] = "Добыча из подземелья"
L["Loot by Slot"] = "Добыча по слоту"

-- Minimap
L["Left-click"] = "ЛКМ"
L["Right-click"] = "ПКМ"
L["to toggle the main frame"] = "- открыть окно аддона"
L["to toggle the options menu"] = "- открыть настройки"
L["Hide minimap icon"] = "Скрыть иконку на миникарте"
L["Hides the minimap icon."] = "Скрывает иконку миникарты."

-- Chat
L["Whisper"] = "Шепот"
L["Groupchat"] = "Чат группы"
L["Old M+ SeasonID: "] = "Старые сезонные идентификаторы М+: "
L["New M+ SeasonID: "] = "Новые сезонные идентификаторы М+: "
L["Do you need "] = "Вам это нужно "
L["?"] = "?"

------------------------------------------
L["No season currently active"] = "В настоящее время нет активного сезона"
L["Loot is currently being fetched and may be inaccurate"] = "В настоящее время добыча находится в процессе сбора и может быть неточной"
L["season is not yet active - loot may be incorrect"] = "сезон еще не активен - добыча может быть некорректной"
L["loot may be inaccurate"] = "добыча может быть неточной"
L["Loot is currently being fetched"] = "В настоящее время добыча забирается"

------------------------------------------
L["None"] = "Нет"
L["Outline"] = "Контур"
L["Thick Outline"] = "Толстый контур"
L["Monochrome"] = "Монохромный"
L["Monochrome Outline"] = "Монохромный контур"
L["Monochrome Thick Outline"] = "Монохромный толстый контур"

------------------------------------------
--- TWW S1
------------------------------------------
L["The War Within Season 1"] = "Война Внутри, 1-й сезон"

-- Dungeons
L["Mists of Tirna Scithe"] = "Туманы Тирна Скитта"
L["Necrotic Wake"] = "Смертельная Тризна"
L["Siege of Boralus"] = "Осада Боралуса"
L["Grim Batol"] = "Грим Батол"
L["Ara-Kara"] = "Ара-Кара, Город Отголосков"
L["City of Threads"] = "Город Нитей"
L["The Stonevault"] = "Каменный Свод"
L["The Dawnbreaker"] = "Сияющий Рассвет"

-- Dungeon Short
L["MOTS"] = "ТТС"
L["NW"] = "СТ"
L["SOB"] = "ОБ"
L["GB"] = "ГБ"
L["AK"] = "Ара-Кара"
L["COT"] = "ГН"
L["SV"] = "КС"
L["DB"] = "СР"

------------------------------------------
--- TWW S2
------------------------------------------
L["The War Within Season 2"] = "Война Внутри, 2-й сезон"

-- Dungeons
L["Cinderbrew Meadery"] = "Искроварня"
L["Darkflame Cleft"] = "Расселина Темного Пламени"
L["Priory of the sacred Flame"] = "Приорат Священного Пламени"
L["The Rookery"] = "Гнездовье"
L["Operation: Floodgate"] = "Операция: Шлюз"
L["Theater of Pain"] = "Театр Боли"
L["Operation: Mechagon"] = "Операция: Мехагон"
L["The Motherlode!!"] = "Золотая ЖИЛА!!!"

-- Dungeon Short
L["CM"] = "Искра"
L["DC"] = "РТП"
L["POF"] = "ПСП"
L["TR"] = "Гнездо"
L["OF"] = "Шлюз"
L["TOP"] = "ТБ"
L["OM"] = "Мехагон"
L["TM"] = "ЖИЛА"
