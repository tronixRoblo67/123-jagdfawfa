local Library = {}

function Library:CreateWindow()

    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local player = Players.LocalPlayer

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UiOwner"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    --// WATERMARK (Dynamic Island Style)

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local Watermark = Instance.new("Frame")
Watermark.Size = UDim2.new(0, 220, 0, 36)
Watermark.Position = UDim2.new(0.5, 0, 0, 8)
Watermark.AnchorPoint = Vector2.new(0.5, 0)
Watermark.BackgroundColor3 = Color3.fromRGB(255,255,255)
Watermark.BackgroundTransparency = 0.25
Watermark.Parent = ScreenGui

Instance.new("UICorner", Watermark).CornerRadius = UDim.new(1,0)

local WMStroke = Instance.new("UIStroke")
WMStroke.Color = Color3.fromRGB(255,255,255)
WMStroke.Thickness = 1.5
WMStroke.Parent = Watermark

local WMText = Instance.new("TextLabel")
WMText.Size = UDim2.new(1, -10, 1, 0)
WMText.Position = UDim2.new(0, 5, 0, 0)
WMText.BackgroundTransparency = 1
WMText.Font = Enum.Font.GothamBold
WMText.TextScaled = true
WMText.TextColor3 = Color3.fromRGB(0,0,0)
WMText.Text = "FPS: 0 | Ping: 0"
WMText.Parent = Watermark

-- FPS Counter
local frames = 0
local lastTime = tick()
local fps = 0

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = tick()
    end
end)

-- Update Text
RunService.Heartbeat:Connect(function()
    local ping = 0
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)

    WMText.Text = "FPS: "..fps.."  |  Ping: "..ping
