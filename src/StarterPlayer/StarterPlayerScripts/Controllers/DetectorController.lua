local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local RemoteNames = require(ReplicatedStorage.Shared.RemoteNames)
local TreasureConfig = require(ReplicatedStorage.Shared.Config.TreasureConfig)
local UpgradeConfig = require(ReplicatedStorage.Shared.Config.UpgradeConfig)

local DetectorController = {}

local player = Players.LocalPlayer
local scanRemote
local digRemote
local sellAllRemote
local buyUpgradeRemote
local getStateRemote
local stateChangedRemote

local gui
local signalFill
local signalText
local coinsText
local inventoryText
local lastFoundText
local messageText
local rangeButton
local luckButton

local currentState = nil

local function setMessage(message: string)
	messageText.Text = message
end

local function remotesReady(): boolean
	return scanRemote ~= nil
		and digRemote ~= nil
		and sellAllRemote ~= nil
		and buyUpgradeRemote ~= nil
		and getStateRemote ~= nil
		and stateChangedRemote ~= nil
end

local function formatItem(item)
	if item == nil then
		return "Last find: Nothing yet"
	end

	return `Last find: {item.Name} ({item.Rarity})`
end

local function updateState(state)
	currentState = state

	coinsText.Text = `Coins: {state.Coins}`
	inventoryText.Text = `Inventory: {#state.Inventory} item(s)`
	lastFoundText.Text = formatItem(state.LastFoundItem)

	if state.LastFoundItem ~= nil then
		lastFoundText.TextColor3 = TreasureConfig.RarityColors[state.LastFoundItem.Rarity] or Color3.new(1, 1, 1)
	end

	local rangeCost = UpgradeConfig.GetCost("Range", state.Detector.RangeLevel)
	local luckCost = UpgradeConfig.GetCost("Luck", state.Detector.LuckLevel)

	rangeButton.Text = `Range Lv {state.Detector.RangeLevel} (${rangeCost or "Max"})`
	luckButton.Text = `Luck Lv {state.Detector.LuckLevel} (${luckCost or "Max"})`
end

local function createButton(text: string, order: number)
	local button = Instance.new("TextButton")
	button.LayoutOrder = order
	button.BackgroundColor3 = Color3.fromRGB(49, 89, 112)
	button.BorderSizePixel = 0
	button.Font = Enum.Font.GothamMedium
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = 14
	button.Size = UDim2.new(1, 0, 0, 34)

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	return button
end

