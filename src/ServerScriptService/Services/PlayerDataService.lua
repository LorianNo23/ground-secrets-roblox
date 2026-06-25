local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.Config.GameConfig)
local UpgradeConfig = require(ReplicatedStorage.Shared.Config.UpgradeConfig)

local PlayerDataService = {}

local playerData = {}

local function createData()
	return {
		Coins = GameConfig.StartingCoins,
		Inventory = {},
		LastFoundItem = nil,
		Detector = {
			RangeLevel = 0,
			LuckLevel = 0,
			Range = GameConfig.StartingDetector.Range,
			Luck = GameConfig.StartingDetector.Luck,
		},
	}
end

function PlayerDataService.AddPlayer(player: Player)
	playerData[player] = createData()
end

function PlayerDataService.RemovePlayer(player: Player)
	playerData[player] = nil
end

function PlayerDataService.GetData(player: Player)
	local data = playerData[player]

	if data == nil then
		data = createData()
		playerData[player] = data
	end

	return data
end

function PlayerDataService.AddItem(player: Player, item)
	local data = PlayerDataService.GetData(player)

	table.insert(data.Inventory, {
		Id = item.Id,
		Name = item.Name,
		Rarity = item.Rarity,
		Value = item.Value,
	})

	data.LastFoundItem = item
end

function PlayerDataService.SellAll(player: Player)
	local data = PlayerDataService.GetData(player)
	local earnedCoins = 0

	for _, item in data.Inventory do
		earnedCoins += item.Value
	end

	data.Inventory = {}
	data.Coins += earnedCoins

	return earnedCoins
end

function PlayerDataService.BuyUpgrade(player: Player, upgradeId: string)
	local data = PlayerDataService.GetData(player)
	local detector = data.Detector

	if upgradeId ~= "Range" and upgradeId ~= "Luck" then
		return false, "Unknown upgrade."
	end

	local levelKey = `{upgradeId}Level`
	local currentLevel = detector[levelKey]
	local upgrade = UpgradeConfig[upgradeId]

	if currentLevel >= upgrade.MaxLevel then
		return false, "Upgrade is already maxed."
	end

	local cost = UpgradeConfig.GetCost(upgradeId, currentLevel)

	if cost == nil or data.Coins < cost then
		return false, "Not enough coins."
	end

	data.Coins -= cost
	detector[levelKey] += 1

	if upgradeId == "Range" then
		detector.Range += upgrade.IncreasePerLevel
	else
		detector.Luck += upgrade.IncreasePerLevel
	end

	return true, "Upgrade bought."
end

return PlayerDataService