end)

    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0.74, 0, 0.674, 0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.BackgroundTransparency = 1
    Window.Visible = false
    Window.Parent = ScreenGui

    Instance.new("UICorner", Window).CornerRadius = UDim.new(0,20)

    -- OPEN / CLOSE WITH RIGHT CTRL
    local Opened = false

    UIS.InputBegan:Connect(function(input,gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightControl then
            Opened = not Opened

            if Opened then
                Window.Visible = true
                Window.Size = UDim2.new(0,0,0,0)

                TweenService:Create(Window,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                    Size = UDim2.new(0.74,0,0.674,0)
                }):Play()
            else
                local tween = TweenService:Create(Window,TweenInfo.new(0.2),{
                    Size = UDim2.new(0,0,0,0)
                })
                tween:Play()
                tween.Completed:Wait()
                Window.Visible = false
            end
        end
    end)

    -- TITLE PANEL
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

    -- TABS PANEL
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

    Instance.new("UIListLayout",TabsHolder).Padding = UDim.new(0,8)

    -- CONTENT
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

        local Left = Instance.new("Frame")
        Left.Size = UDim2.new(0.5,-5,1,0)
        Left.BackgroundTransparency = 1
        Left.Parent = Page

        local LL = Instance.new("UIListLayout",Left)
        LL.Padding = UDim.new(0,8)
        LL.HorizontalAlignment = Enum.HorizontalAlignment.Center

        local Right = Instance.new("Frame")
        Right.Size = UDim2.new(0.5,-5,1,0)
        Right.Position = UDim2.new(0.5,5,0,0)
        Right.BackgroundTransparency = 1
        Right.Parent = Page

        local RL = Instance.new("UIListLayout",Right)
        RL.Padding = UDim.new(0,8)
        RL.HorizontalAlignment = Enum.HorizontalAlignment.Center

        TabButton.MouseButton1Click:Connect(function()
            for _,v in pairs(TabConteiner:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
        end)

        local TabFunctions = {}

        function TabFunctions:CreateToggle(side,title,desc,callback)

            local Parent = side=="Right" and Right or Left

            local Holder = Instance.new("Frame")
            Holder.Size = UDim2.new(1,-10,0,70)
            Holder.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Holder.BackgroundTransparency = 0.3
            Holder.Parent = Parent

            Instance.new("UICorner",Holder).CornerRadius = UDim.new(0,8)

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(0,0,0)
            Stroke.Parent = Holder

            local Title = Instance.new("TextLabel")
            Title.Text = title
            Title.Size = UDim2.new(0.7,0,0,25)
            Title.Position = UDim2.new(0.03,0,0.05,0)
            Title.BackgroundTransparency = 1
            Title.TextScaled = true
            Title.Font = Enum.Font.GothamBold
            Title.TextColor3 = Color3.fromRGB(0,0,0)
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Holder

            local Desc = Instance.new("TextLabel")
            Desc.Text = desc
            Desc.Size = UDim2.new(0.7,0,0,20)
            Desc.Position = UDim2.new(0.03,0,0.45,0)
            Desc.BackgroundTransparency = 1
            Desc.TextScaled = true
            Desc.Font = Enum.Font.Gotham
            Desc.TextColor3 = Color3.fromRGB(0,0,0)
            Desc.TextWrapped = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.Parent = Holder

            local Toggle = Instance.new("Frame")
            Toggle.Size = UDim2.new(0,50,0,25)
            Toggle.Position = UDim2.new(0.85,0,0.3,0)
            Toggle.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Toggle.BackgroundTransparency = 0.3
            Toggle.Parent = Holder

            Instance.new("UICorner",Toggle).CornerRadius = UDim.new(1,0)

            local TStroke = Instance.new("UIStroke")
            TStroke.Color = Color3.fromRGB(0,0,0)
            TStroke.Parent = Toggle

            local Circle = Instance.new("Frame")
            Circle.Size = UDim2.new(0,21,0,21)
            Circle.Position = UDim2.new(0,2,0.5,-10)
            Circle.BackgroundColor3 = Color3.fromRGB(0,0,0)
            Circle.Parent = Toggle

            Instance.new("UICorner",Circle).CornerRadius = UDim.new(1,0)

            local State = false

            Toggle.InputBegan:Connect(function(input)
                if input.UserInputType==Enum.UserInputType.MouseButton1 then
                    State = not State

                    TweenService:Create(Circle,TweenInfo.new(0.15),{
                        Position = State and UDim2.new(1,-23,0.5,-10)
                            or UDim2.new(0,2,0.5,-10)
                    }):Play()

                    if callback then
                        callback(State)
                    end
                end
            end)
        end

        function TabFunctions:CreateSlider(side,title,min,max,callback)

            local Parent = side=="Right" and Right or Left

            local Holder = Instance.new("Frame")
            Holder.Size = UDim2.new(1,-10,0,70)
            Holder.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Holder.BackgroundTransparency = 0.3
            Holder.Parent = Parent

            Instance.new("UICorner",Holder).CornerRadius = UDim.new(0,8)

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(0,0,0)
            Stroke.Parent = Holder

            local Title = Instance.new("TextLabel")
            Title.Text = title
            Title.Size = UDim2.new(1,-10,0,25)
            Title.Position = UDim2.new(0.03,0,0.05,0)
            Title.BackgroundTransparency = 1
            Title.TextScaled = true
            Title.Font = Enum.Font.GothamBold
            Title.TextColor3 = Color3.fromRGB(0,0,0)
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Holder

            local Bar = Instance.new("Frame")
            Bar.Size = UDim2.new(0.9,0,0,8)
            Bar.Position = UDim2.new(0.05,0,0.6,0)
            Bar.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Bar.BackgroundTransparency = 0.3
            Bar.Parent = Holder

            Instance.new("UICorner",Bar).CornerRadius = UDim.new(1,0)

            local BarStroke = Instance.new("UIStroke")
            BarStroke.Color = Color3.fromRGB(0,0,0)
            BarStroke.Parent = Bar

            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new(0,0,1,0)
            Fill.BackgroundColor3 = Color3.fromRGB(0,0,0)
            Fill.Parent = Bar

            Instance.new("UICorner",Fill).CornerRadius = UDim.new(1,0)

            local Dragging=false

            Bar.InputBegan:Connect(function(input)
                if input.UserInputType==Enum.UserInputType.MouseButton1 then
                    Dragging=true
                end
            end)

            Bar.InputEnded:Connect(function(input)
                if input.UserInputType==Enum.UserInputType.MouseButton1 then
                    Dragging=false
                end
            end)

            UIS.InputChanged:Connect(function(input)
                if Dragging and input.UserInputType==Enum.UserInputType.MouseMovement then

                    local percent=math.clamp(
                        (input.Position.X-Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,
                        0,1)

                    Fill.Size=UDim2.new(percent,0,1,0)

                    local value=math.floor(min+(max-min)*percent)

                    if callback then
                        callback(value)
                    end
                end
            end)
        end

        return TabFunctions
    end

    return WindowFunctions
end

return Library
