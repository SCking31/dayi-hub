-- =============================================
-- Dayı Script Hub v7.6 - Smooth Open Animation
-- =============================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DayiScriptHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 100, 0, 80) -- Animasyon için küçük başla
MainFrame.Position = UDim2.new(0.5, -50, 0.5, -40)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 1
MainFrame.Visible = true
MainFrame.Parent = ScreenGui
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame
-- TitleBar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 25, 110)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "🔥 DAYI SCRIPT HUB v7.6"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TitleBar
-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 170, 1, -60)
Sidebar.Position = UDim2.new(0, 0, 0, 60)
Sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame
-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -170, 1, -60)
ContentArea.Position = UDim2.new(0, 170, 0, 60)
ContentArea.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
ContentArea.BackgroundTransparency = 1
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
-- Tab Switching
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
-- ==================== SMOOTH AÇILIŞ ANIMASYONU ====================
local function openAnimation()
    local tweenInfo = TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
   
    TweenService:Create(MainFrame, tweenInfo, {
        Size = UDim2.new(0, 640, 0, 600),
        Position = UDim2.new(0.5, -320, 0.5, -300),
        BackgroundTransparency = 0
    }):Play()
   
    TweenService:Create(TitleBar, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(Sidebar, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(ContentArea, tweenInfo, {BackgroundTransparency = 0}):Play()
end
task.wait(0.1)
openAnimation()
-- ==================== VFX REMOVER ====================
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
-- ==================== FPS BOOSTER ====================
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
-- ==================== ESP ====================
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
-- ==================== REWORKED SPEED SLIDER ====================
local speedEnabled = false
local currentSpeed = 50
local maxSpeed = 200
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
SpeedValueLabel.Text = "Hız: 50"
SpeedValueLabel.TextColor3 = Color3.new(1,1,1)
SpeedValueLabel.TextScaled = true
SpeedValueLabel.Font = Enum.Font.GothamSemibold
SpeedValueLabel.Parent = PlayerContent
local SliderBG = Instance.new("Frame")
SliderBG.Size = UDim2.new(0.9, 0, 0, 12)
SliderBG.Position = UDim2.new(0.05, 0, 0, 110)
SliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SliderBG.Parent = PlayerContent
local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(1, 0)
SliderCorner.Parent = SliderBG
local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0.25, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SliderFill.Parent = SliderBG
local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = SliderFill
local SliderKnob = Instance.new("TextButton")
SliderKnob.Size = UDim2.new(0, 20, 0, 20)
SliderKnob.Position = UDim2.new(0.25, -10, 0.5, -10)
SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderKnob.Text = ""
SliderKnob.Parent = SliderBG
local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = SliderKnob
local function updateSlider()
    local percentage = (currentSpeed - 16) / (maxSpeed - 16)
    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
    SliderKnob.Position = UDim2.new(percentage, -10, 0.5, -10)
    SpeedValueLabel.Text = "Hız: " .. math.floor(currentSpeed)
end
local draggingSlider = false
SliderKnob.MouseButton1Down:Connect(function() draggingSlider = true end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mouseX = input.Position.X
        local sliderPos = SliderBG.AbsolutePosition.X
        local sliderWidth = SliderBG.AbsoluteSize.X
      
        local percentage = math.clamp((mouseX - sliderPos) / sliderWidth, 0, 1)
        currentSpeed = math.floor(16 + (maxSpeed - 16) * percentage)
        updateSlider()
      
        if speedEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = currentSpeed
        end
    end
end)
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(0.9, 0, 0, 70)
SpeedToggle.Position = UDim2.new(0.05, 0, 0, 150)
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
player.CharacterAdded:Connect(function()
    task.wait(1)
    if speedEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = currentSpeed
    end
end)
-- ==================== EXTRA ====================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
-- Sürükleme
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
print("✅ Dayı Hub v7.6 - Smooth Animation Yüklendi!")
