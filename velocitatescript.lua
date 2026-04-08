local players = game:GetService("Players")
local player = players.LocalPlayer
local playergui = player:WaitForChild("PlayerGui")
local on = false

local VelocitateUI = Instance.new("ScreenGui")
VelocitateUI.Parent = playergui


local MainFrame = Instance.new("Frame")
MainFrame.Parent = VelocitateUI
MainFrame.Name = "Frame"
MainFrame.Size = UDim2.new(0.240203, 0, 0.516667, 0)
MainFrame.Position = UDim2.new(0.000000, 0, 0.218750, 0)
MainFrame.AnchorPoint = Vector2.new(0.000000, 0.000000)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 148, 55)
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.ZIndex = 1
MainFrame.Rotation = 0
MainFrame.ClipsDescendants = false

local Enable = Instance.new("TextButton")
Enable.Parent = MainFrame
Enable.Name = "Enable"
Enable.Size = UDim2.new(0.827848, 0, 0.227688, 0)
Enable.Position = UDim2.new(0.084388, 0, 0.235215, 0)
Enable.AnchorPoint = Vector2.new(0.000000, 0.000000)
Enable.BackgroundColor3 = Color3.fromRGB(133, 208, 255)
Enable.BackgroundTransparency = 0
Enable.BorderSizePixel = 0
Enable.Text = "Toggle godmode"
Enable.TextColor3 = Color3.fromRGB(0, 0, 0)
Enable.TextSize = 14
Enable.TextScaled = true
Enable.Font = Enum.Font.FredokaOne
Enable.Visible = true
Enable.ZIndex = 1
Enable.Rotation = 0
Enable.AutoButtonColor = true

local UICorner_4081 = Instance.new("UICorner")
UICorner_4081.Parent = Enable
UICorner_4081.CornerRadius = UDim.new(0.000000, 8)

local UIStroke_6492 = Instance.new("UIStroke")
UIStroke_6492.Parent = Enable
UIStroke_6492.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6492.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
UIStroke_6492.Thickness = 0.07999999821186066
UIStroke_6492.Color = Color3.fromRGB(0, 0, 0)
UIStroke_6492.Transparency = 0
UIStroke_6492.Enabled = true
UIStroke_6492.LineJoinMode = Enum.LineJoinMode.Round

local Status = Instance.new("TextLabel")
Status.Parent = MainFrame
Status.Name = "Status"
Status.Size = UDim2.new(0.543038, 0, 0.157124, 0)
Status.Position = UDim2.new(0.210970, 0, 0.534274, 0)
Status.AnchorPoint = Vector2.new(0.000000, 0.000000)
Status.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Status.BackgroundTransparency = 0
Status.Text = "OFF"
Status.TextColor3 = Color3.fromRGB(0, 0, 0)
Status.TextSize = 14
Status.TextScaled = true
Status.Font = Enum.Font.FredokaOne
Status.Visible = true
Status.ZIndex = 1
Status.Rotation = 0

local UICorner_5967 = Instance.new("UICorner")
UICorner_5967.Parent = Status
UICorner_5967.CornerRadius = UDim.new(0.000000, 20)

local UIStroke_7900 = Instance.new("UIStroke")
UIStroke_7900.Parent = Status
UIStroke_7900.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_7900.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
UIStroke_7900.Thickness = 0.20000000298023224
UIStroke_7900.Color = Color3.fromRGB(0, 0, 0)
UIStroke_7900.Transparency = 0
UIStroke_7900.Enabled = true
UIStroke_7900.LineJoinMode = Enum.LineJoinMode.Round

local function getRoot()
	local character = player.Character
	if not character then player:Kick("NO DATAMODEL FOUND") end
	
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then player:Kick("REQUESTED DATAMODEL WAS NOT FOUND.") end
	
	return root
end

local function toggleOn() 
	Status.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	Status.Text = "ON"
end
local function toggleOff()
	Status.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Status.Text = "OFF"
end

Enable.MouseButton1Click:Connect(function()
	if on == false then
		on = true
		toggleOn()
	else
		on = false
		toggleOff()
	end
end)

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
	local root = getRoot()

	local baseCF = root.CFrame

	if not on then return end

	baseCF = root.CFrame

	local offset = CFrame.new(
		math.random(-5,5)/3,
		math.random(-5,5)/3,
		math.random(-5,5)/3
	)

	root.CFrame = baseCF * offset
=
	root.AssemblyLinearVelocity += Vector3.new(
		math.random(-20,20),
		math.random(-5,5),
		math.random(-20,20)
	)

	root.CFrame = root.CFrame:Lerp(baseCF, 0.6)
end)