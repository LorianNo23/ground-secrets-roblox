local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local TreasureConfig = require(ReplicatedStorage.Shared.Config.TreasureConfig)

local TreasureSpotService = {}

local DIG_DISTANCE = 7

local spots = {}

local spotPositions = {
	Vector3.new(-28, 0.4, -18),
	Vector3.new(-10, 0.4, 12),
	Vector3.new(16, 0.4, -8),
	Vector3.new(32, 0.4, 20),
	Vector3.new(4, 0.4, 34),
}

local function getRootPosition(player: Player): Vector3?
	local character = player.Character

	if character == nil then
		return nil
	end

	local rootPart = character:FindFirstChild("HumanoidRootPart")

	if rootPart == nil or not rootPart:IsA("BasePart") then
		return nil
	end

	return rootPart.Position
end

function TreasureSpotService.Start()
	local beach = Workspace:FindFirstChild("Beach")

	if beach == nil then
		beach = Instance.new("Part")
		beach.Name = "Beach"
		beach.Anchored = true
		beach.Color = Color3.fromRGB(238, 211, 148)
		beach.Material = Enum.Material.Sand
		beach.Size = Vector3.new(90, 1, 90)
		beach.Position = Vector3.new(0, -0.25, 0)
		beach.Parent = Workspace
	end

	local folder = Workspace:FindFirstChild("TreasureSpots")

	if folder == nil then
		folder = Instance.new("Folder")
		folder.Name = "TreasureSpots"
		folder.Parent = Workspace
	end

	for index, position in spotPositions do
		local spot = Instance.new("Part")
		spot.Name = `BeachSpot{index}`
		spot.Anchored = true
		spot.CanCollide = false
		spot.Transparency = 0.75
		spot.Color = Color3.fromRGB(255, 220, 120)
		spot.Material = Enum.Material.Sand
		spot.Size = Vector3.new(4, 0.3, 4)
		spot.Position = position
		spot.Parent = folder

		table.insert(spots, {
			Part = spot,
			Position = position,
			Claimed = false,
		})
	end
end

function TreasureSpotService.GetSignal(player: Player, range: number)
	local rootPosition = getRootPosition(player)

	if rootPosition == nil then
		return {
			Strength = 0,
			Distance = nil,
		}
	end

	local nearestDistance = math.huge

	for _, spot in spots do
		if not spot.Claimed then
			local distance = (spot.Position - rootPosition).Magnitude

			if distance < nearestDistance then
				nearestDistance = distance
			end
		end
	end

	if nearestDistance == math.huge or nearestDistance > range then
		return {
			Strength = 0,
			Distance = nil,
		}
	end

	return {
		Strength = math.clamp(1 - (nearestDistance / range), 0, 1),
		Distance = nearestDistance,
	}
end

function TreasureSpotService.TryDig(player: Player, detector)
	local rootPosition = getRootPosition(player)

	if rootPosition == nil then
		return false, "Character is not ready."
	end

	local nearestSpot = nil
	local nearestDistance = math.huge

	for _, spot in spots do
		if not spot.Claimed then
			local distance = (spot.Position - rootPosition).Magnitude

			if distance < nearestDistance then
				nearestDistance = distance
				nearestSpot = spot
			end
		end
	end

	if nearestSpot == nil then
		return false, "No treasure spots remain."
	end

	if nearestDistance > math.min(detector.Range, DIG_DISTANCE) then
		return false, "Signal is too weak. Move closer."
	end

	nearestSpot.Claimed = true
	nearestSpot.Part.Transparency = 0.35
	nearestSpot.Part.Color = Color3.fromRGB(135, 92, 54)

	return true, TreasureConfig.RollItem(detector.Luck)
end

return TreasureSpotService