local function createGui()
	gui = Instance.new("ScreenGui")
	gui.Name = "DetectorHud"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local panel = Instance.new("Frame")
	panel.Name = "Panel"
	panel.AnchorPoint = Vector2.new(0, 1)
	panel.BackgroundColor3 = Color3.fromRGB(30, 38, 42)
	panel.BackgroundTransparency = 0.08
	panel.BorderSizePixel = 0
	panel.Position = UDim2.new(0, 16, 1, -16)
	panel.Size = UDim2.new(0, 300, 0, 420)
	panel.Parent = gui

	local panelCorner = Instance.new("UICorner")
	panelCorner.CornerRadius = UDim.new(0, 8)
	panelCorner.Parent = panel

	local padding = Instance.new("UIPadding")
	padding.PaddingBottom = UDim.new(0, 12)
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)
	padding.PaddingTop = UDim.new(0, 12)
	padding.Parent = panel

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = panel

	local title = Instance.new("TextLabel")
	title.LayoutOrder = 1
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.GothamBold
	title.Text = "Metal Detector"
	title.TextColor3 = Color3.fromRGB(255, 242, 205)
	title.TextSize = 20
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Size = UDim2.new(1, 0, 0, 26)
	title.Parent = panel

	signalText = Instance.new("TextLabel")
	signalText.LayoutOrder = 2
	signalText.BackgroundTransparency = 1
	signalText.Font = Enum.Font.Gotham
	signalText.Text = "Signal: 0%"
	signalText.TextColor3 = Color3.fromRGB(232, 238, 239)
	signalText.TextSize = 14
	signalText.TextXAlignment = Enum.TextXAlignment.Left
	signalText.Size = UDim2.new(1, 0, 0, 18)
	signalText.Parent = panel

	local signalBar = Instance.new("Frame")
	signalBar.LayoutOrder = 3
	signalBar.BackgroundColor3 = Color3.fromRGB(15, 20, 22)
	signalBar.BorderSizePixel = 0
	signalBar.Size = UDim2.new(1, 0, 0, 16)
	signalBar.Parent = panel

	signalFill = Instance.new("Frame")
	signalFill.BackgroundColor3 = Color3.fromRGB(255, 200, 87)
	signalFill.BorderSizePixel = 0
	signalFill.Size = UDim2.new(0, 0, 1, 0)
	signalFill.Parent = signalBar

	coinsText = Instance.new("TextLabel")
	coinsText.LayoutOrder = 4
	coinsText.BackgroundTransparency = 1
	coinsText.Font = Enum.Font.GothamMedium
	coinsText.Text = "Coins: 0"
	coinsText.TextColor3 = Color3.fromRGB(255, 232, 128)
	coinsText.TextSize = 15
	coinsText.TextXAlignment = Enum.TextXAlignment.Left
	coinsText.Size = UDim2.new(1, 0, 0, 20)
	coinsText.Parent = panel

	inventoryText = coinsText:Clone()
	inventoryText.LayoutOrder = 5
	inventoryText.Text = "Inventory: 0 item(s)"
	inventoryText.TextColor3 = Color3.fromRGB(232, 238, 239)
	inventoryText.Parent = panel

	lastFoundText = coinsText:Clone()
	lastFoundText.LayoutOrder = 6
	lastFoundText.Text = "Last find: Nothing yet"
	lastFoundText.TextColor3 = Color3.fromRGB(232, 238, 239)
	lastFoundText.Parent = panel

	messageText = coinsText:Clone()
	messageText.LayoutOrder = 7
	messageText.Text = "Connecting detector..."
	messageText.TextColor3 = Color3.fromRGB(174, 205, 214)
	messageText.Parent = panel

	local scanButton = createButton("Scan", 8)
	scanButton.Parent = panel
	scanButton.Activated:Connect(function()
		DetectorController.Scan()
	end)

	local digButton = createButton("Dig", 9)
	digButton.Parent = panel
	digButton.Activated:Connect(function()
		DetectorController.Dig()
	end)

	local sellButton = createButton("Sell Inventory", 10)
	sellButton.Parent = panel
	sellButton.Activated:Connect(function()
		if not remotesReady() then
			setMessage("Detector is still connecting.")
			return
		end

		local result = sellAllRemote:InvokeServer()
		setMessage(result.Message)
	end)

	rangeButton = createButton("Range Lv 0", 11)
	rangeButton.Parent = panel
	rangeButton.Activated:Connect(function()
		if not remotesReady() then
			setMessage("Detector is still connecting.")
			return
		end

		local result = buyUpgradeRemote:InvokeServer("Range")
		setMessage(result.Message)
	end)

	luckButton = createButton("Luck Lv 0", 12)
	luckButton.Parent = panel
	luckButton.Activated:Connect(function()
		if not remotesReady() then
			setMessage("Detector is still connecting.")
			return
		end

		local result = buyUpgradeRemote:InvokeServer("Luck")
		setMessage(result.Message)
	end)
end

function DetectorController.Scan()
	if not remotesReady() then
		setMessage("Detector is still connecting.")
		return
	end

	local result = scanRemote:InvokeServer()
	local strength = result.Strength or 0

	signalFill.Size = UDim2.new(strength, 0, 1, 0)
	signalText.Text = `Signal: {math.floor(strength * 100)}%`

	if strength >= 0.7 then
		setMessage("Strong signal. Dig here.")
	elseif strength > 0 then
		setMessage("Weak signal. Keep moving.")
	else
		setMessage("No signal nearby.")
	end
end

function DetectorController.Dig()
	if not remotesReady() then
		setMessage("Detector is still connecting.")
		return
	end

	local result = digRemote:InvokeServer()
	setMessage(result.Message)
end

function DetectorController.Start()
	createGui()

	local remotes = ReplicatedStorage:WaitForChild(RemoteNames.Folder, 10)

	if remotes == nil then
		setMessage("Detector remotes were not found. Check server Output.")
		return
	end

	scanRemote = remotes:WaitForChild(RemoteNames.Scan, 10)
	digRemote = remotes:WaitForChild(RemoteNames.Dig, 10)
	sellAllRemote = remotes:WaitForChild(RemoteNames.SellAll, 10)
	buyUpgradeRemote = remotes:WaitForChild(RemoteNames.BuyUpgrade, 10)
	getStateRemote = remotes:WaitForChild(RemoteNames.GetState, 10)
	stateChangedRemote = remotes:WaitForChild(RemoteNames.StateChanged, 10)

	if not remotesReady() then
		setMessage("Detector remotes are incomplete. Check server Output.")
		return
	end

	stateChangedRemote.OnClientEvent:Connect(updateState)
	updateState(getStateRemote:InvokeServer())
	setMessage("E: scan | R: dig")

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.KeyCode == Enum.KeyCode.E then
			DetectorController.Scan()
		elseif input.KeyCode == Enum.KeyCode.R then
			DetectorController.Dig()
		end
	end)
end

return DetectorController
