-- =============================================
-- Dayı Script Hub v7.3 - STILL IN PROGRESS!
-- =============================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DayiScriptHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 640, 0, 600)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 25, 110)
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "🔥 DAYI SCRIPT HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TitleBar

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 170, 1, -60)
Sidebar.Position = UDim2.new(0, 0, 0, 60)
Sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
Sidebar.Parent = MainFrame

-- Content
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -170, 1, -60)
ContentArea.Position = UDim2.new(0, 170, 0, 60)
ContentArea.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
ContentArea.Parent = MainFrame

-- Tabs
local GraphicsTab = Instance.new("TextButton")
GraphicsTab.Size = UDim2.new(1, -20, 0, 60)
GraphicsTab.Position = UDim2.new(0, 10, 0, 20)
GraphicsTab.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
GraphicsTab.Text = "Graphics"
GraphicsTab.TextColor3 = Color3.new(1,1,1)
GraphicsTab.TextScaled = true
GraphicsTab.Font = Enum.Font.GothamSemibold
GraphicsTab.Parent = Sidebar

local VisualTab = Instance.new("TextButton")
VisualTab.Size = UDim2.new(1, -20, 0, 60)
VisualTab.Position = UDim2.new(0, 10, 0, 90)
VisualTab.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
VisualTab.Text = "Visual"
VisualTab.TextColor3 = Color3.new(1,1,1)
VisualTab.TextScaled = true
VisualTab.Font = Enum.Font.GothamSemibold
VisualTab.Parent = Sidebar

local PlayerTab = Instance.new("TextButton")
PlayerTab.Size = UDim2.new(1, -20, 0, 60)
PlayerTab.Position = UDim2.new(0, 10, 0, 160)
PlayerTab.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
PlayerTab.Text = "Player"
PlayerTab.TextColor3 = Color3.new(1,1,1)
PlayerTab.TextScaled = true
PlayerTab.Font = Enum.Font.GothamSemibold
PlayerTab.Parent = Sidebar

-- Contents
local GraphicsContent = Instance.new("ScrollingFrame")
GraphicsContent.Size = UDim2.new(1, -20, 1, -20)
GraphicsContent.Position = UDim2.new(0, 10, 0, 10)
GraphicsContent.BackgroundTransparency = 1
GraphicsContent.ScrollBarThickness = 6
GraphicsContent.Visible = true
GraphicsContent.Parent = ContentArea

local VisualContent = Instance.new("Frame")
VisualContent.Size = UDim2.new(1, -20, 1, -20)
VisualContent.Position = UDim2.new(0, 10, 0, 10)
VisualContent.BackgroundTransparency = 1
VisualContent.Visible = false
VisualContent.Parent = ContentArea

local PlayerContent = Instance.new("Frame")
PlayerContent.Size = UDim2.new(1, -20, 1, -20)
PlayerContent.Position = UDim2.new(0, 10, 0, 10)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Visible = false
PlayerContent.Parent = ContentArea

