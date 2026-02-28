local Library = {}

function Library:CreateWindow()

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UiOwner"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0.74, 0, 0.674, 0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.BackgroundTransparency = 1
    Window.Parent = ScreenGui

    local WC = Instance.new("UICorner")
    WC.CornerRadius = UDim.new(0, 20)
    WC.Parent = Window

    -- TITLE
    local title = Instance.new("Frame")
    title.Name = "title"
    title.Size = UDim2.new(0.234, 0, 0.166, 0)
    title.Position = UDim2.new(0, 0, 0.018, 0)
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 0.3
    title.Parent = Window

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255, 255, 255)
    Stroke.Thickness = 1.5
    Stroke.Parent = title

    local TC = Instance.new("UICorner")
    TC.CornerRadius = UDim.new(0, 8)
    TC.Parent = title

    local TitleText = Instance.new("TextLabel")
    TitleText.Text = "LightVisuals"
    TitleText.Size = UDim2.new(0, 145, 0, 40)
    TitleText.Position = UDim2.new(-0.007, 0, 0, 0)
    TitleText.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.TextScaled = true
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Parent = title

    local VersionText = Instance.new("TextLabel")
    VersionText.Text = "v0.0.1"
    VersionText.Size = UDim2.new(0, 146, 0, 37)
    VersionText.Position = UDim2.new(-0.007, 0, 0.519, 0)
    VersionText.TextColor3 = Color3.fromRGB(0, 0, 0)
    VersionText.BackgroundTransparency = 1
    VersionText.TextScaled = true
    VersionText.Font = Enum.Font.GothamBold
    VersionText.Parent = title

    -- TABS PANEL
    local Tabs = Instance.new("Frame")
    Tabs.Name = "Tabs"
    Tabs.Size = UDim2.new(0.234, 0, 0.774, 0)
    Tabs.Position = UDim2.new(0, 0, 0.199, 0)
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 0.3
    Tabs.Parent = Window

    local Stroke2 = Instance.new("UIStroke")
    Stroke2.Color = Color3.fromRGB(255, 255, 255)
    Stroke2.Thickness = 1.5
    Stroke2.Parent = Tabs

    local TC2 = Instance.new("UICorner")
    TC2.CornerRadius = UDim.new(0, 8)
    TC2.Parent = Tabs

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Size = UDim2.new(0.938, 0, 0.965, 0)
    TabsHolder.Position = UDim2.new(0.029, 0, 0.017, 0)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Tabs

    local UIList = Instance.new("UIListLayout")
    UIList.Padding = UDim.new(0, 8)
    UIList.Parent = TabsHolder

    -- CONTENT
    local TabConteiner = Instance.new("Frame")
    TabConteiner.Name = "TabConteiner"
    TabConteiner.Size = UDim2.new(0.732, 0, 0.955, 0)
    TabConteiner.Position = UDim2.new(0.244, 0, 0.018, 0)
    TabConteiner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabConteiner.BackgroundTransparency = 0.3
    TabConteiner.Parent = Window

    local TC3 = Instance.new("UICorner")
    TC3.CornerRadius = UDim.new(0, 8)
    TC3.Parent = TabConteiner

    local Stroke3 = Instance.new("UIStroke")
    Stroke3.Color = Color3.fromRGB(255, 255, 255)
    Stroke3.Thickness = 1.5
    Stroke3.Parent = TabConteiner

    local WindowFunctions = {}

    function WindowFunctions:CreateTab(name)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0.158, 0)
        TabButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TabButton.BackgroundTransparency = 0.3
        TabButton.Text = name
        TabButton.TextScaled = true
        TabButton.TextColor3 = Color3.fromRGB(0,0,0)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Parent = TabsHolder

        local CornerBtn = Instance.new("UICorner")
        CornerBtn.CornerRadius = UDim.new(0,8)
        CornerBtn.Parent = TabButton

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = TabConteiner

        local LeftTab = Instance.new("Frame")
        LeftTab.Size = UDim2.new(0.5, -5, 1, 0)
        LeftTab.BackgroundTransparency = 1
        LeftTab.Parent = Page

        local LeftLayout = Instance.new("UIListLayout")
        LeftLayout.Padding = UDim.new(0, 8)
        LeftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        LeftLayout.Parent = LeftTab

        local RightTab = Instance.new("Frame")
        RightTab.Size = UDim2.new(0.5, -5, 1, 0)
        RightTab.Position = UDim2.new(0.5, 5, 0, 0)
        RightTab.BackgroundTransparency = 1
        RightTab.Parent = Page

        local RightLayout = Instance.new("UIListLayout")
        RightLayout.Padding = UDim.new(0, 8)
        RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        RightLayout.Parent = RightTab

        TabButton.MouseButton1Click:Connect(function()
            for _,v in pairs(TabConteiner:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
        end)

        local TabFunctions = {}

        function TabFunctions:CreateToggle(side,title,description,callback)

            local Parent = side == "Right" and RightTab or LeftTab

            local Holder = Instance.new("Frame")
            Holder.Size = UDim2.new(1,-10,0,70)
            Holder.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Holder.BackgroundTransparency = 0.3
            Holder.Parent = Parent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0,8)
            Corner.Parent = Holder

            local Title = Instance.new("TextLabel")
            Title.Text = title
            Title.Size = UDim2.new(0.7,0,0,25)
            Title.Position = UDim2.new(0.03,0,0.05,0)
            Title.BackgroundTransparency = 1
            Title.TextColor3 = Color3.fromRGB(0,0,0)
            Title.TextScaled = true
            Title.Font = Enum.Font.GothamBold
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Holder

            local Desc = Instance.new("TextLabel")
            Desc.Text = description
            Desc.Size = UDim2.new(0.7,0,0,20)
            Desc.Position = UDim2.new(0.03,0,0.45,0)
            Desc.BackgroundTransparency = 1
            Desc.TextColor3 = Color3.fromRGB(0,0,0)
            Desc.TextScaled = true
            Desc.Font = Enum.Font.Gotham
            Desc.TextWrapped = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.Parent = Holder

            local Toggle = Instance.new("TextButton")
            Toggle.Size = UDim2.new(0,50,0,25)
            Toggle.Position = UDim2.new(0.85,0,0.3,0)
            Toggle.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Toggle.BackgroundTransparency = 0.3
            Toggle.Text = ""
            Toggle.Parent = Holder

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(1,0)
            ToggleCorner.Parent = Toggle

            local State = false

            Toggle.MouseButton1Click:Connect(function()
                State = not State
                Toggle.BackgroundTransparency = State and 0 or 0.3
                if callback then
                    callback(State)
                end
            end)
        end

        function TabFunctions:CreateSlider(side,title,min,max,callback)

            local Parent = side == "Right" and RightTab or LeftTab

            local Holder = Instance.new("Frame")
            Holder.Size = UDim2.new(1,-10,0,70)
            Holder.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Holder.BackgroundTransparency = 0.3
            Holder.Parent = Parent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0,8)
            Corner.Parent = Holder

            local Title = Instance.new("TextLabel")
            Title.Text = title
            Title.Size = UDim2.new(1,-10,0,25)
            Title.Position = UDim2.new(0.03,0,0.05,0)
            Title.BackgroundTransparency = 1
            Title.TextColor3 = Color3.fromRGB(0,0,0)
            Title.TextScaled = true
            Title.Font = Enum.Font.GothamBold
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Holder

            local Bar = Instance.new("Frame")
            Bar.Size = UDim2.new(0.9,0,0,8)
            Bar.Position = UDim2.new(0.05,0,0.6,0)
            Bar.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Bar.BackgroundTransparency = 0.3
            Bar.Parent = Holder

            local BarCorner = Instance.new("UICorner")
            BarCorner.CornerRadius = UDim.new(1,0)
            BarCorner.Parent = Bar

            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new(0,0,1,0)
            Fill.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Fill.Parent = Bar

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(1,0)
            FillCorner.Parent = Fill

            local Dragging = false
            local UIS = game:GetService("UserInputService")

            Bar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                end
            end)

            Bar.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)

            UIS.InputChanged:Connect(function(input)
                if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local percent = math.clamp(
                        (input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X,
                        0,1
                    )

                    Fill.Size = UDim2.new(percent,0,1,0)

                    local value = math.floor(min + (max-min)*percent)

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
