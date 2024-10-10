local module = {}

local TweenService = game:GetService("TweenService")

function module.Start(library)
	local Tabler = {}
	local Loader = Instance.new("ScreenGui")
	local Loader_2 = Instance.new("Frame")
	local UICornerLoader = Instance.new("UICorner")
	local MSG = Instance.new("TextLabel")
	local BackProgressBar = Instance.new("Frame")
	local UICornerProgressBar = Instance.new("UICorner")
	local Fill = Instance.new("Frame")
	local UICornerFill = Instance.new("UICorner")
	local ImageLabel = Instance.new("ImageLabel")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")

	Loader.Name = "Loader"
	Loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Loader_2.Name = "Loader"
	Loader_2.Parent = Loader
	Loader_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Loader_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Loader_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Loader_2.BorderSizePixel = 0
	Loader_2.Position = UDim2.new(0.477335811, 0, 0.472972959, 0)
	Loader_2.Size = UDim2.new(0, 368, 0, 208)

	UICornerLoader.CornerRadius = UDim.new(0, 4)
	UICornerLoader.Name = "UICornerLoader"
	UICornerLoader.Parent = Loader_2

	MSG.Name = "MSG"
	MSG.Parent = Loader_2
	MSG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MSG.BackgroundTransparency = 1.000
	MSG.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MSG.BorderSizePixel = 0
	MSG.Position = UDim2.new(0.321371317, 0, 0.662806749, 0)
	MSG.Size = UDim2.new(0, 129, 0, 23)
	MSG.Font = Enum.Font.GothamMedium
	MSG.Text = "Loading Modules"
	MSG.TextColor3 = Color3.fromRGB(200, 200, 200)
	MSG.TextSize = 15.000

	BackProgressBar.Name = "BackProgressBar"
	BackProgressBar.Parent = Loader_2
	BackProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	BackProgressBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BackProgressBar.BorderSizePixel = 0
	BackProgressBar.Position = UDim2.new(0.20505856, 0, 0.773801923, 0)
	BackProgressBar.Size = UDim2.new(0, 215, 0, 15)

	UICornerProgressBar.CornerRadius = UDim.new(0, 2)
	UICornerProgressBar.Name = "UICornerProgressBar"
	UICornerProgressBar.Parent = BackProgressBar

	Fill.Name = "Fill"
	Fill.Parent = BackProgressBar
	Fill.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Fill.BorderSizePixel = 0
	Fill.Size = UDim2.new(0, 0, 1, 0)

	UICornerFill.CornerRadius = UDim.new(0, 2)
	UICornerFill.Name = "UICornerFill"
	UICornerFill.Parent = Fill

	ImageLabel.Parent = Loader_2
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.223035067, 0, 0.120428815, 0)
	ImageLabel.Size = UDim2.new(0, 190, 0, 104)
	ImageLabel.Image = library:GetRandomImage()

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Loader_2
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

	function Tabler:SetMessage(s)
		MSG.Text = s
		print(s)
	end

	function Tabler:SetProgress(n)
		TweenService:Create(Fill, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(Fill.Size.X.Scale + n, 0, 1, 0)}):Play()
	end
	
	task.delay(1.2, function()
		Tabler:SetProgress(.95)
		Tabler:SetMessage("Almost done")
		task.wait(1)
		Tabler:SetProgress(.05)
		Tabler:SetMessage("Done")
		
		task.wait(.25)
		
		game:GetService("JointsService").Loaded.Value = true
		
		Loader:Destroy()
		
		Tabler = nil
		module = nil
	end)

	return Tabler
end

return module
