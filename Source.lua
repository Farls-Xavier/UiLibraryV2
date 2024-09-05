local Library = {url = "https://raw.githubusercontent.com/Farls-Xavier/UiLibraryV2/main/", path = "@Farleyy"} -- Is NOT temporary

Library.__index = Library

local self = {}

setmetatable(self, Library)

function Library:strip(str)
	return str:match("^%s*(.-)%s*$")
end

if isfolder("@Farleyy") then
	printColor("Root folder exists.", Color3.fromRGB(245, 238, 140))
else
	printColor("Root folder does not exist.", Color3.fromRGB(200,0,0))
	makefolder("@Farleyy")
end

if isfile(self.path.."\\Config.json") then
	if self:strip(readfile(self.path.."\\Config.json")) ~= self:strip(game:HttpGet(self.url.."Config.json")) then
		writefile(self.path.."\\Config.json", game:HttpGet(self.url.."Config.json"))
	end
else
	writefile(self.path.."\\Config.json", game:HttpGet(self.url.."Config.json"))
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local Config = HttpService:JSONDecode(readfile(self.path.."\\Config.json"))
local UiTools = loadstring(game:HttpGet(Library.url.."UiTools.lua"))()
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

for i,v in pairs(game.CoreGui:GetDescendants()) do
	if v:IsA("StringValue") and v.Name == "ReferenceValue" and v.Parent.Name == "UiLibUi" --[[and Config.MultiGui == false]] then
		v.Parent:Destroy()
	end
end

local RenderSteps = {}

local function RenderStepped(func)
	local Connection = RunService.RenderStepped:Connect(func)
	table.insert(RenderSteps, Connection)

	return Connection
end

function Library:Validate(defaults, args)
	for i,v in pairs(defaults) do
		if args[i] == nil then
			args[i] = v
		end
	end     
	return args
end

function Roblox_Notification(message, buttons, callback)
	buttons = buttons or {"Yes", "No"}
	callback = callback or function ()
		warn("Callback is set to nil")
	end
	
	local BindableFunction = Instance.new("BindableFunction")
	BindableFunction.OnInvoke = function()
		callback()
		task.delay(.5, function()
			BindableFunction:Destroy()
		end)
	end

	StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = message,
		Icon = "rbxassetid://18700960425",
		Button1 = buttons[1],
		Button2 = buttons[2],
		Callback = BindableFunction
	})
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:GetVersion()
	return game:HttpGet(Library.url.."version.txt")
end

Library._Window = nil

local LoadedVersion = Library:GetVersion()
local NotifiedVersion = false

