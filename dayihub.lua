-- =============================================
-- Dayı Script Hub v9.7 - Skeleton Fix
-- =============================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DayiScriptHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 640, 0, 620)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -310)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
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

-- Tablar
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

local CreditTab = Instance.new("TextButton")
CreditTab.Size = UDim2.new(1, -20, 0, 60)
CreditTab.Position = UDim2.new(0, 10, 0, 230)
CreditTab.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
CreditTab.Text = "Credits"
CreditTab.TextColor3 = Color3.new(1,1,1)
CreditTab.TextScaled = true
CreditTab.Font = Enum.Font.GothamSemibold
CreditTab.Parent = Sidebar

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

local CreditContent = Instance.new("Frame")
CreditContent.Size = UDim2.new(1, -20, 1, -20)
CreditContent.Position = UDim2.new(0, 10, 0, 10)
CreditContent.BackgroundTransparency = 1
CreditContent.Visible = false
CreditContent.Parent = ContentArea

-- Tab Switching
local function switchTab(tab)
    GraphicsContent.Visible = (tab == GraphicsTab)
    VisualContent.Visible = (tab == VisualTab)
    PlayerContent.Visible = (tab == PlayerTab)
    CreditContent.Visible = (tab == CreditTab)
    
    GraphicsTab.BackgroundColor3 = (tab == GraphicsTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
    VisualTab.BackgroundColor3 = (tab == VisualTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
    PlayerTab.BackgroundColor3 = (tab == PlayerTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
    CreditTab.BackgroundColor3 = (tab == CreditTab) and Color3.fromRGB(70,70,80) or Color3.fromRGB(35,35,40)
end

GraphicsTab.MouseButton1Click:Connect(function() switchTab(GraphicsTab) end)
VisualTab.MouseButton1Click:Connect(function() switchTab(VisualTab) end)
PlayerTab.MouseButton1Click:Connect(function() switchTab(PlayerTab) end)
CreditTab.MouseButton1Click:Connect(function() switchTab(CreditTab) end)

-- ==================== GRAPHICS ====================
local UnlimitedZoomButton = Instance.new("TextButton")
UnlimitedZoomButton.Size = UDim2.new(1, -20, 0, 65)
UnlimitedZoomButton.Position = UDim2.new(0, 10, 0, 10)
UnlimitedZoomButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
UnlimitedZoomButton.Text = "Unlimited Zoom"
UnlimitedZoomButton.TextColor3 = Color3.new(1,1,1)
UnlimitedZoomButton.TextScaled = true
UnlimitedZoomButton.Font = Enum.Font.GothamSemibold
UnlimitedZoomButton.Parent = GraphicsContent

local zoomEnabled = false
local originalMinZoom = nil
local originalMaxZoom = nil

UnlimitedZoomButton.MouseButton1Click:Connect(function()
    zoomEnabled = not zoomEnabled
    local camera = workspace.CurrentCamera
    if zoomEnabled then
        UnlimitedZoomButton.Text = "Unlimited Zoom: ON"
        UnlimitedZoomButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        originalMinZoom = camera.MinZoom
        originalMaxZoom = camera.MaxZoom
        camera.MinZoom = 0.1
        camera.MaxZoom = 10000
    else
        UnlimitedZoomButton.Text = "Unlimited Zoom"
        UnlimitedZoomButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        if originalMinZoom then camera.MinZoom = originalMinZoom end
        if originalMaxZoom then camera.MaxZoom = originalMaxZoom end
    end
end)

local VFXButton = Instance.new("TextButton")
VFXButton.Size = UDim2.new(1, -20, 0, 65)
VFXButton.Position = UDim2.new(0, 10, 0, 85)
VFXButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
VFXButton.Text = "VFX Remover"
VFXButton.TextColor3 = Color3.new(1,1,1)
VFXButton.TextScaled = true
VFXButton.Font = Enum.Font.GothamSemibold
VFXButton.Parent = GraphicsContent

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

local FPSButton = Instance.new("TextButton")
FPSButton.Size = UDim2.new(1, -20, 0, 65)
FPSButton.Position = UDim2.new(0, 10, 0, 160)
FPSButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
FPSButton.Text = "FPS Booster"
FPSButton.TextColor3 = Color3.new(1,1,1)
FPSButton.TextScaled = true
FPSButton.Font = Enum.Font.GothamSemibold
FPSButton.Parent = GraphicsContent

local fpsBoostEnabled = false
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

-- ==================== VISUAL ====================
local WallhackButton = Instance.new("TextButton")
WallhackButton.Size = UDim2.new(0.9, 0, 0, 50)
WallhackButton.Position = UDim2.new(0.05, 0, 0, 30)
WallhackButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
WallhackButton.Text = "Wallhack ESP"
WallhackButton.TextColor3 = Color3.new(1,1,1)
WallhackButton.TextScaled = true
WallhackButton.Font = Enum.Font.GothamSemibold
WallhackButton.Parent = VisualContent

local SkeletonButton = Instance.new("TextButton")
SkeletonButton.Size = UDim2.new(0.9, 0, 0, 50)
SkeletonButton.Position = UDim2.new(0.05, 0, 0, 90)
SkeletonButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
SkeletonButton.Text = "Skeleton ESP"
SkeletonButton.TextColor3 = Color3.new(1,1,1)
SkeletonButton.TextScaled = true
SkeletonButton.Font = Enum.Font.GothamSemibold
SkeletonButton.Parent = VisualContent

local ESPEnabled = false
local SkeletonEnabled = false
local ESPColor = Color3.fromRGB(255, 0, 100)
local ESPObjects = {}
local SkeletonObjects = {}

local function createWallhackESP(plr)
    if plr == player or not plr.Character then return end
    local root = plr.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = root
    box.Size = Vector3.new(4,6,2)
    box.AlwaysOnTop = true
    box.Transparency = 0.3
    box.Color3 = ESPColor
    box.ZIndex = 10
    box.Parent = root
    
    ESPObjects[plr] = box
end

local function createSkeletonESP(plr)
    if plr == player or not plr.Character then return end
    local character = plr.Character
    if SkeletonObjects[plr] then SkeletonObjects[plr]:Destroy() end
    
    local skeleton = Instance.new("Model")
    skeleton.Name = "SkeletonESP"
    skeleton.Parent = character
    
    local limbs = {
        {"Head", "UpperTorso"},
        {"UpperTorso", "LowerTorso"},
        {"UpperTorso", "LeftUpperArm"},
        {"LeftUpperArm", "LeftLowerArm"},
        {"LeftLowerArm", "LeftHand"},
        {"UpperTorso", "RightUpperArm"},
        {"RightUpperArm", "RightLowerArm"},
        {"RightLowerArm", "RightHand"},
        {"LowerTorso", "LeftUpperLeg"},
        {"LeftUpperLeg", "LeftLowerLeg"},
        {"LeftLowerLeg", "LeftFoot"},
        {"LowerTorso", "RightUpperLeg"},
        {"RightUpperLeg", "RightLowerLeg"},
        {"RightLowerLeg", "RightFoot"}
    }
    
    for _, pair in ipairs(limbs) do
        local part1 = character:FindFirstChild(pair[1])
        local part2 = character:FindFirstChild(pair[2])
        if part1 and part2 then
            local line = Instance.new("LineHandleAdornment")
            line.Adornee = part1
            line.Attachment0 = Instance.new("Attachment", part1)
            line.Attachment1 = Instance.new("Attachment", part2)
            line.Color3 = ESPColor
            line.Thickness = 3
            line.Transparency = 0.3
            line.Parent = skeleton
        end
    end
    
    SkeletonObjects[plr] = skeleton
end

local function toggleWallhack()
    ESPEnabled = not ESPEnabled
    if ESPEnabled then
        WallhackButton.Text = "Wallhack ESP: ON"
        WallhackButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        for _, plr in ipairs(Players:GetPlayers()) do
            createWallhackESP(plr)
        end
    else
        WallhackButton.Text = "Wallhack ESP"
        WallhackButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        for _, box in pairs(ESPObjects) do box:Destroy() end
        ESPObjects = {}
    end
end

local function toggleSkeleton()
    SkeletonEnabled = not SkeletonEnabled
    if SkeletonEnabled then
        SkeletonButton.Text = "Skeleton ESP: ON"
        SkeletonButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        for _, plr in ipairs(Players:GetPlayers()) do
            createSkeletonESP(plr)
        end
    else
        SkeletonButton.Text = "Skeleton ESP"
        SkeletonButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        for _, skeleton in pairs(SkeletonObjects) do skeleton:Destroy() end
        SkeletonObjects = {}
    end
end

WallhackButton.MouseButton1Click:Connect(toggleWallhack)
SkeletonButton.MouseButton1Click:Connect(toggleSkeleton)

-- ==================== AIMBOT + CIRCLE ====================
local AimbotButton = Instance.new("TextButton")
AimbotButton.Size = UDim2.new(0.9, 0, 0, 50)
AimbotButton.Position = UDim2.new(0.05, 0, 0, 160)
AimbotButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
AimbotButton.Text = "Aimbot: OFF"
AimbotButton.TextColor3 = Color3.new(1,1,1)
AimbotButton.TextScaled = true
AimbotButton.Font = Enum.Font.GothamSemibold
AimbotButton.Parent = VisualContent

local MobileAimbotButton = Instance.new("TextButton")
MobileAimbotButton.Size = UDim2.new(0.9, 0, 0, 50)
MobileAimbotButton.Position = UDim2.new(0.05, 0, 0, 220)
MobileAimbotButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
MobileAimbotButton.Text = "Mobile Aimbot: OFF"
MobileAimbotButton.TextColor3 = Color3.new(1,1,1)
MobileAimbotButton.TextScaled = true
MobileAimbotButton.Font = Enum.Font.GothamSemibold
MobileAimbotButton.Parent = VisualContent

local KeybindButton = Instance.new("TextButton")
KeybindButton.Size = UDim2.new(0.9, 0, 0, 40)
KeybindButton.Position = UDim2.new(0.05, 0, 0, 280)
KeybindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
KeybindButton.Text = "Bind Key (None)"
KeybindButton.TextColor3 = Color3.new(1,1,1)
KeybindButton.TextScaled = true
KeybindButton.Font = Enum.Font.GothamSemibold
KeybindButton.Parent = VisualContent

local TargetButton = Instance.new("TextButton")
TargetButton.Size = UDim2.new(0.9, 0, 0, 40)
TargetButton.Position = UDim2.new(0.05, 0, 0, 330)
TargetButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
TargetButton.Text = "Target: Head"
TargetButton.TextColor3 = Color3.new(1,1,1)
TargetButton.TextScaled = true
TargetButton.Font = Enum.Font.GothamSemibold
TargetButton.Parent = VisualContent

local ShowCircleButton = Instance.new("TextButton")
ShowCircleButton.Size = UDim2.new(0.9, 0, 0, 40)
ShowCircleButton.Position = UDim2.new(0.05, 0, 0, 380)
ShowCircleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
ShowCircleButton.Text = "Show Circle: ON"
ShowCircleButton.TextColor3 = Color3.new(1,1,1)
ShowCircleButton.TextScaled = true
ShowCircleButton.Font = Enum.Font.GothamSemibold
ShowCircleButton.Parent = VisualContent

local CircleColorButton = Instance.new("TextButton")
CircleColorButton.Size = UDim2.new(0.9, 0, 0, 40)
CircleColorButton.Position = UDim2.new(0.05, 0, 0, 430)
CircleColorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 100)
CircleColorButton.Text = "Circle Color"
CircleColorButton.TextColor3 = Color3.new(0,0,0)
CircleColorButton.TextScaled = true
CircleColorButton.Font = Enum.Font.GothamSemibold
CircleColorButton.Parent = VisualContent

-- Circle Slider
local CircleTitle = Instance.new("TextLabel")
CircleTitle.Size = UDim2.new(0.9, 0, 0, 30)
CircleTitle.Position = UDim2.new(0.05, 0, 0, 480)
CircleTitle.BackgroundTransparency = 1
CircleTitle.Text = "Circle Radius: 150"
CircleTitle.TextColor3 = Color3.new(1,1,1)
CircleTitle.TextScaled = true
CircleTitle.Font = Enum.Font.GothamSemibold
CircleTitle.Parent = VisualContent

local CircleSliderBG = Instance.new("Frame")
CircleSliderBG.Size = UDim2.new(0.9, 0, 0, 14)
CircleSliderBG.Position = UDim2.new(0.05, 0, 0, 520)
CircleSliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
CircleSliderBG.Parent = VisualContent

local CircleSliderCorner = Instance.new("UICorner")
CircleSliderCorner.CornerRadius = UDim.new(1, 0)
CircleSliderCorner.Parent = CircleSliderBG

local CircleSliderFill = Instance.new("Frame")
CircleSliderFill.Size = UDim2.new(0.5, 0, 1, 0)
CircleSliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
CircleSliderFill.Parent = CircleSliderBG

local CircleSliderKnob = Instance.new("TextButton")
CircleSliderKnob.Size = UDim2.new(0, 22, 0, 22)
CircleSliderKnob.Position = UDim2.new(0.5, -11, 0.5, -11)
CircleSliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CircleSliderKnob.Text = ""
CircleSliderKnob.Parent = CircleSliderBG

local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = CircleSliderKnob

local fovRadius = 150
local showCircle = true
local circleColor = Color3.fromRGB(255, 255, 100)
local draggingCircle = false

-- Circle Drawing
local circleDrawing = Drawing.new("Circle")
circleDrawing.Thickness = 1.5
circleDrawing.NumSides = 64
circleDrawing.Radius = fovRadius
circleDrawing.Color = circleColor
circleDrawing.Transparency = 0.7
circleDrawing.Filled = false
circleDrawing.Visible = showCircle

local function updateCirclePosition()
    local camera = workspace.CurrentCamera
    circleDrawing.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
end

local function updateCircleSlider()
    local percent = (fovRadius - 50) / (400 - 50)
    CircleSliderFill.Size = UDim2.new(percent, 0, 1, 0)
    CircleSliderKnob.Position = UDim2.new(percent, -11, 0.5, -11)
    CircleTitle.Text = "Circle Radius: " .. math.floor(fovRadius)
    circleDrawing.Radius = fovRadius
end

CircleSliderKnob.MouseButton1Down:Connect(function() draggingCircle = true end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingCircle = false end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingCircle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mouseX = input.Position.X
        local sliderX = CircleSliderBG.AbsolutePosition.X
        local sliderW = CircleSliderBG.AbsoluteSize.X
        local percent = math.clamp((mouseX - sliderX) / sliderW, 0, 1)
        fovRadius = math.floor(50 + (400 - 50) * percent)
        updateCircleSlider()
    end
end)

-- Show Circle
ShowCircleButton.MouseButton1Click:Connect(function()
    showCircle = not showCircle
    circleDrawing.Visible = showCircle
    if showCircle then
        ShowCircleButton.Text = "Show Circle: ON"
        ShowCircleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
    else
        ShowCircleButton.Text = "Show Circle: OFF"
        ShowCircleButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    end
end)

-- Circle Color
local circleColors = {
    {name = "Yellow", color = Color3.fromRGB(255, 255, 100)},
    {name = "Red", color = Color3.fromRGB(255, 50, 50)},
    {name = "Cyan", color = Color3.fromRGB(0, 255, 255)},
    {name = "Purple", color = Color3.fromRGB(180, 0, 255)},
    {name = "White", color = Color3.fromRGB(255, 255, 255)}
}

local currentCircleColorIndex = 1

CircleColorButton.MouseButton1Click:Connect(function()
    currentCircleColorIndex = currentCircleColorIndex % #circleColors + 1
    circleColor = circleColors[currentCircleColorIndex].color
    CircleColorButton.Text = "Circle Color (" .. circleColors[currentCircleColorIndex].name .. ")"
    CircleColorButton.BackgroundColor3 = circleColor
    circleDrawing.Color = circleColor
end)

-- Aimbot Değişkenleri
local aimbotEnabled = false
local mobileAimbotEnabled = false
local aimbotKey = nil
local isAimbotKeyPressed = false
local binding = false
local aimbotTarget = "Head"

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        AimbotButton.Text = "Aimbot: ON"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
    else
        AimbotButton.Text = "Aimbot: OFF"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end

local function toggleMobileAimbot()
    mobileAimbotEnabled = not mobileAimbotEnabled
    if mobileAimbotEnabled then
        MobileAimbotButton.Text = "Mobile Aimbot: ON"
        MobileAimbotButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
    else
        MobileAimbotButton.Text = "Mobile Aimbot: OFF"
        MobileAimbotButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end

AimbotButton.MouseButton1Click:Connect(toggleAimbot)
MobileAimbotButton.MouseButton1Click:Connect(toggleMobileAimbot)

-- Tuş Atama
KeybindButton.MouseButton1Click:Connect(function()
    binding = true
    KeybindButton.Text = "Press Any Key..."
    KeybindButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if binding then
        aimbotKey = input.KeyCode
        KeybindButton.Text = "Key: " .. input.KeyCode.Name
        KeybindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        binding = false
        return
    end
    
    if input.KeyCode == aimbotKey then
        isAimbotKeyPressed = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == aimbotKey then
        isAimbotKeyPressed = false
    end
end)

-- Hedef Değiştir
TargetButton.MouseButton1Click:Connect(function()
    if aimbotTarget == "Head" then
        aimbotTarget = "HumanoidRootPart"
        TargetButton.Text = "Target: Body"
    else
        aimbotTarget = "Head"
        TargetButton.Text = "Target: Head"
    end
end)

-- Aimbot + Circle
RunService.Heartbeat:Connect(function()
    updateCirclePosition()
    
    local isAimbotActive = (aimbotEnabled and isAimbotKeyPressed) or mobileAimbotEnabled
    if not isAimbotActive then return end
    
    local camera = workspace.CurrentCamera
    local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    local closest = nil
    local shortestDistance = math.huge
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local targetPart = plr.Character:FindFirstChild(aimbotTarget)
            if targetPart then
                local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local distanceFromCenter = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                    if distanceFromCenter <= fovRadius then
                        local distance = (targetPart.Position - myRoot.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closest = targetPart
                        end
                    end
                end
            end
        end
    end
    
    if closest then
        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, closest.Position)
    end
end)

-- ==================== PLAYER ====================
local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Size = UDim2.new(0.9, 0, 0, 40)
SpeedTitle.Position = UDim2.new(0.05, 0, 0, 20)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "Speed Hack"
SpeedTitle.TextColor3 = Color3.new(1,1,1)
SpeedTitle.TextScaled = true
SpeedTitle.Font = Enum.Font.GothamBold
SpeedTitle.Parent = PlayerContent

local SpeedValueLabel = Instance.new("TextLabel")
SpeedValueLabel.Size = UDim2.new(0.9, 0, 0, 30)
SpeedValueLabel.Position = UDim2.new(0.05, 0, 0, 70)
SpeedValueLabel.BackgroundTransparency = 1
SpeedValueLabel.Text = "Speed: 50"
SpeedValueLabel.TextColor3 = Color3.new(1,1,1)
SpeedValueLabel.TextScaled = true
SpeedValueLabel.Font = Enum.Font.GothamSemibold
SpeedValueLabel.Parent = PlayerContent

local SliderBG = Instance.new("Frame")
SliderBG.Size = UDim2.new(0.9, 0, 0, 14)
SliderBG.Position = UDim2.new(0.05, 0, 0, 110)
SliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SliderBG.Parent = PlayerContent

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(1, 0)
SliderCorner.Parent = SliderBG

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0.17, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SliderFill.Parent = SliderBG

local SliderKnob = Instance.new("TextButton")
SliderKnob.Size = UDim2.new(0, 22, 0, 22)
SliderKnob.Position = UDim2.new(0.17, -11, 0.5, -11)
SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderKnob.Text = ""
SliderKnob.Parent = SliderBG

local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = SliderKnob

local draggingSlider = false
local speedEnabled = false
local currentSpeed = 50
local maxSpeed = 200

local function updateSlider()
    local percent = (currentSpeed - 16) / (maxSpeed - 16)
    SliderFill.Size = UDim2.new(percent, 0, 1, 0)
    SliderKnob.Position = UDim2.new(percent, -11, 0.5, -11)
    SpeedValueLabel.Text = "Speed: " .. math.floor(currentSpeed)
end

SliderKnob.MouseButton1Down:Connect(function() draggingSlider = true end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mouseX = input.Position.X
        local sliderX = SliderBG.AbsolutePosition.X
        local sliderW = SliderBG.AbsoluteSize.X
        local percent = math.clamp((mouseX - sliderX) / sliderW, 0, 1)
        currentSpeed = math.floor(16 + (maxSpeed - 16) * percent)
        updateSlider()
        if speedEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = currentSpeed
        end
    end
end)

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(0.9, 0, 0, 70)
SpeedToggle.Position = UDim2.new(0.05, 0, 0, 160)
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

-- Bunny Hop
local BunnyHopButton = Instance.new("TextButton")
BunnyHopButton.Size = UDim2.new(0.9, 0, 0, 70)
BunnyHopButton.Position = UDim2.new(0.05, 0, 0, 250)
BunnyHopButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
BunnyHopButton.Text = "Bunny Hop"
BunnyHopButton.TextColor3 = Color3.new(1,1,1)
BunnyHopButton.TextScaled = true
BunnyHopButton.Font = Enum.Font.GothamSemibold
BunnyHopButton.Parent = PlayerContent

local bunnyHopEnabled = false

local function toggleBunnyHop()
    bunnyHopEnabled = not bunnyHopEnabled
    if bunnyHopEnabled then
        BunnyHopButton.Text = "Bunny Hop: ON"
        BunnyHopButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
    else
        BunnyHopButton.Text = "Bunny Hop"
        BunnyHopButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    end
end

BunnyHopButton.MouseButton1Click:Connect(toggleBunnyHop)

RunService.Heartbeat:Connect(function()
    if not bunnyHopEnabled then return end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = 19
            humanoid.Jump = true
        end
    end
end)

-- Fly
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0.9, 0, 0, 70)
FlyButton.Position = UDim2.new(0.05, 0, 0, 340)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
FlyButton.Text = "Fly"
FlyButton.TextColor3 = Color3.new(1,1,1)
FlyButton.TextScaled = true
FlyButton.Font = Enum.Font.GothamSemibold
FlyButton.Parent = PlayerContent

local flyEnabled = false
local flyConnection = nil
local bodyVelocity = nil
local bodyGyro = nil

local function toggleFly()
    flyEnabled = not flyEnabled
    if flyEnabled then
        FlyButton.Text = "Fly: ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        
        local character = player.Character
        if not character then return end
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0,0,0)
        bodyVelocity.Parent = root
        
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        bodyGyro.P = 12500
        bodyGyro.Parent = root
        
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flyEnabled or not character or not root then return end
            local camera = workspace.CurrentCamera
            local move = Vector3.new(0,0,0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
            
            bodyVelocity.Velocity = move.Magnitude > 0 and (move.Unit * 50) or Vector3.new(0,0,0)
            bodyGyro.CFrame = camera.CFrame
        end)
    else
        FlyButton.Text = "Fly"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        if flyConnection then flyConnection:Disconnect() end
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
    end
