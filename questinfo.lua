--[[
Quests Object
	name: name of quest category (quest section name)
	questTypes:
		name : e.g. World Boss
		quest names -> list of names of questTypes, e.g. Boss1, Boss2
--]]

local Info = {}
DQT.Info = Info
local QUEST_TYPE_ENUM = DQT.QUEST_TYPE_ENUM
local Quest = DQT.Quest
local QuestType = DQT.QuestType
local QuestSection = DQT.QuestSection
local Utils = DQT.Utils

-- helper function for Quest:new when name and display name both need to be converted with GetString
local function newQuest(siName, siDisplayName)
	return Quest:new(GetString(siName), siDisplayName and GetString(siDisplayName) or nil)
end

Info.CraftingQuests = QuestSection:new(GetString(SI_DQT_CRAFTING), {
	QuestType:new(
		GetString(SI_DQT_CLOTHING),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_EQUIPMENT_CRAFTING_WRITS_02)}),
	QuestType:new(
		GetString(SI_DQT_BLACKSMITHING),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_EQUIPMENT_CRAFTING_WRITS_01)}),
	QuestType:new(
		GetString(SI_DQT_WOODWORKING),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_EQUIPMENT_CRAFTING_WRITS_04)}),
	QuestType:new(
		GetString(SI_DQT_JEWELRY),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_EQUIPMENT_CRAFTING_WRITS_03)}),
	QuestType:new(
		GetString(SI_DQT_ALCHEMY),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_CONSUMABLES_CRAFTING_WRITS_01)}),
	QuestType:new(
		GetString(SI_DQT_ENCHANTING),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_CONSUMABLES_CRAFTING_WRITS_02)}),
	QuestType:new(
		GetString(SI_DQT_PROVISIONING),
		QUEST_TYPE_ENUM.MISC,
		{newQuest(SI_DQT_CRAFTING_WRITS_CONSUMABLES_CRAFTING_WRITS_03)})
})

Info.SummersetQuests = QuestSection:new(GetString(SI_DQT_SUMMERSET), {
	QuestType:new(
		GetString(SI_DQT_GROUP_BOSS),
		QUEST_TYPE_ENUM.GROUP_BOSS,
		{
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_01, SI_DQT_SUMMERSET_QUESTS_BOUNTY_01_DISPLAY),
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_02, SI_DQT_SUMMERSET_QUESTS_BOUNTY_02_DISPLAY),
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_03, SI_DQT_SUMMERSET_QUESTS_BOUNTY_03_DISPLAY),
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_04, SI_DQT_SUMMERSET_QUESTS_BOUNTY_04_DISPLAY),
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_05, SI_DQT_SUMMERSET_QUESTS_BOUNTY_05_DISPLAY),
			newQuest(SI_DQT_SUMMERSET_QUESTS_BOUNTY_06, SI_DQT_SUMMERSET_QUESTS_BOUNTY_06_DISPLAY)}),
	QuestType:new(
		GetString(SI_DQT_DELVE),
		QUEST_TYPE_ENUM.DELVE,
		{
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_01),
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_02),
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_03),
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_04),
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_05),
			newQuest(SI_DQT_SUMMERSET_QUESTS_EXPLORATORY_06)}),
	QuestType:new(
		GetString(SI_DQT_GEYSERS),
		QUEST_TYPE_ENUM.DOLMEN,
		{newQuest(SI_DQT_SUMMERSET_QUESTS_ABYSSAL_GEYSERS_01)})
})

-- create Vvardenfell relic Quest object from variable like SI_DQT_VVARDENFELL_QUESTS_RELICS_01
local function relicsQuest(questLangVar)
	local questName = GetString(questLangVar)
	return Quest:new(questName,
		Utils:stripPrefixes(questName, {
			GetString(SI_DQT_VVARDENFELL_QUESTS_RELICS_PREFIX_1),
			GetString(SI_DQT_VVARDENFELL_QUESTS_RELICS_PREFIX_2)
	}))
end

Info.VvardenfellQuests = QuestSection:new(GetString(SI_DQT_VVARDENFELL), {
	QuestType:new(
		GetString(SI_DQT_GROUP_BOSS),
		QUEST_TYPE_ENUM.GROUP_BOSS,
		{
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_01, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_01_DISPLAY),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_02, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_02_DISPLAY),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_03, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_03_DISPLAY),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_04, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_04_DISPLAY),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_05, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_05_DISPLAY),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_BOUNTY_06, SI_DQT_VVARDENFELL_QUESTS_BOUNTY_06_DISPLAY)}),
	QuestType:new(
		GetString(SI_DQT_DELVE),
		QUEST_TYPE_ENUM.DELVE,
		{
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_01),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_02),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_03),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_04),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_05),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_EXPLORATORY_06)}),
	QuestType:new(
		GetString(SI_DQT_ASHLANDER_HUNT),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_01),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_02),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_03),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_04),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_05),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_06),
			newQuest(SI_DQT_VVARDENFELL_QUESTS_HUNT_07)}),
	QuestType:new(
		GetString(SI_DQT_ASHLANDER_RELIC),
		QUEST_TYPE_ENUM.MISC,
		{
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_01),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_02),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_03),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_04),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_05),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_06),
			relicsQuest(SI_DQT_VVARDENFELL_QUESTS_RELICS_07)})
})