function Library:Window(args)
	args = Library:Validate({
		Title = "Ui Library",
		OnClose = function() end
	}, args or {})

	local This = {
		CurrentTab = nil,
		CurrentTabName = nil,
		TargetPlayer = nil
	}

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "UiLibUi"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = RunService:IsStudio() and Player.PlayerGui or game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local RefrenceValue = Instance.new("StringValue", ScreenGui)
	RefrenceValue.Name = "ReferenceValue"
	RefrenceValue.Value = "Reference Value"

	if Config.Chat == true then
		Roblox_Notification("Do you actually wanna use this trash chat?", {"Yes", "No"}, function(answer)
			if answer == "Yes" then
				loadstring(game:HttpGet(Library.url.."ChatModule.lua"))()
			end
		end)
	end

	printColor("Gulp uhhh chat module soon :fire: !!!!", Color3.fromRGB(98, 0, 255))

	Library._Window = This
	local Minimized = false

	coroutine.wrap(function()
		while task.wait(.5) do
			if LoadedVersion ~= Library:GetVersion() and NotifiedVersion ~= true then
				NotifiedVersion = true
				printColor("Ui library has updated from version: "..LoadedVersion.." to: "..Library:GetVersion(), Color3.fromRGB(97, 85, 165))
			end
		end	
	end)()

	--Gui to lua stuff
	local MainFrame = Instance.new("Frame")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local UICornerMainFrame = Instance.new("UICorner")
	local Navigation = Instance.new("ImageLabel")
	local NavigationToggle = Instance.new("ImageLabel")
	local UICornerNavigationToggle = Instance.new("UICorner")
	local UICornerNavigation = Instance.new("UICorner")
	local Layout = Instance.new("Frame")
	local UIListLayout_Layout = Instance.new("UIListLayout")
	local UICornerNavigation_2 = Instance.new("UICorner")
	local TabButtonTemplate = Instance.new("TextButton")
	local UIStrokeTestCircleButton = Instance.new("UIStroke")
	local UiCornerTestCircleButton = Instance.new("UICorner")
	local TemplateTabButtonImage = Instance.new("ImageLabel")
	local UiCornerTemplateTabButtonImage = Instance.new("UICorner")
	local TextTabButton = Instance.new("TextButton")
	local UICornerTabBtnTemplate = Instance.new("UICorner")
	local Version = Instance.new("TextLabel")
	local Title = Instance.new("TextLabel")
	local DragBar = Instance.new("Frame")
	local TabHolder = Instance.new("Frame")
	local TemplateTab = Instance.new("ScrollingFrame")
	local Holder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local TemplateBind = Instance.new("Frame")
	local TextLabelTemplateBind = Instance.new("TextLabel")
	local ActivationTemplateBind = Instance.new("Frame")
	local UICornerTemplateBind = Instance.new("UICorner")
	local BindText = Instance.new("TextLabel")
	local UICornerTemplateBindText = Instance.new("UICorner")
	local TemplateButton = Instance.new("Frame")
	local UIStrokeTemplateButton = Instance.new("UIStroke")
	local TextLabelTemplateButton = Instance.new("TextLabel")
	local ActivationTemplateButton = Instance.new("Frame")
	local UICornerTemplateButton = Instance.new("UICorner")
	local ButtonImage = Instance.new("ImageLabel")
	local ButtonImageUiCorner = Instance.new("UICorner")
	local TemplateImage = Instance.new("Frame")
	local UICornerTemplateImage = Instance.new("UICorner")
	local ImageLabelImage = Instance.new("ImageLabel")
	local UiCornerImageLabel = Instance.new("UICorner")
	local TemplateToggle = Instance.new("Frame")
	local TextLabelTemplateToggle = Instance.new("TextLabel")
	local ActivationTemplateToggle = Instance.new("Frame")
	local UICornerTemplateToggle = Instance.new("UICorner")
	local TemplateLabel = Instance.new("Frame")
	local UIStrokeTemplateLabel = Instance.new("UIStroke")
	local TextLabelTemplateLabel = Instance.new("TextLabel")
	local UICornerTemplateLabel = Instance.new("UICorner")
	local CheckHolder = Instance.new("Frame")
	local CheckmarkImage = Instance.new("ImageLabel")
	local UICornerCheckHolder = Instance.new("UICorner")
	local UICornerTabHolder = Instance.new("UICorner")
	local TemplatePlayerInfo = Instance.new("Frame")
	local TextLabelTemplatePlayerInfo = Instance.new("TextLabel")
	local UICornerTemplatePlayerInfo = Instance.new("UICorner")
	local PlayerImage = Instance.new("ImageLabel")
	local TextLabelTemplatePlayerInfoPing = Instance.new("TextLabel")
	local HealthImage = Instance.new("ImageLabel")
	local TargetSelect = Instance.new("ImageLabel")
	local Spectate = Instance.new("ImageLabel")
	local TextLabelTemplatePlayerInfoUid = Instance.new("TextLabel")
	local UiCornerPlayerImage = Instance.new("UICorner")
	local UIStrokeTemplateToggle = Instance.new("UIStroke")
	local UiStrokeTemplateImage = Instance.new("UIStroke")
	local UiStrokeTemplateBind = Instance.new("UIStroke")
	local UiStrokeTemplatePlayerInfo = Instance.new("UIStroke")
	local TabCover = Instance.new("ImageLabel")
	local TabCoverUiCorner = Instance.new("UICorner")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ScreenGui
	MainFrame.AnchorPoint = Vector2.new(1, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.747136831, 0, 0.513513505, 0)
	MainFrame.Size = UDim2.new(0, 535, 0, 330)

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = MainFrame
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	UICornerMainFrame.CornerRadius = UDim.new(0, 4)
	UICornerMainFrame.Name = "UICornerMainFrame"
	UICornerMainFrame.Parent = MainFrame

	Navigation.Name = "Navigation"
	Navigation.Parent = MainFrame
	Navigation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Navigation.BackgroundTransparency = 1.000
	Navigation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navigation.BorderSizePixel = 0
	Navigation.Size = UDim2.new(0, 0, 0, 330) -- UDim2.new(0, 150, 0, 330)
	Navigation.Visible = true
	Navigation.ZIndex = 2
	Navigation.Image = "rbxassetid://1633616921"
	Navigation.ImageColor3 = Color3.fromRGB(26, 26, 26)

	UICornerNavigation.CornerRadius = UDim.new(0, 4)
	UICornerNavigation.Name = "UICornerNavigation"
	UICornerNavigation.Parent = Navigation

	Layout.Name = "Layout"
	Layout.Parent = Navigation
	Layout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Layout.BackgroundTransparency = 1.000
	Layout.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Layout.BorderSizePixel = 0
	Layout.Position = UDim2.new(0.00999999978, 0, 0.0181818176, 0)
	Layout.Size = UDim2.new(0, 39, 0, 324)

	UIListLayout_Layout.Name = "UIListLayout_Layout"
	UIListLayout_Layout.Parent = Layout
	UIListLayout_Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_Layout.SortOrder = Enum.SortOrder.LayoutOrder 
	UIListLayout_Layout.Padding = UDim.new(0, 5)

	UICornerNavigation_2.CornerRadius = UDim.new(0, 4)
	UICornerNavigation_2.Name = "UICornerNavigation"
	UICornerNavigation_2.Parent = Layout

	NavigationToggle.Name = "NavigationToggle"
	NavigationToggle.Parent = MainFrame
	NavigationToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationToggle.BackgroundTransparency = 1.000
	NavigationToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NavigationToggle.BorderSizePixel = 0
	NavigationToggle.Position = UDim2.new(-0.001, 0, 0.009, 0) --UDim2.new(0.279750705, 0, 0.00606060587, 0)
	NavigationToggle.Rotation = -90.000
	NavigationToggle.Size = UDim2.new(0, 24, 0, 22)
	NavigationToggle.Image = "rbxassetid://13846885079"
	NavigationToggle.ImageColor3 = Color3.fromRGB(200, 200, 200)
	NavigationToggle.ScaleType = Enum.ScaleType.Fit

	UICornerNavigationToggle.CornerRadius = UDim.new(0, 2)
	UICornerNavigationToggle.Name = "UICornerNavigationToggle"
	UICornerNavigationToggle.Parent = NavigationToggle

	TabButtonTemplate.Name = "TabButtonTemplate"
	TabButtonTemplate.Parent = Layout
	TabButtonTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabButtonTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtonTemplate.BorderSizePixel = 0
	TabButtonTemplate.Position = UDim2.new(0.0933333337, 0, 0.0272727273, 0)
	TabButtonTemplate.Size = UDim2.new(0, 30, 0, 30)
	TabButtonTemplate.ZIndex = 2
	TabButtonTemplate.Visible = false
	TabButtonTemplate.AutoButtonColor = false
	TabButtonTemplate.Font = Enum.Font.SourceSans
	TabButtonTemplate.Text = ""
	TabButtonTemplate.TextColor3 = Color3.fromRGB(0, 0, 0)
	TabButtonTemplate.TextSize = 14.000

	UIStrokeTestCircleButton.Name = "UIStrokeTestCircleButton"
	UIStrokeTestCircleButton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStrokeTestCircleButton.Color = Color3.fromRGB(20,20,20)
	UIStrokeTestCircleButton.LineJoinMode = Enum.LineJoinMode.Round
	UIStrokeTestCircleButton.Thickness = 1
	UIStrokeTestCircleButton.Parent = TabButtonTemplate

	UiCornerTestCircleButton.CornerRadius = UDim.new(0, 100)
	UiCornerTestCircleButton.Name = "UiCornerTestCircleButton"
	UiCornerTestCircleButton.Parent = TabButtonTemplate

	TemplateTabButtonImage.Name = "TestTabButtonImage"
	TemplateTabButtonImage.Parent = TabButtonTemplate
	TemplateTabButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
	TemplateTabButtonImage.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	TemplateTabButtonImage.BackgroundTransparency = 1.000
	TemplateTabButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateTabButtonImage.BorderSizePixel = 0
	TemplateTabButtonImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	TemplateTabButtonImage.Size = UDim2.new(0, 16, 0, 16)
	TemplateTabButtonImage.Image = "rbxassetid://13848371994"
	TemplateTabButtonImage.ImageColor3 = Color3.fromRGB(200, 200, 200)

	UiCornerTemplateTabButtonImage.CornerRadius = UDim.new(0, 100)
	UiCornerTemplateTabButtonImage.Name = "UiCornerTemplateTabButtonImage"
	UiCornerTemplateTabButtonImage.Parent = TemplateTabButtonImage

	TextTabButton.Name = "TextTabButton"
	TextTabButton.AutoButtonColor = false
	TextTabButton.Parent = TabButtonTemplate
	TextTabButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	TextTabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextTabButton.BorderSizePixel = 0
	TextTabButton.Position = UDim2.new(1.60000002, 0, 0.233333334, 0)
	TextTabButton.Size = UDim2.new(0, 60, 0, 16)
	TextTabButton.Font = Enum.Font.GothamMedium
	TextTabButton.Text = "Home"
	TextTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextTabButton.TextSize = 15.000

	UICornerTabBtnTemplate.CornerRadius = UDim.new(0, 2)
	UICornerTabBtnTemplate.Name = "UICornerTabBtnTemplate"
	UICornerTabBtnTemplate.Parent = TextTabButton

	Version.Name = "Version"
	Version.Parent = Navigation
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Version.BorderSizePixel = 0
	Version.Position = UDim2.new(0.576666653, 0, 0.963636339, 0)
	Version.Size = UDim2.new(0, 29, 0, 12)
	Version.Font = Enum.Font.GothamBold
	Version.Text = "v "..Library:GetVersion()
	Version.TextColor3 = Color3.fromRGB(100, 100, 100)
	Version.TextSize = 10.000
	Version.TextXAlignment = Enum.TextXAlignment.Left
	Version.TextTransparency = 1

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.379168183, 0, 0, 0)
	Title.Size = UDim2.new(0, 129, 0, 29)
	Title.Font = Enum.Font.MontserratBold
	Title.FontFace.Weight = Enum.FontWeight.SemiBold
	Title.Text = args.Title
	Title.TextScaled = false
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000

	DragBar.Name = "DragBar"
	DragBar.Parent = MainFrame
	DragBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DragBar.BackgroundTransparency = 1.000
	DragBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DragBar.BorderSizePixel = 0
	DragBar.Position = UDim2.new(0.26915887, 0, 0, 0)
	DragBar.Size = UDim2.new(0, 420, 0, 29)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = MainFrame
	TabHolder.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.0186915882, 0, 0.087878786, 0)
	TabHolder.Size = UDim2.new(0, 514, 0, 291)
	TabHolder.Visible = true

	TemplateTab.Name = "TemplateTab"
	TemplateTab.Parent = TabHolder
	TemplateTab.Active = true
	TemplateTab.BackgroundTransparency = 1
	TemplateTab.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	TemplateTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateTab.BorderSizePixel = 0
	TemplateTab.Position = UDim2.new(-0.000763770659, 0, -0.00146830454, 0)
	TemplateTab.Size = UDim2.new(0, 514, 0, 291)
	TemplateTab.Visible = false
	TemplateTab.ScrollBarImageColor3 = Color3.fromRGB(11,11,11)
	TemplateTab.ScrollBarThickness = 5

	Holder.Name = "Holder"
	Holder.Parent = TemplateTab
	Holder.Size = UDim2.new(-0.03, 514, 1, 0)
	Holder.Position = UDim2.new(0.009, 0, 0.006, 0)
	Holder.BackgroundTransparency = 1

	UIListLayout.Parent = Holder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)

	TemplateBind.Name = "TemplateBind"
	TemplateBind.Parent = TemplateTab
	TemplateBind.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplateBind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateBind.BorderSizePixel = 0
	TemplateBind.Position = UDim2.new(0.0291828793, 0, 0.199314386, 0)
	TemplateBind.Size = UDim2.new(0, 142, 0, 35)
	TemplateBind.Visible = false

	TextLabelTemplateBind.Name = "TextLabelTemplateBind"
	TextLabelTemplateBind.Parent = TemplateBind
	TextLabelTemplateBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplateBind.BackgroundTransparency = 1.000
	TextLabelTemplateBind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplateBind.BorderSizePixel = 0
	TextLabelTemplateBind.Position = UDim2.new(0, 0, 0.285714298, 0)
	TextLabelTemplateBind.Size = UDim2.new(0, 108, 0, 15)
	TextLabelTemplateBind.Font = Enum.Font.GothamMedium
	TextLabelTemplateBind.Text = "  Keybind"
	TextLabelTemplateBind.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplateBind.TextSize = 16.000
	TextLabelTemplateBind.TextXAlignment = Enum.TextXAlignment.Left

	ActivationTemplateBind.Name = "ActivationTemplateBind"
	ActivationTemplateBind.Parent = TemplateBind
	ActivationTemplateBind.AnchorPoint = Vector2.new(0.5, 0.5)
	ActivationTemplateBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ActivationTemplateBind.BackgroundTransparency = 1.000
	ActivationTemplateBind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ActivationTemplateBind.BorderSizePixel = 0
	ActivationTemplateBind.Position = UDim2.new(0.5, 0, 0.5, 0)
	ActivationTemplateBind.Size = UDim2.new(1, 0, 1, 0)

	UICornerTemplateBind.CornerRadius = UDim.new(0, 6)
	UICornerTemplateBind.Name = "UICornerTemplateBind"
	UICornerTemplateBind.Parent = TemplateBind

	BindText.Name = "BindText"
	BindText.Parent = TemplateBind
	BindText.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	BindText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BindText.BorderSizePixel = 0
	BindText.Position = UDim2.new(0.79411763, 0, 0.200000003, 0)
	BindText.Size = UDim2.new(0, 20, 0, 20)
	BindText.Font = Enum.Font.GothamMedium
	BindText.Text = "F"
	BindText.TextColor3 = Color3.fromRGB(200, 200, 200)
	BindText.TextSize = 15.000

	UICornerTemplateBindText.CornerRadius = UDim.new(0, 4)
	UICornerTemplateBindText.Name = "UICornerTemplateBindText"
	UICornerTemplateBindText.Parent = BindText

	TemplateButton.Name = "TemplateButton"
	TemplateButton.Parent = TemplateTab
	TemplateButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateButton.BorderSizePixel = 0
	TemplateButton.Position = UDim2.new(0.0291828793, 0, 0.0515480712, 0)
	TemplateButton.Size = UDim2.new(0, 177, 0, 35)
	TemplateButton.Visible = false

	UIStrokeTemplateButton.Name = "UIStrokeTemplateButton"
	UIStrokeTemplateButton.Parent = TemplateButton
	UIStrokeTemplateButton.Thickness = 1
	UIStrokeTemplateButton.Transparency = 1
	UIStrokeTemplateButton.LineJoinMode = Enum.LineJoinMode.Round
	UIStrokeTemplateButton.Color = Color3.fromRGB(67,67,67)

	TextLabelTemplateButton.Name = "TextLabelTemplateButton"
	TextLabelTemplateButton.Parent = TemplateButton
	TextLabelTemplateButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplateButton.BackgroundTransparency = 1.000
	TextLabelTemplateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplateButton.BorderSizePixel = 0
	TextLabelTemplateButton.Position = UDim2.new(0, 0, 0.285714298, 0)
	TextLabelTemplateButton.Size = UDim2.new(0, 155, 0, 15)
	TextLabelTemplateButton.Font = Enum.Font.GothamMedium
	TextLabelTemplateButton.Text = "  Button"
	TextLabelTemplateButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplateButton.TextSize = 16.000
	TextLabelTemplateButton.TextXAlignment = Enum.TextXAlignment.Left

	ActivationTemplateButton.Name = "ActivationTemplateButton"
	ActivationTemplateButton.Parent = TemplateButton
	ActivationTemplateButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ActivationTemplateButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ActivationTemplateButton.BackgroundTransparency = 1.000
	ActivationTemplateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ActivationTemplateButton.BorderSizePixel = 0
	ActivationTemplateButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	ActivationTemplateButton.Size = UDim2.new(1, 0, 1, 0)

	UICornerTemplateButton.CornerRadius = UDim.new(0, 6)
	UICornerTemplateButton.Name = "UICornerTemplateButton"
	UICornerTemplateButton.Parent = TemplateButton

	ButtonImage.Name = "ButtonImage"
	ButtonImage.Parent = TemplateButton
	ButtonImage.AnchorPoint = Vector2.new(1, 0.5)
	ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonImage.BackgroundTransparency = 1.000
	ButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonImage.BorderSizePixel = 0
	ButtonImage.Position = UDim2.new(1, 0, 0.503571451, 0)
	ButtonImage.Size = UDim2.new(0, 34, 0, 34)
	ButtonImage.ScaleType = Enum.ScaleType.Fit

	ButtonImageUiCorner.CornerRadius = UDim.new(0, 2)
	ButtonImageUiCorner.Name = "ButtonImageUiCorner"
	ButtonImageUiCorner.Parent = ButtonImage

	TemplateImage.Name = "TemplateImage"
	TemplateImage.Parent = TemplateTab
	TemplateImage.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplateImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateImage.BorderSizePixel = 0
	TemplateImage.Position = UDim2.new(0.0291828793, 0, 0.498281777, 0)
	TemplateImage.Size = UDim2.new(0, 80, 0, 70)
	TemplateImage.Visible = false

	UICornerTemplateImage.CornerRadius = UDim.new(0, 6)
	UICornerTemplateImage.Name = "UICornerTemplateImage"
	UICornerTemplateImage.Parent = TemplateImage

	ImageLabelImage.Name = "ImageLabelImage"
	ImageLabelImage.Parent = TemplateImage
	ImageLabelImage.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabelImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabelImage.BackgroundTransparency = 1.000
	ImageLabelImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabelImage.BorderSizePixel = 0
	ImageLabelImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabelImage.Size = UDim2.new(1, 0, 1, 0)
	ImageLabelImage.Image = "rbxassetid://18703386053"
	ImageLabelImage.ScaleType = Enum.ScaleType.Fit

	UiCornerImageLabel.CornerRadius = UDim.new(0, 2)
	UiCornerImageLabel.Name = "UiCornerImageLabel"
	UiCornerImageLabel.Parent = ImageLabelImage

	TemplateToggle.Name = "TemplateToggle"
	TemplateToggle.Parent = TemplateTab
	TemplateToggle.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplateToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateToggle.BorderSizePixel = 0
	TemplateToggle.Position = UDim2.new(0.0291828793, 0, 0.35395357, 0)
	TemplateToggle.Size = UDim2.new(0, 154, 0, 35)
	TemplateToggle.Visible = false

	TextLabelTemplateToggle.Name = "TextLabelTemplateToggle"
	TextLabelTemplateToggle.Parent = TemplateToggle
	TextLabelTemplateToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplateToggle.BackgroundTransparency = 1.000
	TextLabelTemplateToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplateToggle.BorderSizePixel = 0
	TextLabelTemplateToggle.Position = UDim2.new(0, 0, 0.285714298, 0)
	TextLabelTemplateToggle.Size = UDim2.new(0, 108, 0, 15)
	TextLabelTemplateToggle.Font = Enum.Font.GothamMedium
	TextLabelTemplateToggle.Text = "  Toggle"
	TextLabelTemplateToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplateToggle.TextSize = 16.000
	TextLabelTemplateToggle.TextXAlignment = Enum.TextXAlignment.Left

	ActivationTemplateToggle.Name = "ActivationTemplateToggle"
	ActivationTemplateToggle.Parent = TemplateToggle
	ActivationTemplateToggle.AnchorPoint = Vector2.new(0.5, 0.5)
	ActivationTemplateToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ActivationTemplateToggle.BackgroundTransparency = 1.000
	ActivationTemplateToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ActivationTemplateToggle.BorderSizePixel = 0
	ActivationTemplateToggle.Position = UDim2.new(0.5, 0, 0.5, 0)
	ActivationTemplateToggle.Size = UDim2.new(1, 0, 1, 0)

	UICornerTemplateToggle.CornerRadius = UDim.new(0, 6)
	UICornerTemplateToggle.Name = "UICornerTemplateToggle"
	UICornerTemplateToggle.Parent = TemplateToggle

	CheckHolder.Name = "CheckHolder"
	CheckHolder.Parent = TemplateToggle
	CheckHolder.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	CheckHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckHolder.BorderSizePixel = 0
	CheckHolder.Position = UDim2.new(0.813480496, 0, 0.200000003, 0)
	CheckHolder.Size = UDim2.new(0, 20, 0, 20)

	CheckmarkImage.Name = "CheckmarkImage"
	CheckmarkImage.Parent = CheckHolder
	CheckmarkImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CheckmarkImage.BackgroundTransparency = 1.000
	CheckmarkImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckmarkImage.BorderSizePixel = 0
	CheckmarkImage.Size = UDim2.new(1, 0, 1, 0)
	CheckmarkImage.Image = "rbxassetid://13846852950"
	CheckmarkImage.ImageTransparency = 1.000
	
	TemplatePlayerInfo.Name = "TemplatePlayerInfo"
	TemplatePlayerInfo.Parent = TemplateTab
	TemplatePlayerInfo.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplatePlayerInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplatePlayerInfo.BorderSizePixel = 0
	TemplatePlayerInfo.Position = UDim2.new(0, 0, 0.656357408, 0)
	TemplatePlayerInfo.Size = UDim2.new(0, 177, 0, 50)
	TemplatePlayerInfo.Visible = false

	TextLabelTemplatePlayerInfo.Name = "TextLabelTemplatePlayerInfo"
	TextLabelTemplatePlayerInfo.Parent = TemplatePlayerInfo
	TextLabelTemplatePlayerInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplatePlayerInfo.BackgroundTransparency = 1.000
	TextLabelTemplatePlayerInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplatePlayerInfo.BorderSizePixel = 0
	TextLabelTemplatePlayerInfo.Position = UDim2.new(0.169491529, 0, 0, 0)
	TextLabelTemplatePlayerInfo.Size = UDim2.new(0, 147, 0, 22)
	TextLabelTemplatePlayerInfo.Font = Enum.Font.GothamMedium
	TextLabelTemplatePlayerInfo.Text = "  Farleyy"
	TextLabelTemplatePlayerInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplatePlayerInfo.TextSize = 16.000
	TextLabelTemplatePlayerInfo.TextXAlignment = Enum.TextXAlignment.Left

	UICornerTemplatePlayerInfo.CornerRadius = UDim.new(0, 6)
	UICornerTemplatePlayerInfo.Name = "UICornerTemplatePlayerInfo"
	UICornerTemplatePlayerInfo.Parent = TemplatePlayerInfo

	PlayerImage.Name = "PlayerImage"
	PlayerImage.Parent = TemplatePlayerInfo
	PlayerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerImage.BackgroundTransparency = 1.000
	PlayerImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PlayerImage.BorderSizePixel = 0
	PlayerImage.Size = UDim2.new(0, 30, 0, 30)
	PlayerImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
	
	UiCornerPlayerImage.Name = "UiCornerPlayerImage"
	UiCornerPlayerImage.CornerRadius = UDim.new(0,4)
	UiCornerPlayerImage.Parent = PlayerImage

	UICornerCheckHolder.CornerRadius = UDim.new(0, 5)
	UICornerCheckHolder.Name = "UICornerCheckHolder"
	UICornerCheckHolder.Parent = CheckHolder

	UICornerTabHolder.CornerRadius = UDim.new(0, 4)
	UICornerTabHolder.Name = "UICornerTabHolder"
	UICornerTabHolder.Parent = TabHolder
	
	TextLabelTemplatePlayerInfoUid.Name = "TextLabelTemplatePlayerInfoUid"
	TextLabelTemplatePlayerInfoUid.Parent = TemplatePlayerInfo
	TextLabelTemplatePlayerInfoUid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplatePlayerInfoUid.BackgroundTransparency = 1.000
	TextLabelTemplatePlayerInfoUid.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplatePlayerInfoUid.BorderSizePixel = 0
	TextLabelTemplatePlayerInfoUid.Position = UDim2.new(0.19929944, 0, 0.260000001, 0)
	TextLabelTemplatePlayerInfoUid.Size = UDim2.new(0, 141, 0, 22)
	TextLabelTemplatePlayerInfoUid.Font = Enum.Font.GothamMedium
	TextLabelTemplatePlayerInfoUid.Text = "  123456789"
	TextLabelTemplatePlayerInfoUid.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplatePlayerInfoUid.TextSize = 9.000
	TextLabelTemplatePlayerInfoUid.TextXAlignment = Enum.TextXAlignment.Left
	
	TextLabelTemplatePlayerInfoPing.Name = "TextLabelTemplatePlayerInfoPing"
	TextLabelTemplatePlayerInfoPing.Parent = TemplatePlayerInfo
	TextLabelTemplatePlayerInfoPing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplatePlayerInfoPing.BackgroundTransparency = 1.000
	TextLabelTemplatePlayerInfoPing.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplatePlayerInfoPing.BorderSizePixel = 0
	TextLabelTemplatePlayerInfoPing.Position = UDim2.new(0.100000001, 0, 0.779999971, 0)
	TextLabelTemplatePlayerInfoPing.Size = UDim2.new(0, 16, 0, 6)
	TextLabelTemplatePlayerInfoPing.Font = Enum.Font.GothamMedium
	TextLabelTemplatePlayerInfoPing.Text = "50 ms"
	TextLabelTemplatePlayerInfoPing.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplatePlayerInfoPing.TextSize = 9.000
	TextLabelTemplatePlayerInfoPing.TextXAlignment = Enum.TextXAlignment.Left
	
	TargetSelect.Name = "TargetSelect"
	TargetSelect.Parent = TemplatePlayerInfo
	TargetSelect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TargetSelect.BackgroundTransparency = 1.000
	TargetSelect.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TargetSelect.BorderSizePixel = 0
	TargetSelect.Position = UDim2.new(0.885676324, 0, 0, 0)
	TargetSelect.Size = UDim2.new(0, 20, 0, 20)
	TargetSelect.Image = "rbxassetid://13850779421"
	TargetSelect.ImageColor3 = Color3.fromRGB(200, 200, 200)

	HealthImage.Name = "HealthImage"
	HealthImage.Parent = TemplatePlayerInfo
	HealthImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HealthImage.BackgroundTransparency = 1.000
	HealthImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HealthImage.BorderSizePixel = 0
	HealthImage.Position = UDim2.new(0.00997010991, 0, 0.720000029, 0)
	HealthImage.Size = UDim2.new(0, 12, 0, 12)
	HealthImage.Image = "rbxassetid://13868090844"
	
	Spectate.Name = "Spectate"
	Spectate.Parent = TemplatePlayerInfo
	Spectate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Spectate.BackgroundTransparency = 1.000
	Spectate.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Spectate.BorderSizePixel = 0
	Spectate.Position = UDim2.new(0.885676324, 0, 0.439999998, 0)
	Spectate.Size = UDim2.new(0, 20, 0, 20)
	Spectate.Image = "rbxassetid://13847974326"
	Spectate.ImageColor3 = Color3.fromRGB(200, 200, 200)
	
	UIStrokeTemplateToggle.Name = "UIStrokeTemplateToggle"
	UIStrokeTemplateToggle.Parent = TemplateToggle
	UIStrokeTemplateToggle.Thickness = 1
	UIStrokeTemplateToggle.Transparency = 1
	UIStrokeTemplateToggle.LineJoinMode = Enum.LineJoinMode.Round
	UIStrokeTemplateToggle.Color = Color3.fromRGB(67,67,67)
	
	UiStrokeTemplateImage.Name = "UiStrokeTemplateImage"
	UiStrokeTemplateImage.Parent = TemplateImage
	UiStrokeTemplateImage.Thickness = 1
	UiStrokeTemplateImage.Transparency = 1
	UiStrokeTemplateImage.LineJoinMode = Enum.LineJoinMode.Round
	UiStrokeTemplateImage.Color = Color3.fromRGB(67,67,67)
	
	UiStrokeTemplateBind.Name = "UiStrokeTemplateBind"
	UiStrokeTemplateBind.Parent = TemplateBind
	UiStrokeTemplateBind.Thickness = 1
	UiStrokeTemplateBind.Transparency = 1
	UiStrokeTemplateBind.LineJoinMode = Enum.LineJoinMode.Round
	UiStrokeTemplateBind.Color = Color3.fromRGB(67,67,67)
	
	UiStrokeTemplatePlayerInfo.Name = "UiStrokeTemplatePlayerInfo"
	UiStrokeTemplatePlayerInfo.Parent = TemplatePlayerInfo
	UiStrokeTemplatePlayerInfo.Thickness = 1
	UiStrokeTemplatePlayerInfo.Transparency = 1
	UiStrokeTemplatePlayerInfo.LineJoinMode = Enum.LineJoinMode.Round
	UiStrokeTemplatePlayerInfo.Color = Color3.fromRGB(67,67,67)

	TemplateLabel.Name = "TemplateLabel"
	TemplateLabel.Visible = false
	TemplateLabel.Parent = TemplateTab
	TemplateLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TemplateLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateLabel.BorderSizePixel = 0
	TemplateLabel.Position = UDim2.new(0, 0, 0.512027502, 0)
	TemplateLabel.Size = UDim2.new(0, 225, 0, 25)

	UIStrokeTemplateLabel.Color = Color3.fromRGB(67, 67, 67)
	UIStrokeTemplateLabel.Transparency = 1
	UIStrokeTemplateLabel.Name = "UIStrokeTemplateLabel"
	UIStrokeTemplateLabel.Parent = TemplateLabel

	TextLabelTemplateLabel.Name = "TextLabelTemplateLabel"
	TextLabelTemplateLabel.Parent = TemplateLabel
	TextLabelTemplateLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelTemplateLabel.BackgroundTransparency = 1.000
	TextLabelTemplateLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabelTemplateLabel.BorderSizePixel = 0
	TextLabelTemplateLabel.Position = UDim2.new(0, 0, 1.2207031e-06, 0)
	TextLabelTemplateLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabelTemplateLabel.Font = Enum.Font.GothamMedium
	TextLabelTemplateLabel.Text = "  Label"
	TextLabelTemplateLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextLabelTemplateLabel.TextSize = 16.000
	TextLabelTemplateLabel.TextWrapped = true
	TextLabelTemplateLabel.TextXAlignment = Enum.TextXAlignment.Left

	UICornerTemplateLabel.CornerRadius = UDim.new(0, 6)
	UICornerTemplateLabel.Name = "UICornerTemplateLabel"
	UICornerTemplateLabel.Parent = TemplateLabel

	TabCover.Name = "TabCover"
	TabCover.Parent = TabHolder
	TabCover.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TabCover.BackgroundTransparency = 1.000
	TabCover.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabCover.BorderSizePixel = 0
	TabCover.Position = UDim2.new(-0.00100000005, 0, -0.00100000005, 0)
	TabCover.Size = UDim2.new(0, 515, 0, 291)
	TabCover.ImageColor3 = Color3.fromRGB(0, 0, 0)
	TabCover.ZIndex = 2

	TabCoverUiCorner.CornerRadius = UDim.new(0, 4)
	TabCoverUiCorner.Name = "TabCoverUiCorner"
	TabCoverUiCorner.Parent = TabCover

	UiTools.MakeDraggable(DragBar, MainFrame, 0.07)

	local NavOpen = true
	local NavToggleHover = false

	local NavTweenOpen = TweenService:Create(Navigation, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 150, 0, 330)})
	local NavTogglebtnOpen = TweenService:Create(NavigationToggle, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.279750705, 0, 0.00606060587, 0)})

	local NavTweenClose = TweenService:Create(Navigation, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0, 330)})
	local NavTogglebtnClose = TweenService:Create(NavigationToggle, TweenInfo.new(.44, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(-0.001, 0, 0.009, 0)})

	NavTweenOpen:Play()
	NavTogglebtnOpen:Play()
	Library:tween(TabCover, {BackgroundTransparency = .05})

	Library:tween(NavigationToggle, {Rotation = 90})

	NavTweenOpen.Completed:Connect(function()
		Library:tween(Version, {TextTransparency = 0})
	end)

	local function CloseNavigation()
		Library:tween(Version, {TextTransparency = 1})

		for i,v in pairs(Layout:GetChildren()) do
			if not string.find(v.Name:lower(), "template") then
				if v:IsA("TextButton") then
					Library:tween(v, {BackgroundTransparency = 1})
					for _,vv in pairs(v:GetChildren()) do
						if vv:IsA("UIStroke") then
							Library:tween(vv, {Transparency = 1})
						elseif vv:IsA("TextButton") then
							Library:tween(vv, {BackgroundTransparency = 1})
							Library:tween(vv, {TextTransparency = 1})
						elseif vv:IsA("ImageLabel") then
							Library:tween(vv, {ImageTransparency = 1}, function()
								NavTweenClose:Play()
								NavTogglebtnClose:Play()

								Library:tween(TabCover, {BackgroundTransparency = 1})

								DragBar.Position = UDim2.new(0.0436863415, 0, 0, 0)
								DragBar.Size = UDim2.new(0, 510, 0, 29)

								task.delay(.1, function()
									Library:tween(NavigationToggle, {Rotation = -90})
								end)
								NavTweenClose.Completed:Connect(function()
									Navigation.Visible = false
								end)
							end)
						end
					end
				end
			end
		end
	end

	local function OpenNavigation()
		Navigation.Visible = true
		NavTweenOpen:Play()
		NavTogglebtnOpen:Play()

		Library:tween(TabCover, {BackgroundTransparency = .05})

		task.delay(.1, function()
			Library:tween(NavigationToggle, {Rotation = 90})
		end)

		DragBar.Position = UDim2.new(.325, 0, 0, 0)
		DragBar.Size = UDim2.new(0, 359, 0, 29)

		NavTweenOpen.Completed:Connect(function()
			Library:tween(Version, {TextTransparency = 0})

			for i,v in pairs(Layout:GetChildren()) do
				if not string.find(v.Name:lower(), "template") then
					if v:IsA("TextButton") then
						Library:tween(v, {BackgroundTransparency = 0})
						for _,vv in pairs(v:GetChildren()) do
							if vv:IsA("UIStroke") then
								Library:tween(vv, {Transparency = 0})
							elseif vv:IsA("TextButton") then
								Library:tween(vv, {BackgroundTransparency = 0})
								Library:tween(vv, {TextTransparency = 0})
							elseif vv:IsA("ImageLabel") then
								Library:tween(vv, {ImageTransparency = 0})
							end
						end
					end
				end
			end
		end)
	end

	UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and NavToggleHover then
			if NavOpen then
				CloseNavigation()
			else
				OpenNavigation()
			end
			NavOpen = not NavOpen
		end
	end)

	-- All other hover stuffs
	do
		Version.MouseEnter:Connect(function()
			Library:tween(Version, {TextColor3 = Color3.fromRGB(200,200,200)})
		end)

		Version.MouseLeave:Connect(function()
			Library:tween(Version, {TextColor3 = Color3.fromRGB(100,100,100)})
		end)

		Title.MouseEnter:Connect(function()
			Library:tween(Title, {TextColor3 = Color3.fromRGB(255,255,255)})
		end)

		Title.MouseLeave:Connect(function()
			Library:tween(Title, {TextColor3 = Color3.fromRGB(200,200,200)})
		end)

		NavigationToggle.MouseEnter:Connect(function()
			NavToggleHover = true

			Library:tween(NavigationToggle, {ImageColor3 = Color3.fromRGB(255,255,255)})
		end)

		NavigationToggle.MouseLeave:Connect(function()
			NavToggleHover = false

			Library:tween(NavigationToggle, {ImageColor3 = Color3.fromRGB(200,200,200)})
		end)
	end

	function This:Tab(args)
		args = Library:Validate({
			Text = "Tab",
			Icon = ""
		}, args or {})

		local Tab = {
			Hover = false,
			Active = false
		}

		local TabButton = TabButtonTemplate:Clone()
		local TabFrame = TemplateTab:Clone()
		local Icon = TabButton.TestTabButtonImage

		repeat wait() until Navigation.Size == UDim2.new(0, 150, 0, 330)

		TabFrame.Name = args.Text
		TabButton.Name = args.Text
		TabButton.TextTabButton.Text = args.Text
		Icon.Image = args.Icon

		TabButton.Parent = Navigation.Layout
		TabFrame.Parent = TabHolder
		TabButton.Visible = true

		TabButton.TestTabButtonImage.Name = TabButton.Name.." TabButtonImage"

		function Tab:Activate()
			if not Tab.Active then
				if This.CurrentTab ~= nil then
					This.CurrentTab:Deactivate()
				end

				Tab.Active = true
				TabFrame.Visible = true

				Library:tween(TabButton.TextTabButton, {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(150,150,150)})

				This.CurrentTabName = TabFrame.Name
				This.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false

				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(20,20,20)})

				TabFrame.Visible = false
			end
		end

		TabButton.MouseEnter:Connect(function()
			Tab.Hover = true

			Library:tween(TabButton.TextTabButton, {TextColor3 = Color3.fromRGB(255,255,255)})
			if Tab.Active ~= true then
				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(88,88,88)})
			end			
		end)

		TabButton.TextTabButton.MouseEnter:Connect(function()
			Tab.Hover = true

			Library:tween(TabButton.TextTabButton, {TextColor3 = Color3.fromRGB(255,255,255)})
			if Tab.Active ~= true then
				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(88,88,88)})
			end		
		end)

		TabButton.MouseLeave:Connect(function()
			Tab.Hover = false

			Library:tween(TabButton.TextTabButton, {TextColor3 = Color3.fromRGB(200,200,200)})
			if Tab.Active ~= true then
				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(20,20,20)})
			end
		end)

		TabButton.TextTabButton.MouseLeave:Connect(function()
			Tab.Hover = false

			Library:tween(TabButton.TextTabButton, {TextColor3 = Color3.fromRGB(200,200,200)})
			if Tab.Active ~= true then
				Library:tween(TabButton.UIStrokeTestCircleButton, {Color = Color3.fromRGB(20,20,20)})
			end
		end)

		UserInputService.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and Tab.Hover and Navigation.Visible == true then
				Tab:Activate()
			end
		end)

		if This.CurrentTab == nil then
			Tab:Activate()
		end
		
		function Tab:Button(args)
			args = Library:Validate({
				Text = "Tab",
				Icon = "",
				NotificationText = nil,
				Callback = function() end
			}, args or {})

			local Button = {
				Hover = false,
				MouseDown = false
			}

			local RenderedButton = TemplateButton:Clone()
			RenderedButton.Visible = true
			RenderedButton.Name = args.Text
			RenderedButton.Parent = TabFrame.Holder

			local ButtonText = RenderedButton.TextLabelTemplateButton
			ButtonText.Text = "  "..args.Text

			RenderedButton.ButtonImage.Image = args.Icon

			function Button:SetText(s)
				s = s or "nil"
				ButtonText.Text = "  "..tostring(s)
			end

			function Button:SetCallback(func)
				func = func or function() end
				args.Callback = func
			end

			RenderedButton.MouseEnter:Connect(function()
				if NavOpen == false then
					Button.Hover = true

					if not Button.MouseDown then
						Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
						Library:tween(RenderedButton.UIStrokeTemplateButton, {Transparency = 0})
						Library:tween(ButtonText, {TextColor3 = Color3.fromRGB(255,255,255)})
					end	
				end
			end)

			RenderedButton.MouseLeave:Connect(function()
				Button.Hover = false

				if not Button.MouseDown then
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					Library:tween(RenderedButton.UIStrokeTemplateButton, {Transparency = 1})
					Library:tween(ButtonText, {TextColor3 = Color3.fromRGB(200,200,200)})
				end	
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
					Button.MouseDown = true
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(68,68,68)})

					if args.NotificationText ~= nil then
						warn("Notifications aren't done yet")
					end

					args.Callback()
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.MouseDown then
					Button.MouseDown = false
					Library:tween(RenderedButton, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					
					if not Button.Hover then
						Library:tween(RenderedButton.UIStrokeTemplateButton, {Transparency = 1})
					end
				end
			end)

			return Button
		end
		
		function Tab:Toggle(args)
			args = Library:Validate({
				Text = "Toggle",
				Callback = function() end
			}, args or {})

			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}

			local RenderedToggle = TemplateToggle:Clone()
			RenderedToggle.Visible = true
			RenderedToggle.Parent = TabFrame.Holder

			local ToggleText = RenderedToggle.TextLabelTemplateToggle
			ToggleText.Text = "  "..args.Text

			function Toggle:Toggle(v)
				if v == nil then
					Toggle.State = not Toggle.State
				else
					Toggle = v
				end

				if Toggle.State then
					Library:tween(RenderedToggle.CheckHolder.CheckmarkImage, {ImageTransparency = 0})
				else
					Library:tween(RenderedToggle.CheckHolder.CheckmarkImage, {ImageTransparency = 1})
				end

				args.Callback(Toggle.State)
			end

			RenderedToggle.MouseEnter:Connect(function()
				if NavOpen == false then
					Toggle.Hover = true

					if not Toggle.MouseDown then
						Library:tween(ToggleText, {TextColor3 = Color3.fromRGB(255,255,255)})
						Library:tween(RenderedToggle, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
						Library:tween(RenderedToggle.CheckHolder, {BackgroundColor3 = Color3.fromRGB(58,58,58)})
						Library:tween(RenderedToggle.UIStrokeTemplateToggle, {Transparency = 0})
					end
				end
			end)

			RenderedToggle.MouseLeave:Connect(function()
				Toggle.Hover = false
				
				if not Toggle.MouseDown then
					Library:tween(ToggleText, {TextColor3 = Color3.fromRGB(200,200,200)})
					Library:tween(RenderedToggle, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					Library:tween(RenderedToggle.CheckHolder, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
					Library:tween(RenderedToggle.UIStrokeTemplateToggle, {Transparency = 1})
				end
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
					Toggle.MouseDown = true
					Toggle:Toggle()
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.MouseDown then
					Toggle.MouseDown = false
					
					Library:tween(RenderedToggle, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					Library:tween(RenderedToggle.CheckHolder, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
					
					if not Toggle.Hover then
						Library:tween(RenderedToggle.UIStrokeTemplateToggle, {Transparency = 1})
					end
				end
			end)

			return Toggle
		end
		
		function Tab:ImageLabel(args)
			args = Library:Validate({
				Image = "rbxassetid://18703386053",
			}, args or {})

			local ImageLabel = {
				Hover = false,
				MouseDown = false
			}

			local RenderedImageLabel = TemplateImage:Clone()
			RenderedImageLabel.Parent = TabFrame.Holder
			RenderedImageLabel.Visible = true

			RenderedImageLabel.ImageLabelImage.Image = args.Image

			function ImageLabel:SetImage(id)
				RenderedImageLabel.ImageLabelImage.Image = id
			end

			RenderedImageLabel.MouseEnter:Connect(function()
				if NavOpen == false then
					ImageLabel.Hover = true
					if not ImageLabel.MouseDown then
						Library:tween(RenderedImageLabel, {BackgroundColor3 = Color3.fromRGB(53,53,53)})
						Library:tween(RenderedImageLabel.UiStrokeTemplateImage, {Transparency = 0})
					end
				end
			end)

			RenderedImageLabel.MouseLeave:Connect(function()
				ImageLabel.Hover = false
				if not ImageLabel.MouseDown then
					Library:tween(RenderedImageLabel, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					Library:tween(RenderedImageLabel.UiStrokeTemplateImage, {Transparency = 1})
				end
			end)

			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and ImageLabel.Hover then
					ImageLabel.MouseDown = true
					Library:tween(RenderedImageLabel.UiStrokeTemplateImage, {Color = Color3.fromRGB(80,80,80)})
					Library:tween(RenderedImageLabel, {BackgroundColor3 = Color3.fromRGB(68,68,68)})
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and ImageLabel.MouseDown then
					ImageLabel.MouseDown = false
					Library:tween(RenderedImageLabel, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
					Library:tween(RenderedImageLabel.UiStrokeTemplateImage, {Color = Color3.fromRGB(67, 67, 67)})

					if not ImageLabel.Hover then
						Library:tween(RenderedImageLabel.UiStrokeTemplateImage, {Transparency = 1})
					end
				end
			end)

			return ImageLabel 
		end
		
		function Tab:Keybind(args)
			args = Library:Validate({
				Text = "  Keybind",
				Keybind = Enum.KeyCode.One,
				Callback = function() end
			}, args or {})

			local Keybind = {
				Hover = false,
				MouseDown = false,
				Key = args.Keybind,
				BindTextHover = false,
				SettingKey = false,
				Connection = nil
			}

			local keys = {
				[Enum.KeyCode.One] = "1",
				[Enum.KeyCode.Two] = "2",
				[Enum.KeyCode.Three] = "3",
				[Enum.KeyCode.Four] = "4",
				[Enum.KeyCode.Five] = "5",
				[Enum.KeyCode.Six] = "6",
				[Enum.KeyCode.Seven] = "7",
				[Enum.KeyCode.Eight] = "8",
				[Enum.KeyCode.Nine] = "9",
				[Enum.KeyCode.Zero] = "0",
				[Enum.KeyCode.Period] = ".",
				[Enum.KeyCode.Slash] = "/",
				[Enum.KeyCode.BackSlash] = "\\",
				[Enum.KeyCode.Insert] = "INS",
				[Enum.KeyCode.Semicolon] = ";",
				[Enum.KeyCode.Return] = "ENT",
				[Enum.KeyCode.Quote] = "'",
				[Enum.KeyCode.LeftAlt] = "LALT",
				[Enum.KeyCode.LeftShift] = "LSHIFT",
				[Enum.KeyCode.RightAlt] = "RALT",
				[Enum.KeyCode.RightShift] = "RSHIFT"
			}

			local RenderedKeybind = TemplateBind:Clone()
			RenderedKeybind.Parent = TabFrame.Holder
			RenderedKeybind.Visible = true
			RenderedKeybind.TextLabelTemplateBind.Text = "  "..args.Text
			RenderedKeybind.Name = args.Text
			RenderedKeybind.BindText.Text = keys[args.Keybind] or args.Keybind.Name

			RenderedKeybind.MouseEnter:Connect(function()
				if NavOpen then return end

				Keybind.Hover = true

				if not Keybind.MouseDown then
					Library:tween(RenderedKeybind.UiStrokeTemplateBind, {Transparency = 0})
					Library:tween(RenderedKeybind.TextLabelTemplateBind, {TextColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			RenderedKeybind.MouseLeave:Connect(function()
				Keybind.Hover = false

				if not Keybind.MouseDown then
					Library:tween(RenderedKeybind.UiStrokeTemplateBind, {Transparency = 1})
					Library:tween(RenderedKeybind.TextLabelTemplateBind, {TextColor3 = Color3.fromRGB(200,200,200)})
				end
			end)

			RenderedKeybind.BindText.MouseEnter:Connect(function()
				if NavOpen then return end

				Keybind.BindTextHover = true
				Library:tween(RenderedKeybind.BindText, {TextColor3 = Color3.fromRGB(255,255,255)})
			end)

			RenderedKeybind.BindText.MouseLeave:Connect(function()
				Keybind.BindTextHover = false
				Library:tween(RenderedKeybind.BindText, {TextColor3 = Color3.fromRGB(200,200,200)}) 
			end)

			UserInputService.InputBegan:Connect(function(input, gpe)
				if gpe then return end
				if input.KeyCode == Keybind.Key and not Keybind.SettingKey then
					args.Callback()
				end
			end)

			UserInputService.InputBegan:Connect(function(input, gpe)
				if NavOpen then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.BindTextHover and not Keybind.SettingKey then
					RenderedKeybind.BindText.Text = "..."
					Keybind.SettingKey = true

					Keybind.Connection = UserInputService.InputBegan:Connect(function(inp)
						if keys[inp.KeyCode] then
							RenderedKeybind.BindText.Text = keys[inp.KeyCode]
						else
							RenderedKeybind.BindText.Text = inp.KeyCode.Name
						end

						Keybind.Key = inp.KeyCode
						args.Keybind = inp.KeyCode

						task.delay(.1, function()
							Keybind.SettingKey = false
							if Keybind.Connection then
								Keybind.Connection:Disconnect()
							end
							Keybind.Connection = nil
						end)
					end)
				end
			end)

			return Keybind
		end

		function Tab:Label(args)
			args = Library:Validate({
				Text = "",
				TextColor = Color3.fromRGB(200,200,200),
				Font = Enum.Font.GothamMedium
			}, args or {})

			local Label = {}

			local RenderedLabel = TemplateLabel:Clone()
			RenderedLabel.Visible = true
			local Text = RenderedLabel.TextLabelTemplateLabel

			RenderedLabel.Parent = TabFrame.Holder
			Text.Font = args.Font
			Text.Text = "  "..args.Text

			function Label:SetText(s)
				Text.Text = tostring(s)	
			end

			return Label
		end
		
		function Tab:Player(args)
			args = Library:Validate({
				Player = nil
			}, args or {})
			
			local PlayerInfo = {
				TargetHover = false,
				SpectateHover = false
			}
			
			local RenderedPlayer = TemplatePlayerInfo:Clone()
			RenderedPlayer.Parent = TabFrame.Holder
			RenderedPlayer.Visible = true
			RenderedPlayer.Name = args.Player.Name.."_"..args.Player.UserId
			RenderedPlayer.PlayerImage.Image = Players:GetUserThumbnailAsync(args.Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
			RenderedPlayer.TextLabelTemplatePlayerInfo.Text = "  "..args.Player.DisplayName
			RenderedPlayer.TextLabelTemplatePlayerInfoUid.Text = "  "..args.Player.UserId
			
			function PlayerInfo:SetPlayer(player)
				args.Player = player
				
				RenderedPlayer.Name = args.Player.Name.."_"..args.Player.UserId
				RenderedPlayer.PlayerImage.Image = Players:GetUserThumbnailAsync(args.Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
				RenderedPlayer.TextLabelTemplatePlayerInfo.Text = "  "..args.Player.DisplayName
				RenderedPlayer.TextLabelTemplatePlayerInfoUid.Text = "  "..args.Player.UserId
			end
			
			RenderedPlayer.MouseEnter:Connect(function()
				if NavOpen then return end

				Library:tween(RenderedPlayer.UiStrokeTemplatePlayerInfo, {Transparency = 0})
				Library:tween(RenderedPlayer, {BackgroundColor3 = Color3.fromRGB(53,53,53)})
			end)
			
			RenderedPlayer.MouseLeave:Connect(function()
				if NavOpen then return end

				Library:tween(RenderedPlayer.UiStrokeTemplatePlayerInfo, {Transparency = 1})
				Library:tween(RenderedPlayer, {BackgroundColor3 = Color3.fromRGB(48,48,48)})
			end)
			
			RenderedPlayer.TargetSelect.MouseEnter:Connect(function()
				PlayerInfo.TargetHover = true
				
				Library:tween(RenderedPlayer.TargetSelect, {ImageColor3 = Color3.fromRGB(255,255,255)})
			end)
			
			RenderedPlayer.TargetSelect.MouseLeave:Connect(function()
				PlayerInfo.TargetHover = false

				Library:tween(RenderedPlayer.TargetSelect, {ImageColor3 = Color3.fromRGB(200,200,200)})
			end)
			
			RenderedPlayer.Spectate.MouseEnter:Connect(function()
				PlayerInfo.SpectateHover = true

				Library:tween(RenderedPlayer.Spectate, {ImageColor3 = Color3.fromRGB(255,255,255)})
			end)

			RenderedPlayer.Spectate.MouseLeave:Connect(function()
				PlayerInfo.SpectateHover = false

				Library:tween(RenderedPlayer.Spectate, {ImageColor3 = Color3.fromRGB(200,200,200)})
			end)
			
			UserInputService.InputBegan:Connect(function(input)
				if NavOpen then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 and PlayerInfo.TargetHover then
					This.TargetPlayer = args.Player
				end
				
				if input.UserInputType == Enum.UserInputType.MouseButton1 and PlayerInfo.SpectateHover then
					if not args.Player.Character then
						return
					end

					if workspace.CurrentCamera.CameraSubject ~= Player.Character.Humanoid then
						workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
					else
						workspace.CurrentCamera.CameraSubject = args.Player.Character:WaitForChild("Humanoid")
					end
				end
			end)
			
			local HealthSet = RenderStepped(function()
				if not args.Player.Character then
					RenderedPlayer.TextLabelTemplatePlayerInfoPing.Text = "N/A"
					RenderedPlayer.HealthImage.ImageColor3 = Color3.fromRGB(200,200,200)
					return
				end
				
				local Health = math.floor(args.Player.Character:WaitForChild("Humanoid").Health)
				
				local color
				if Health >= 70 then
					color = Color3.fromRGB(0, 255, 0)
				elseif Health >= 50 then
					color = Color3.fromRGB(255, 255, 0)
				elseif Health >= 30 then
					color = Color3.fromRGB(255, 179, 0)
				else
					color = Color3.fromRGB(255, 0, 0)
				end
				
				RenderedPlayer.TextLabelTemplatePlayerInfoPing.Text = Health.."%"
				RenderedPlayer.HealthImage.ImageColor3 = color
			end)
			
			return PlayerInfo
		end
		
		return Tab
	end

	return This
end

task.defer(function()
	if self._Window == nil then
		Roblox_Notification("Would you like to load an example?", {"Yes", "No"}, function(answer)
			if answer == "Yes" then
				printColor("Loading example.", Color3.fromRGB(35,35,35))
				loadstring(game:HttpGet(self.url.."Example.lua"))()
			end
		end)
	end
end)

return Library
