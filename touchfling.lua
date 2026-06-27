local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local ForceTextBox = Instance.new("TextBox")
local SaveButton = Instance.new("TextButton")

local FORCE = 1000


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 158, 0, 180) 

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 158, 0, 25)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.112792775, 0, -0.0151660154, 0)
TextLabel.Size = UDim2.new(0, 121, 0, 26)
TextLabel.Font = Enum.Font.Sarpanch
TextLabel.Text = "Touch Fling"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 25.000

-- Main Toggle Button (ON/OFF)
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.114, 0, 0.20, 0)
ToggleButton.Size = UDim2.new(0, 121, 0, 35)
ToggleButton.Font = Enum.Font.SourceSansItalic
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextSize = 20.000

ForceTextBox.Parent = Frame
ForceTextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ForceTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
ForceTextBox.BorderSizePixel = 0
ForceTextBox.Position = UDim2.new(0.114, 0, 0.47, 0)
ForceTextBox.Size = UDim2.new(0, 121, 0, 30)
ForceTextBox.Font = Enum.Font.SourceSans
ForceTextBox.Text = tostring(FORCE)
ForceTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ForceTextBox.TextSize = 16.000
ForceTextBox.PlaceholderText = "Force Amount"

SaveButton.Parent = Frame
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 150, 70)
SaveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveButton.BorderSizePixel = 0
SaveButton.Position = UDim2.new(0.114, 0, 0.70, 0)
SaveButton.Size = UDim2.new(0, 121, 0, 30)
SaveButton.Font = Enum.Font.SourceSansBold
SaveButton.Text = "SAVE FORCE"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.TextSize = 16.000

local function IIMAWH_fake_script() 
    local script = Instance.new('LocalScript', Frame)

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    
    local hiddenfling = false
    local flingThread 
    
    if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
        local detection = Instance.new("Decal")
        detection.Name = "juisdfj0i32i0eidsuf0iok"
        detection.Parent = ReplicatedStorage
    end
    
    local function fling()
        local lp = Players.LocalPlayer
        local c, hrp, vel, movel = nil, nil, nil, 0.1
    
        while hiddenfling do
            RunService.Heartbeat:Wait()
            c = lp.Character
            hrp = c and c:FindFirstChild("HumanoidRootPart")
    
            if hrp then
                vel = hrp.Velocity
                hrp.Velocity = vel * FORCE + Vector3.new(0, FORCE, 0)
                RunService.RenderStepped:Wait()
                hrp.Velocity = vel
                RunService.Stepped:Wait()
                hrp.Velocity = vel + Vector3.new(0, movel, 0)
                movel = -movel
            end
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        hiddenfling = not hiddenfling
        ToggleButton.Text = hiddenfling and "ON" or "OFF"
    
        if hiddenfling then
            flingThread = coroutine.create(fling)
            coroutine.resume(flingThread)
        else
            hiddenfling = false
        end
    end)
    
    SaveButton.MouseButton1Click:Connect(function()
        local inputNum = tonumber(ForceTextBox.Text)
        if inputNum then
            FORCE = inputNum
            SaveButton.Text = "SAVED!"
            task.wait(1)
            SaveButton.Text = "SAVE FORCE"
        else
            local oldText = ForceTextBox.Text
            ForceTextBox.Text = "Invalid Number!"
            task.wait(1.5)
            ForceTextBox.Text = oldText
        end
    end)
end
coroutine.wrap(IIMAWH_fake_script)()

local function QCJQJL_fake_script()
    local script = Instance.new('LocalScript', Frame)
    script.Parent.Active = true
    script.Parent.Draggable = true
end
coroutine.wrap(QCJQJL_fake_script)()