-- create fighters guild Quest object from variable like SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_01
local function fightersQuest(questLangVar)
	local questName = GetString(questLangVar)
	return Quest:new(questName,
		Utils:stripPrefixes(questName, {
			GetString(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_PREFIX_1),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_PREFIX_2),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_PREFIX_3),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_PREFIX_4)
	}))
end

-- create mages guild Quest object from variable like SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_01
local function magesQuest(questLangVar)
	local questName = GetString(questLangVar)
	return Quest:new(questName,
		Utils:stripPrefixes(questName, {
			GetString(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_PREFIX_1),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_PREFIX_2),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_PREFIX_3),
			GetString(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_PREFIX_4)
	}))
end

Info.GuildQuests = QuestSection:new(GetString(SI_DQT_GUILD), {
	QuestType:new(
		GetString(SI_DQT_FIGHTERS_GUILD),
		QUEST_TYPE_ENUM.DOLMEN,
		{
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_01),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_02),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_03),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_04),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_05),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_06),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_07),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_08),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_09),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_10),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_11),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_12),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_13),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_14),
			fightersQuest(SI_DQT_GUILD_DAILY_QUESTS_FIGHTERS_GUILD_DAILY_QUESTS_15)}),
	QuestType:new(
		GetString(SI_DQT_MAGES_GUILD),
		QUEST_TYPE_ENUM.DELVE,
		{
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_01),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_02),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_03),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_04),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_05),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_06),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_07),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_08),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_09),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_10),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_11),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_12),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_13),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_14),
			magesQuest(SI_DQT_GUILD_DAILY_QUESTS_MAGES_GUILD_DAILY_QUESTS_15)}),
	QuestType:new(
		GetString(SI_DQT_UNDAUNTED_DELVE),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_01),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_02),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_03),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_04),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_05),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_06),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_07),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_08),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_09),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_10),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_11),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_12),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_13),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_14),
			newQuest(SI_DQT_GUILD_DAILY_QUESTS_UNDAUNTED_DAILY_QUESTS_15)})
})

-- create Cyrodilic Collections Quest object from variable like SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_01
local function ccQuestType(questLangVar)
	return QuestType:new(GetString(questLangVar),
		QUEST_TYPE_ENUM.MISC,
		{Quest:new(GetString(questLangVar))})
end

Info.CyrodilicCollectionsQuests = QuestSection:new(GetString(SI_DQT_CYRODILIC_COLLECTIONS), {
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_01),
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_02),
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_03),
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_04),
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_05),
	ccQuestType(SI_DQT_BLACK_MARSH_CYRODILIC_COLLECTIONS_06)
})

Info.ClockworkCityQuests = QuestSection:new(GetString(SI_DQT_CLOCKWORK_CITY), {
	QuestType:new(
		GetString(SI_DQT_GROUP_BOSS),
		QUEST_TYPE_ENUM.GROUP_BOSS,
		{
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BOUNTY_01, SI_DQT_CLOCKWORK_CITY_QUESTS_BOUNTY_01_DISPLAY),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BOUNTY_02, SI_DQT_CLOCKWORK_CITY_QUESTS_BOUNTY_02_DISPLAY)}),
	QuestType:new(
		GetString(SI_DQT_DELVE),
		QUEST_TYPE_ENUM.DELVE,
		{
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_01),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_02),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_03),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_04),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_05),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_EXPLORATORY_06)}),
	QuestType:new(
		GetString(SI_DQT_TARNISHED),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_01),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_02),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_03),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_04),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_05),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_TARNISHED_06)}),
	QuestType:new(
		GetString(SI_DQT_BLACKFEATHER_COURT),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_01),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_02),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_03),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_04),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_05),
			newQuest(SI_DQT_CLOCKWORK_CITY_QUESTS_BLACKFEATHER_COURT_06)}),
})

Info.WrothgarQuests = QuestSection:new(GetString(SI_DQT_WROTHGAR), {
	QuestType:new(
		GetString(SI_DQT_GROUP_BOSS),
		QUEST_TYPE_ENUM.GROUP_BOSS,
		{
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_01, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_01_DISPLAY),
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_02, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_02_DISPLAY),
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_03, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_03_DISPLAY),
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_04, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_04_DISPLAY),
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_05, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_05_DISPLAY),
			newQuest(SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_06, SI_DQT_WROTHGAR_QUESTS_GROUP_BOSS_DAILIES_06_DISPLAY)}),
	QuestType:new(
		GetString(SI_DQT_DELVE),
		QUEST_TYPE_ENUM.DELVE,
		{
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_01),
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_02),
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_03),
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_04),
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_05),
			newQuest(SI_DQT_WROTHGAR_QUESTS_DELVE_DAILIES_06)})
})