end
FlyButton.MouseButton1Click:Connect(toggleFly)

-- Noclip
local NoclipButton = Instance.new("TextButton")
NoclipButton.Size = UDim2.new(0.9, 0, 0, 70)
NoclipButton.Position = UDim2.new(0.05, 0, 0, 430)
NoclipButton.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
NoclipButton.Text = "Noclip"
NoclipButton.TextColor3 = Color3.new(1,1,1)
NoclipButton.TextScaled = true
NoclipButton.Font = Enum.Font.GothamSemibold
NoclipButton.Parent = PlayerContent

local noclipEnabled = false
local noclipConnection = nil

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipButton.Text = "Noclip: ON"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        
        noclipConnection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        NoclipButton.Text = "Noclip"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
        if noclipConnection then noclipConnection:Disconnect() end
        if player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end
NoclipButton.MouseButton1Click:Connect(toggleNoclip)

-- Credit Tab
local CreditTitle = Instance.new("TextLabel")
CreditTitle.Size = UDim2.new(0.9, 0, 0, 50)
CreditTitle.Position = UDim2.new(0.05, 0, 0, 30)
CreditTitle.BackgroundTransparency = 1
CreditTitle.Text = "Credits"
CreditTitle.TextColor3 = Color3.new(1,1,1)
CreditTitle.TextScaled = true
CreditTitle.Font = Enum.Font.GothamBold
CreditTitle.Parent = CreditContent

