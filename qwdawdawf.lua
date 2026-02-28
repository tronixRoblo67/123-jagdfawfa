local Library = {}

function Library:CreateWindow()

    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")

    local player = Players.LocalPlayer

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UiOwner"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    --================ WATERMARK =================--

    local Watermark = Instance.new("Frame")
    Watermark.Size = UDim2.new(0.28, 0, 0.055, 0)
    Watermark.Position = UDim2.new(0.5, 0, 0.02, 0)
    Watermark.AnchorPoint = Vector2.new(0.5, 0)
    Watermark.BackgroundColor3 = Color3.fromRGB(0,0,0)
    Watermark.BackgroundTransparency = 0.15
    Watermark.Parent = ScreenGui

    Instance.new("UICorner", Watermark).CornerRadius = UDim.new(1,0)

    local WMStroke = Instance.new("UIStroke")
    WMStroke.Color = Color3.fromRGB(255,255,255)
    WMStroke.Transparency = 0.6
    WMStroke.Parent = Watermark

    local WMText = Instance.new("TextLabel")
    WMText.Size = UDim2.new(1,-20,1,0)
    WMText.Position = UDim2.new(0,10,0,0)
    WMText.BackgroundTransparency = 1
    WMText.TextScaled = true
    WMText.Font = Enum.Font.GothamBold
    WMText.TextColor3 = Color3.fromRGB(255,255,255)
    WMText.Parent = Watermark

    local fps = 0
    local frames = 0
    local last = tick()

    RunService.RenderStepped:Connect(function()
        frames += 1
        if tick() - last >= 1 then
            fps = frames
            frames = 0
            last = tick()
        end

        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        WMText.Text = "Name: "..player.Name.." | FPS: "..fps.." | Ping: "..ping.."ms"
    end)

    --================ WINDOW =================--

    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0.74, 0, 0.674, 0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.BackgroundTransparency = 1
    Window.Visible = false
    Window.Parent = ScreenGui

    Instance.new("UICorner", Window).CornerRadius = UDim.new(0,20)

    local Opened = false

    UIS.InputBegan:Connect(function(input,gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightControl then
            Opened = not Opened

            if Opened then
                Window.Visible = true
                Window.Size = UDim2.new(0,0,0,0)
                TweenService:Create(Window,
                    TweenInfo.new(0.25,Enum.EasingStyle.Quad),
                    {Size = UDim2.new(0.74,0,0.674,0)}
                ):Play()
            else
                local t = TweenService:Create(Window,
                    TweenInfo.new(0.2),
                    {Size = UDim2.new(0,0,0,0)}
                )
                t:Play()
                t.Completed:Wait()
                Window.Visible = false
            end
        end
    end)

    --================ TITLE =================--

    local title = Instance.new("Frame")
    title.Size = UDim2.new(0.234, 0, 0.166, 0)
    title.Position = UDim2.new(0, 0, 0.018, 0)
    title.BackgroundColor3 = Color3.fromRGB(255,255,255)
    title.BackgroundTransparency = 0.3
    title.Parent = Window

    Instance.new("UICorner",title).CornerRadius = UDim.new(0,8)

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255,255,255)
    Stroke.Thickness = 1.5
    Stroke.Parent = title

    local TitleText = Instance.new("TextLabel")
    TitleText.Text = "LightVisuals"
    TitleText.Size = UDim2.new(0,145,0,40)
    TitleText.Position = UDim2.new(-0.007,0,0,0)
    TitleText.BackgroundTransparency = 1
    TitleText.TextScaled = true
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextColor3 = Color3.fromRGB(0,0,0)
    TitleText.Parent = title

    local VersionText = Instance.new("TextLabel")
    VersionText.Text = "v0.0.1"
    VersionText.Size = UDim2.new(0,146,0,37)
    VersionText.Position = UDim2.new(-0.007,0,0.519,0)
    VersionText.BackgroundTransparency = 1
    VersionText.TextScaled = true
    VersionText.Font = Enum.Font.GothamBold
    VersionText.TextColor3 = Color3.fromRGB(0,0,0)
    VersionText.Parent = title

    --================ TABS =================--

    local Tabs = Instance.new("Frame")
    Tabs.Size = UDim2.new(0.234, 0, 0.774, 0)
    Tabs.Position = UDim2.new(0, 0, 0.199, 0)
    Tabs.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Tabs.BackgroundTransparency = 0.3
    Tabs.Parent = Window

    Instance.new("UICorner",Tabs).CornerRadius = UDim.new(0,8)

    local Stroke2 = Instance.new("UIStroke")
    Stroke2.Color = Color3.fromRGB(255,255,255)
    Stroke2.Thickness = 1.5
    Stroke2.Parent = Tabs

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Size = UDim2.new(0.938,0,0.965,0)
    TabsHolder.Position = UDim2.new(0.029,0,0.017,0)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Tabs

    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.Padding = UDim.new(0,8)
    TabsLayout.Parent = TabsHolder

    --================ CONTENT =================--

    local TabConteiner = Instance.new("Frame")
    TabConteiner.Size = UDim2.new(0.732,0,0.955,0)
    TabConteiner.Position = UDim2.new(0.244,0,0.018,0)
    TabConteiner.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TabConteiner.BackgroundTransparency = 0.3
    TabConteiner.Parent = Window

    Instance.new("UICorner",TabConteiner).CornerRadius = UDim.new(0,8)

    local Stroke3 = Instance.new("UIStroke")
    Stroke3.Color = Color3.fromRGB(255,255,255)
    Stroke3.Thickness = 1.5
    Stroke3.Parent = TabConteiner

    local WindowFunctions = {}
    local FirstTab = true

    function WindowFunctions:CreateTab(name)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1,0,0.158,0)
        TabButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TabButton.BackgroundTransparency = 0.3
        TabButton.Text = name
        TabButton.TextScaled = true
        TabButton.Font = Enum.Font.GothamBold
        TabButton.TextColor3 = Color3.fromRGB(0,0,0)
        TabButton.Parent = TabsHolder

        Instance.new("UICorner",TabButton).CornerRadius = UDim.new(0,8)

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = TabConteiner

        if FirstTab then
            Page.Visible = true
            FirstTab = false
        end

        TabButton.MouseButton1Click:Connect(function()
            for _,v in pairs(TabConteiner:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
        end)

        return {}
    end

    return WindowFunctions
end

return Library