-- create heist Quest object from variable like SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_01
local function heistQuest(questLangVar)
	local questName = GetString(questLangVar)
	return Quest:new(questName,
		Utils:stripPrefixes(questName, {
			GetString(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_PREFIX_1),
			GetString(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_PREFIX_2)
	}))
end

Info.ThievesGuildQuests = QuestSection:new(GetString(SI_DQT_THIEVES_GUILD), {
	QuestType:new(
		GetString(SI_DQT_RYES_REACQUISITIONS),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_RYE_S_REACQUISITIONS_01),
			newQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_RYE_S_REACQUISITIONS_02),
			newQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_RYE_S_REACQUISITIONS_03),
			newQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_RYE_S_REACQUISITIONS_04)}),
	QuestType:new(
		GetString(SI_DQT_HEIST),
		QUEST_TYPE_ENUM.MISC,
		{
			heistQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_01),
			heistQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_02),
			heistQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_03),
			heistQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_04),
			heistQuest(SI_DQT_THIEVES_GUILD_LARCENY_QUESTS_HEISTS_05)})
})

-- create sacrament Quest object from variable like SI_DQT_GOLD_COAST_QUESTS_DARK_BROTHERHOOD_SACRAMENTS_01
local function sacramentQuest(questLangVar)
	local questName = GetString(questLangVar)
	return Quest:new(questName,
		Utils:stripPrefixes(questName, {
			GetString(SI_DQT_GOLD_COAST_QUESTS_DARK_BROTHERHOOD_SACRAMENTS_PREFIX),
	}))
end

Info.DarkBrotherhoodQuests = QuestSection:new(GetString(SI_DQT_DARK_BROTHERHOOD), {
	QuestType:new(
		GetString(SI_DQT_GOLD_COAST_BOUNTY),
		QUEST_TYPE_ENUM.GROUP_BOSS,
		{
			newQuest(SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_01, SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_01_DISPLAY),
			newQuest(SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_02, SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_02_DISPLAY),
			newQuest(SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_03, SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_03_DISPLAY),
			newQuest(SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_04, SI_DQT_GOLD_COAST_QUESTS_BOUNTIES_04_DISPLAY)}),
	QuestType:new(
		GetString(SI_DQT_SACRAMENT),
		QUEST_TYPE_ENUM.MISC,
		{
			sacramentQuest(SI_DQT_GOLD_COAST_QUESTS_DARK_BROTHERHOOD_SACRAMENTS_01),
			sacramentQuest(SI_DQT_GOLD_COAST_QUESTS_DARK_BROTHERHOOD_SACRAMENTS_02),
			sacramentQuest(SI_DQT_GOLD_COAST_QUESTS_DARK_BROTHERHOOD_SACRAMENTS_03)})
})

Info.MurkmireQuests = QuestSection:new(GetString(SI_DQT_MURKMIRE), {
	QuestType:new(
		GetString(SI_DQT_GROUP_BOSS),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_01),
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_02),
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_03),
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_04),
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_05),
			newQuest(SI_DQT_MURKMIRE_QUESTS_BOUNTY_06)}),
	QuestType:new(
		GetString(SI_DQT_DELVE),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_01),
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_02),
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_03),
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_04),
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_05),
			newQuest(SI_DQT_MURKMIRE_QUESTS_EXPLORATORY_06)}),
	QuestType:new(
		GetString(SI_DQT_ROOT_WHISPER),
		QUEST_TYPE_ENUM.MISC,
		{
			newQuest(SI_DQT_MURKMIRE_QUESTS_ROOT_WHISPER_01),
			newQuest(SI_DQT_MURKMIRE_QUESTS_ROOT_WHISPER_02),
			newQuest(SI_DQT_MURKMIRE_QUESTS_ROOT_WHISPER_03),
			newQuest(SI_DQT_MURKMIRE_QUESTS_ROOT_WHISPER_04),
			newQuest(SI_DQT_MURKMIRE_QUESTS_ROOT_WHISPER_05)}),
})

Info.Pledges = DQT.Pledges.getPledgeSection()

Info.QuestSections = {
	Info.CraftingQuests,
	Info.Pledges,
	Info.SummersetQuests,
	Info.VvardenfellQuests,
	Info.CyrodilicCollectionsQuests,
	Info.GuildQuests,
	Info.ClockworkCityQuests,
	Info.WrothgarQuests,
	Info.ThievesGuildQuests,
	Info.DarkBrotherhoodQuests,
	Info.MurkmireQuests
}