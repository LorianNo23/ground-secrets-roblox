local TreasureConfig = {}

TreasureConfig.Items = {
	{
		Id = "rusty_coin",
		Name = "Rusty Coin",
		Rarity = "Common",
		Value = 8,
		Weight = 60,
	},
	{
		Id = "shell_charm",
		Name = "Shell Charm",
		Rarity = "Uncommon",
		Value = 18,
		Weight = 28,
	},
	{
		Id = "silver_ring",
		Name = "Silver Ring",
		Rarity = "Rare",
		Value = 45,
		Weight = 10,
	},
	{
		Id = "pirate_medallion",
		Name = "Pirate Medallion",
		Rarity = "Epic",
		Value = 120,
		Weight = 2,
	},
}

TreasureConfig.RarityColors = {
	Common = Color3.fromRGB(225, 225, 225),
	Uncommon = Color3.fromRGB(118, 214, 126),
	Rare = Color3.fromRGB(88, 159, 255),
	Epic = Color3.fromRGB(190, 115, 255),
}

function TreasureConfig.RollItem(luck: number)
	local totalWeight = 0

	for _, item in TreasureConfig.Items do
		local rarityBonus = 1

		if item.Rarity == "Rare" then
			rarityBonus = luck
		elseif item.Rarity == "Epic" then
			rarityBonus = luck * luck
		end

		totalWeight += item.Weight * rarityBonus
	end

	local roll = Random.new():NextNumber(0, totalWeight)
	local runningWeight = 0

	for _, item in TreasureConfig.Items do
		local rarityBonus = 1

		if item.Rarity == "Rare" then
			rarityBonus = luck
		elseif item.Rarity == "Epic" then
			rarityBonus = luck * luck
		end

		runningWeight += item.Weight * rarityBonus

		if roll <= runningWeight then
			return item
		end
	end

	return TreasureConfig.Items[1]
end

return TreasureConfig

