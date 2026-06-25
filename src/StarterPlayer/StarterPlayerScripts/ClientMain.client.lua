local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.Config.GameConfig)
local DetectorController = require(script.Parent.Controllers.DetectorController)

print(`{GameConfig.GameName} client started`)

local success, message = pcall(function()
	DetectorController.Start()
end)

if not success then
	warn(`Detector client failed to start: {message}`)
end