-- ==================== TAB SWITCHING ====================
local function switchTab(tab)
    GraphicsContent.Visible = (tab == GraphicsTab)
    VisualContent.Visible = (tab == VisualTab)
    PlayerContent.Visible = (tab == PlayerTab)
    
    GraphicsTab.BackgroundColor3 = (tab == GraphicsTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
    VisualTab.BackgroundColor3 = (tab == VisualTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
    PlayerTab.BackgroundColor3 = (tab == PlayerTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
end

GraphicsTab.MouseButton1Click:Connect(function() switchTab(GraphicsTab) end)
VisualTab.MouseButton1Click:Connect(function() switchTab(VisualTab) end)
PlayerTab.MouseButton1Click:Connect(function() switchTab(PlayerTab) end)

-- ==================== BUTTONS AND FUNCTIONS ====================

-- VFX Remover
local vfxEnabled = false
local vfxConnection = nil

local function destroyVFX(obj)
    pcall(function()
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            obj.Enabled = false
            if obj:IsA("ParticleEmitter") then
                obj.Rate = 0
                obj.Size = NumberSequence.new(0)
            end
        end
    end)
end

local VFXButton = Instance.new("TextButton")
VFXButton.Size = UDim2.new(1, -20, 0, 65)
VFXButton.Position = UDim2.new(0, 10, 0, 10)
VFXButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
VFXButton.Text = "VFX Remover"
VFXButton.TextColor3 = Color3.new(1,1,1)
VFXButton.TextScaled = true
VFXButton.Font = Enum.Font.GothamSemibold
VFXButton.Parent = GraphicsContent

VFXButton.MouseButton1Click:Connect(function()
    vfxEnabled = not vfxEnabled
    if vfxEnabled then
        VFXButton.Text = "VFX Remover: ON"
        VFXButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        for _, v in ipairs(workspace:GetDescendants()) do destroyVFX(v) end
        vfxConnection = game.DescendantAdded:Connect(function(d) task.defer(destroyVFX, d) end)
    else
        VFXButton.Text = "VFX Remover"
        VFXButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        if vfxConnection then vfxConnection:Disconnect() end
    end
end)

-- FPS Booster
local fpsBoostEnabled = false

local FPSButton = Instance.new("TextButton")
FPSButton.Size = UDim2.new(1, -20, 0, 65)
FPSButton.Position = UDim2.new(0, 10, 0, 85)
FPSButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
FPSButton.Text = "FPS Booster"
FPSButton.TextColor3 = Color3.new(1,1,1)
FPSButton.TextScaled = true
FPSButton.Font = Enum.Font.GothamSemibold
FPSButton.Parent = GraphicsContent

FPSButton.MouseButton1Click:Connect(function()
    fpsBoostEnabled = not fpsBoostEnabled
    if fpsBoostEnabled then
        FPSButton.Text = "FPS Booster: ON"
        FPSButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                    if not obj:GetAttribute("SavedColor") then
                        obj:SetAttribute("SavedColor", obj.Color)
                        obj:SetAttribute("SavedMaterial", obj.Material.Name)
                    end
                    obj.Material = Enum.Material.Plastic
                    obj.Color = Color3.fromRGB(85, 85, 85)
                end
            end)
        end
    else
        FPSButton.Text = "FPS Booster"
        FPSButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                    local c = obj:GetAttribute("SavedColor")
                    local m = obj:GetAttribute("SavedMaterial")
                    if c then obj.Color = c end
                    if m then obj.Material = Enum.Material[m] end
                end
            end)
        end
    end
end)

-- ESP
local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.9, 0, 0, 70)
ESPButton.Position = UDim2.new(0.05, 0, 0, 30)
ESPButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
ESPButton.Text = "ESP Box"
ESPButton.TextColor3 = Color3.new(1,1,1)
ESPButton.TextScaled = true
ESPButton.Font = Enum.Font.GothamSemibold
ESPButton.Parent = VisualContent

local ESPEnabled = false
local ESPObjects = {}

local function toggleESP()
    ESPEnabled = not ESPEnabled
    if ESPEnabled then
        ESPButton.Text = "ESP Box: ON"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local box = Instance.new("BoxHandleAdornment")
                box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
                box.Size = Vector3.new(4,6,2)
                box.AlwaysOnTop = true
                box.Transparency = 0.4
                box.Color3 = Color3.fromRGB(255, 0, 100)
                box.Parent = plr.Character
                ESPObjects[plr] = box
            end
        end
    else
        ESPButton.Text = "ESP Box"
        ESPButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        for _, box in pairs(ESPObjects) do box:Destroy() end
        ESPObjects = {}
    end
end

ESPButton.MouseButton1Click:Connect(toggleESP)

-- Speed Hack
local speedEnabled = false
local currentSpeed = 50

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(0.9, 0, 0, 70)
SpeedToggle.Position = UDim2.new(0.05, 0, 0, 30)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
SpeedToggle.Text = "Speed Hack: OFF"
SpeedToggle.TextColor3 = Color3.new(1,1,1)
SpeedToggle.TextScaled = true
SpeedToggle.Font = Enum.Font.GothamSemibold
SpeedToggle.Parent = PlayerContent

SpeedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedToggle.Text = speedEnabled and "Speed Hack: ON" or "Speed Hack: OFF"
    SpeedToggle.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 220, 100) or Color3.fromRGB(0, 180, 80)
    
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speedEnabled and currentSpeed or 16
    end
end)

-- Right Control + Drag
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Drag
local dragging = false
local dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

print("✅ Dayı Hub v7.3 - Still İn Progress!")
