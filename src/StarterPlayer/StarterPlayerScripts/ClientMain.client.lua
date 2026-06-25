local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.Config.GameConfig)
local DetectorController = require(script.Controllers.DetectorController)

print(`{GameConfig.GameName} client started`)

DetectorController.Start()