local CreditText = Instance.new("TextLabel")
CreditText.Size = UDim2.new(0.9, 0, 0.8, 0)
CreditText.Position = UDim2.new(0.05, 0, 0, 100)
CreditText.BackgroundTransparency = 1
CreditText.Text = "• ekrem_hunter / premium854yagizYL / bruhiammonster\n\n• xsyfix on tiktok and instagram\n\n• wetz'in annesine azıyorum"
CreditText.TextColor3 = Color3.new(1,1,1)
CreditText.TextScaled = true
CreditText.TextWrapped = true
CreditText.Font = Enum.Font.GothamSemibold
CreditText.TextXAlignment = Enum.TextXAlignment.Left
CreditText.Parent = CreditContent

-- ==================== ANIMATION ====================
local function showUI()
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.BackgroundTransparency = 1
    
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 640, 0, 620), BackgroundTransparency = 0}):Play()
end

local function hideUI()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local tween = TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
    tween:Play()
    tween.Completed:Connect(function()
        MainFrame.Visible = false
    end)
end

-- Right Control Toggle
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if MainFrame.Visible then
            hideUI()
        else
            showUI()
        end
    end
end)

-- Initial Show
task.wait(0.5)
showUI()

-- Right Control + Sürükleme
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

print("✅ Dayı Hub v9.7 - Skeleton ESP Düzeltildi!")
