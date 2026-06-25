local UpgradeConfig = {}

UpgradeConfig.Range = {
	Name = "Detector Range",
	MaxLevel = 5,
	BaseCost = 35,
	CostStep = 25,
	IncreasePerLevel = 5,
}

UpgradeConfig.Luck = {
	Name = "Detector Luck",
	MaxLevel = 5,
	BaseCost = 45,
	CostStep = 35,
	IncreasePerLevel = 0.25,
}

function UpgradeConfig.GetCost(upgradeId: string, currentLevel: number): number?
	local upgrade = UpgradeConfig[upgradeId]

	if upgrade == nil then
		return nil
	end

	return upgrade.BaseCost + (currentLevel * upgrade.CostStep)
end

return UpgradeConfig

