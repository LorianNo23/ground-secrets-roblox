local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.Config.GameConfig)
local RemoteNames = require(ReplicatedStorage.Shared.RemoteNames)
local PlayerDataService = require(script.Parent.Services.PlayerDataService)
local TreasureSpotService = require(script.Parent.Services.TreasureSpotService)

print(`{GameConfig.GameName} server started`)

local remotes = ReplicatedStorage:FindFirstChild(RemoteNames.Folder)

if remotes == nil then
	remotes = Instance.new("Folder")
	remotes.Name = RemoteNames.Folder
	remotes.Parent = ReplicatedStorage
end

local function getOrCreateRemote(className: string, remoteName: string)
	local remote = remotes:FindFirstChild(remoteName)

	if remote == nil then
		remote = Instance.new(className)
		remote.Name = remoteName
		remote.Parent = remotes
	end

	return remote
end

local scanRemote = getOrCreateRemote("RemoteFunction", RemoteNames.Scan)
local digRemote = getOrCreateRemote("RemoteFunction", RemoteNames.Dig)
local sellAllRemote = getOrCreateRemote("RemoteFunction", RemoteNames.SellAll)
local buyUpgradeRemote = getOrCreateRemote("RemoteFunction", RemoteNames.BuyUpgrade)
local getStateRemote = getOrCreateRemote("RemoteFunction", RemoteNames.GetState)
local stateChangedRemote = getOrCreateRemote("RemoteEvent", RemoteNames.StateChanged)

local function publishState(player: Player)
	stateChangedRemote:FireClient(player, PlayerDataService.GetData(player))
end

TreasureSpotService.Start()

Players.PlayerAdded:Connect(function(player)
	PlayerDataService.AddPlayer(player)
	publishState(player)
end)

Players.PlayerRemoving:Connect(function(player)
	PlayerDataService.RemovePlayer(player)
end)

scanRemote.OnServerInvoke = function(player)
	local data = PlayerDataService.GetData(player)

	return TreasureSpotService.GetSignal(player, data.Detector.Range)
end

digRemote.OnServerInvoke = function(player)
	local data = PlayerDataService.GetData(player)
	local success, result = TreasureSpotService.TryDig(player, data.Detector)

	if not success then
		return {
			Success = false,
			Message = result,
		}
	end

	PlayerDataService.AddItem(player, result)
	publishState(player)

	return {
		Success = true,
		Message = `Found {result.Name}!`,
		Item = result,
	}
end

sellAllRemote.OnServerInvoke = function(player)
	local earnedCoins = PlayerDataService.SellAll(player)
	publishState(player)

	return {
		Success = true,
		Message = `Sold inventory for {earnedCoins} coins.`,
		EarnedCoins = earnedCoins,
	}
end

buyUpgradeRemote.OnServerInvoke = function(player, upgradeId)
	local success, message = PlayerDataService.BuyUpgrade(player, upgradeId)
	publishState(player)

	return {
		Success = success,
		Message = message,
	}
end

getStateRemote.OnServerInvoke = function(player)
	return PlayerDataService.GetData(player)
end
