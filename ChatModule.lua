-- Sigh this module is so annoying too make. Gonna have to make a topbar thingy and filter messages I think.

local MarketplaceService = game:GetService("MarketplaceService")
local TextChatService = game:GetService("TextChatService")
local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local function tween(object, goal, speed, callback)
	local tween = TweenService:Create(object, TweenInfo.new(speed or .2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local self = {}

local module = {
	Messages = {}
}

module.__index = module

setmetatable(self, module)

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

for i,v in pairs(TextChatService:WaitForChild("TextChatCommands"):GetChildren()) do
	if v.Name ~= "RBXEmoteCommand" then
		v.Enabled = false
	end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Players.LocalPlayer.PlayerGui

local BackFrame = Instance.new("Frame")
local UICornerBackFrame = Instance.new("UICorner")
local ChatBox = Instance.new("Frame")
local UICornerChatBox = Instance.new("UICorner")
local UIStrokeChatBox = Instance.new("UIStroke")
local TextBox = Instance.new("TextBox")
local Messages = Instance.new("ScrollingFrame")
local UICornerMessages = Instance.new("UICorner")
local UIListLayoutMessages = Instance.new("UIListLayout")
local TextLabelTemplate = Instance.new("TextLabel")
local GradientHolder = Instance.new("Frame")
local UIGradientHolder = Instance.new("UIGradient")
local UICornerGradientHolder = Instance.new("UICorner")
local EmojiSuggestionTemplate = Instance.new("Frame")
local UICornerEmojiTemplate = Instance.new("UICorner")
local EmojiLabel = Instance.new("TextLabel")
local UICornerEmojiLabel = Instance.new("UICorner")

BackFrame.Name = "BackFrame"
BackFrame.Parent = ScreenGui
BackFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrame.BackgroundTransparency = 1.000
BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrame.BorderSizePixel = 0
BackFrame.Position = UDim2.new(0.00801974069, 0, 0.0132145705, 0)
BackFrame.Size = UDim2.new(0, 450, 0, 290)

UICornerBackFrame.CornerRadius = UDim.new(0, 6)
UICornerBackFrame.Name = "UICornerBackFrame"
UICornerBackFrame.Parent = BackFrame

ChatBox.Name = "ChatBox"
ChatBox.Parent = BackFrame
ChatBox.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
ChatBox.BackgroundTransparency = 0.970
ChatBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatBox.BorderSizePixel = 0
ChatBox.Position = UDim2.new(0.0155555559, 0, 0.875862062, 0)
ChatBox.Size = UDim2.new(0, 436, 0, 30)
ChatBox.ZIndex = 2

UICornerChatBox.CornerRadius = UDim.new(0, 4)
UICornerChatBox.Name = "UICornerChatBox"
UICornerChatBox.Parent = ChatBox

UIStrokeChatBox.Color = Color3.fromRGB(154, 154, 154)
UIStrokeChatBox.Thickness = 0.699999988079071
UIStrokeChatBox.Name = "UIStrokeChatBox"
UIStrokeChatBox.Parent = ChatBox

TextBox.Parent = ChatBox
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0137614682, 0, 0, 0)
TextBox.Size = UDim2.new(0.986238539, 0, 1, 0)
TextBox.Font = Enum.Font.GothamMedium
TextBox.PlaceholderColor3 = Color3.fromRGB(249, 249, 249)
TextBox.PlaceholderText = "Click here or use '/' to chat"
TextBox.Text = ""
TextBox.TextWrapped = true
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextTransparency = 0.440
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ZIndex = 3

Messages.Name = "Messages"
Messages.Parent = BackFrame
Messages.Active = true
Messages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Messages.BackgroundTransparency = 1.000
Messages.BorderColor3 = Color3.fromRGB(0, 0, 0)
Messages.BorderSizePixel = 0
Messages.Position = UDim2.new(3.3908421e-08, 0, 0, 0)
Messages.Size = UDim2.new(0.99999994, 0, 0.855172396, 0)
Messages.ScrollBarThickness = 5
Messages.ScrollBarImageTransparency = 1

UICornerMessages.CornerRadius = UDim.new(0, 4)
UICornerMessages.Name = "UICornerMessages"
UICornerMessages.Parent = Messages

UIListLayoutMessages.Name = "UIListLayoutMessages"
UIListLayoutMessages.Parent = Messages
UIListLayoutMessages.SortOrder = Enum.SortOrder.LayoutOrder

TextLabelTemplate.Parent = Messages
TextLabelTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabelTemplate.BackgroundTransparency = 1.000
TextLabelTemplate.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabelTemplate.TextTransparency = 1
TextLabelTemplate.BorderSizePixel = 0
TextLabelTemplate.Size = UDim2.new(.95, 0, 0, 15)
TextLabelTemplate.Font = Enum.Font.Gotham
TextLabelTemplate.TextWrapped = true
TextLabelTemplate.RichText = true
TextLabelTemplate.Text = "<font weight=\"bold\"><font face=\"Montserrat\"><font color=\"#EFC3CA\">[Tag]</font></font></font> <font color=\"#FFDE59\">Farleyy</font>: Text Message"
TextLabelTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabelTemplate.TextSize = 15.000
TextLabelTemplate.Visible = false
TextLabelTemplate.TextXAlignment = Enum.TextXAlignment.Left

GradientHolder.Name = "GradientHolder"
GradientHolder.Parent = BackFrame
GradientHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientHolder.BackgroundTransparency = 1.000
GradientHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
GradientHolder.BorderSizePixel = 0
GradientHolder.Position = UDim2.new(-3.3908421e-08, 0, 0.875862062, 0)
GradientHolder.Size = UDim2.new(0, 450, 0, 36)

UIGradientHolder.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradientHolder.Rotation = 90
UIGradientHolder.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.82)}
UIGradientHolder.Name = "UIGradientHolder"
UIGradientHolder.Parent = GradientHolder

UICornerGradientHolder.CornerRadius = UDim.new(0, 4)
UICornerGradientHolder.Name = "UICornerGradientHolder"
UICornerGradientHolder.Parent = GradientHolder

EmojiSuggestionTemplate.Name = "EmojiSuggestionTemplate"
EmojiSuggestionTemplate.Visible = false
EmojiSuggestionTemplate.Parent = GradientHolder
EmojiSuggestionTemplate.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EmojiSuggestionTemplate.BackgroundTransparency = 0.100
EmojiSuggestionTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
EmojiSuggestionTemplate.BorderSizePixel = 0
EmojiSuggestionTemplate.Position = UDim2.new(0.016, 0, 0.15, 0)
EmojiSuggestionTemplate.Size = UDim2.new(0, 65, 0, 25)

UICornerEmojiTemplate.CornerRadius = UDim.new(0, 4)
UICornerEmojiTemplate.Name = "UICornerEmojiTemplate"
UICornerEmojiTemplate.Parent = EmojiSuggestionTemplate

EmojiLabel.Name = "EmojiLabel"
EmojiLabel.Parent = EmojiSuggestionTemplate
EmojiLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EmojiLabel.BackgroundTransparency = 1.000
EmojiLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
EmojiLabel.BorderSizePixel = 0
EmojiLabel.Size = UDim2.new(1, 0, 1, 0)
EmojiLabel.Font = Enum.Font.GothamMedium
EmojiLabel.Text = "😭  sob"
EmojiLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
EmojiLabel.TextSize = 17.000

UICornerEmojiLabel.CornerRadius = UDim.new(0, 4)
UICornerEmojiLabel.Name = "UICornerEmojiLabel"
UICornerEmojiLabel.Parent = EmojiLabel

local Hover = false

BackFrame.MouseEnter:Connect(function()
	Hover = true
	tween(GradientHolder, {Transparency = 0})
	tween(Messages, {ScrollBarImageTransparency = 0})
	tween(ChatBox, {Transparency = .25})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(0,0,0)})
end)

BackFrame.MouseLeave:Connect(function()
	Hover = false
	if not TextBox:IsFocused() then
		tween(GradientHolder, {Transparency = 1})
		tween(Messages, {ScrollBarImageTransparency = 1})
		tween(ChatBox, {Transparency = .970})
		tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(11,11,11)})
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end

	if input.KeyCode == Enum.KeyCode.Slash then
		task.wait(0.01)
		TextBox:CaptureFocus()
	end
end)

local ColorTable = {
	"#3E8EC6",  -- Blue
	"#8D6F64",  -- Brown
	"#A63939",  -- Red
	"#5C4B51",  -- Dark Gray
	"#8E44AD",  -- Purple
	"#3498DB",  -- Light Blue
	"#E67E22",  -- Orange
	"#27AE60",  -- Green
	"#F39C12",  -- Yellow
	"#C0392B",  -- Dark Red
	"#1F618D",  -- Deep Blue
	"#D35400",  -- Orange-Red
	"#7D3F2A",  -- Deep Brown
	"#F4D03F",  -- Gold
	"#D5DBDB",  -- Light Gray
	"#9B59B6",  -- Medium Purple
	"#16A085",  -- Teal
	"#E74C3C",  -- Bright Red
	"#2ECC71",  -- Light Green
	"#F5B041",  -- Peach
	"#BDC3C7",  -- Silver
	"#AAB7B8"   -- Gray
}

function module:GetTextChatVersion()
	return TextChatService.ChatVersion
end

function module:FilterMessage(Message, Sender)
	local filtered
	local success, error = pcall(function()
		filtered = game.Chat:FilterStringForBroadcast(Message, Sender)
	end)

	if success then
		return filtered
	else
		warn("Failed to filter message:", error)
	end
end

function module:ChatTag(Tag, Color)
	return "<font weight=\"bold\"><font face=\"Montserrat\"><font color=\""..Color.."\">"..tostring(Tag).."</font></font></font>"
end

local lastMessagePosition = UDim2.new(0, 0, 0, 0)

function module.RenderMessage(Sender, Message, ChatTag)
	local emojiPattern = "[%z\1-\31\127-\255\194-\244][\128-\191][\128-\191]*"

	if string.len(Message) < 1 then
		print("Not enough text!")
		return
	end
	if Players:FindFirstChild(Sender.Name) then
		if Sender:GetAttribute("Muted") == true then return end
	end

	local Label = TextLabelTemplate:Clone()
	Label.Name = "Message_"..Sender.UserId
	Label.Parent = Messages
	Label.Visible = true
	table.insert(module.Messages, Label)

	ChatTag = ChatTag or ""

	if Sender == Players.LocalPlayer then
		Label.Text = "<font color=\"#FFDE59\">"..Sender.DisplayName.."</font>: "..tostring(Message)
	elseif Sender.Name == "System" then
		Label.Text = ChatTag..": "..tostring(Message)
	elseif Players.LocalPlayer:IsFriendsWith(Sender.UserId) then
		Label.Text = "<font color=\""..Sender:GetAttribute("TextColor").."\">"..Sender.DisplayName.."</font>: "..tostring(Message)
	else
		Label.Text = ChatTag.."<font color=\""..Sender:GetAttribute("TextColor").."\">"..Sender.DisplayName.."</font>:"..tostring(Message)
	end

	local function setText(s:string)
		print(s:gsub(emojiPattern, ""):gsub("<[^>]+>", ""))
		return s:gsub(emojiPattern, "")
	end

	if Sender.Name ~= "System" then
		local textSize = TextService:GetTextSize(setText(Label.Text), Label.TextSize, Label.Font, Vector2.new(Label.AbsoluteSize.X, math.huge))
		Label.Size = UDim2.new(0, textSize.X, 0, textSize.Y + 3)
	end

	tween(Label, {TextTransparency = 0}, .15)
end

function module:SendSystemMessage(Message)
	local System = {
		Name = "System",
		DisplayName = "System",
		UserId = -1
	}
	module.RenderMessage(System, Message, module:ChatTag("[System]", "#AAB7B8"))
end

self:SendSystemMessage("/help for a list of commands")

function module.SendMessage(Message, Recipent, Callback)
	Callback = Callback or function() end
	--Message = module:FilterMessage(Message, Players.LocalPlayer)
	if module:GetTextChatVersion() == Enum.ChatVersion.LegacyChatService and string.len(Message) > 0 then
		local args = {
			[1] = Message,
			[2] = Recipent or "All",
		}
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	elseif module:GetTextChatVersion() == Enum.ChatVersion.TextChatService and string.len(TextBox.Text) > 0 then
		TextChatService:WaitForChild("TextChannels").RBXGeneral:SendAsync(tostring(Message))
	end
	Callback()
end

function module.ConnectPlayerChatEvent(player)
	if module:GetTextChatVersion() == Enum.ChatVersion.LegacyChatService then
		player.Chatted:Connect(function(Message)
			module.RenderMessage(player, Message)
		end)
	elseif module:GetTextChatVersion() == Enum.ChatVersion.TextChatService then
		TextChatService.OnIncomingMessage = function(Message:TextChatMessage)
			if player.UserId == Message.TextSource.UserId then
				module.RenderMessage(player, Message.Text)
			end
		end
	end
end

local Commands = {}

function Commands.Clear()
	for _,v in pairs(module.Messages) do
		v:Destroy()
		module:SendSystemMessage("/help for a list of commands")
	end
end
function Commands.Mute(player)
	player:SetAttribute("Muted", true)
	module:SendSystemMessage(player.DisplayName.." has been muted.")
end
function Commands.Unmute(player)
	player:SetAttribute("Muted", false)
	module:SendSystemMessage(player.DisplayName.." has been unmuted.")
end
function Commands.Help()
	module:SendSystemMessage("/clear to clear all messages")
	module:SendSystemMessage("/mute <player> to mute a player")
	module:SendSystemMessage("/unmute <player> to unmute a player")
end

TextBox.Focused:Connect(function()
	tween(GradientHolder, {Transparency = 0})
	tween(Messages, {ScrollBarImageTransparency = 0})
	tween(ChatBox, {Transparency = .25})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(0,0,0)})
	tween(TextBox, {TextTransparency = 0})				
end)

TextBox.FocusLost:Connect(function(ep)
	tween(ChatBox, {Transparency = .970})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(11,11,11)})
	tween(TextBox, {TextTransparency = .44})

	if Hover == false then
		tween(GradientHolder, {Transparency = 1})
	end

	if ep then	
		module.SendMessage(TextBox.Text, "All")
		module.RenderMessage(Players.LocalPlayer, TextBox.Text)
	end
	TextBox.Text = ""
end)

local Friends = {}

for _,v in pairs(Players:GetPlayers()) do
	
	if v ~= Players.LocalPlayer then
		if Players.LocalPlayer:IsFriendsWith(v.UserId) then
			table.insert(Friends, v.Name)
			if #Friends > 0 then
				module:SendSystemMessage("Your friend(s) in this server: "..table.concat(Friends, ","))
			end
		end
		
		module.ConnectPlayerChatEvent(v)
		v:SetAttribute("TextColor", ColorTable[math.random(1, #ColorTable)])
	end
end

Players.PlayerAdded:Connect(function(player)
	if Players.LocalPlayer:IsFriendsWith(player.UserId) then
		module:SendSystemMessage("Your friend "..player.Name.." joined the server!")
	end
	module.ConnectPlayerChatEvent(player)
	player:SetAttribute("TextColor", ColorTable[math.random(1, #ColorTable)])
end)

local Emojis = {
	List = {
		["sob"] = "😭",
		["skull"] = "💀",
		["smile"] = "😊",
		["heart"] = "❤️",
		["thumbsup"] = "👍",
		["pray"] = "🙏",
		["fire"] = "🔥",
		["laugh"] = "😂",
		["sad"] = "😢",
		["angry"] = "😠",
		["cry"] = "😭",
		["wink"] = "😉",
		["star"] = "⭐",
		["sunglasses"] = "😎",
		["clap"] = "👏",
		["kiss"] = "😘",
		["thinking"] = "🤔",
		["party"] = "🎉",
		["love"] = "💖",
		["starstruck"] = "🤩",
		["scream"] = "😱",
		["facepalm"] = "🤦",
		["hug"] = "🤗",
		["cool"] = "😎",
		["shocked"] = "😳",
		["pensive"] = "😔",
		["sweat"] = "😓",
		["grin"] = "😁",
		["smirk"] = "😏",
		["blush"] = "😊",
		["neutral"] = "😐",
		["sleep"] = "😴",
		["unamused"] = "😒",
		["roll_eyes"] = "🙄",
		["zipper_mouth"] = "🤐",
		["nerd"] = "🤓",
		["monkey"] = "🐒",
		["dog"] = "🐶",
		["cat"] = "🐱",
		["rabbit"] = "🐰",
		["penguin"] = "🐧",
		["frog"] = "🐸",
		["bear"] = "🐻",
		["koala"] = "🐨",
		["tiger"] = "🐯",
		["lion"] = "🦁",
		["elephant"] = "🐘",
		["giraffe"] = "🦒",
		["zebra"] = "🦓",
		["horse"] = "🐴",
		["unicorn"] = "🦄",
		["dragon"] = "🐲",
		["snake"] = "🐍",
		["turtle"] = "🐢",
		["fish"] = "🐟",
		["whale"] = "🐋",
		["dolphin"] = "🐬",
		["octopus"] = "🐙",
		["crab"] = "🦀",
		["lobster"] = "🦞",
		["beetle"] = "🐞",
		["butterfly"] = "🦋",
		["bug"] = "🐛",
		["sun"] = "☀️",
		["cloud"] = "☁️",
		["rain"] = "🌧️",
		["snowflake"] = "❄️",
		["wind"] = "🌬️",
		["thunder"] = "⛈️",
		["rainbow"] = "🌈",
		["moon"] = "🌙",
		["sunflower"] = "🌻",
		["rose"] = "🌹",
		["cactus"] = "🌵",
		["tree"] = "🌲",
		["leaf"] = "🍃",
		["palm_tree"] = "🌴",
		["gift"] = "🎁",
		["balloon"] = "🎈",
		["cake"] = "🎂",
		["cookie"] = "🍪",
		["ice_cream"] = "🍦",
		["coffee"] = "☕",
		["beer"] = "🍺",
		["wine"] = "🍷",
		["cocktail"] = "🍹",
		["pizza"] = "🍕",
		["hamburger"] = "🍔",
		["fries"] = "🍟",
		["sushi"] = "🍣",
		["taco"] = "🌮",
		["hotdog"] = "🌭",
		["bento"] = "🍱",
		["spaghetti"] = "🍝",
		["bread"] = "🍞",
		["apple"] = "🍎",
		["banana"] = "🍌",
		["grapes"] = "🍇",
		["watermelon"] = "🍉",
		["strawberry"] = "🍓",
		["pineapple"] = "🍍",
		["mango"] = "🥭",
		["lemon"] = "🍋",
		["peach"] = "🍑",
		["cherry"] = "🍒",
		["pear"] = "🍐",
		["avocado"] = "🥑",
		["carrot"] = "🥕",
		["potato"] = "🥔",
		["corn"] = "🌽",
		["broccoli"] = "🥦",
		["lettuce"] = "🥬",
		["pepper"] = "🌶️",
		["cucumber"] = "🥒",
		["mushroom"] = "🍄",
		["eggplant"] = "🍆",
		["tomato"] = "🍅",
		["tangerine"] = "🍊",
		["kiwi"] = "🥝",
		["chestnut"] = "🌰",
		["egg"] = "🥚",
		["poultry_leg"] = "🍗",
		["meat_on_bone"] = "🍖",
		["bacon"] = "🥓",
		["pancakes"] = "🥞",
		["waffle"] = "🧇",
		["dumpling"] = "🥟",
		["fortune_cookie"] = "🥠",
		["chocolate_bar"] = "🍫",
		["popcorn"] = "🍿",
		["cotton_candy"] = "🍭",
		["lollipop"] = "🍭",
		["honey"] = "🍯",
		["salt"] = "🧂",
		["sake"] = "🍶",
		["rice"] = "🍚",
		["ramen"] = "🍜",
		["squid"] = "🦑",
		["shrimp"] = "🍤",
	}
}

function Emojis.replaceEmojis(text)
	for keyword, emoji in pairs(Emojis.List) do
		text = text:gsub(":" .. keyword .. ":", emoji)
	end
	return text
end

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	local textContent = Emojis.replaceEmojis(TextBox.Text)
	TextBox.Text = textContent

	local textSize = TextService:GetTextSize(textContent, TextBox.TextSize, TextBox.Font, Vector2.new(TextBox.AbsoluteSize.X, math.huge))
	local newHeight = textSize.Y + 16

	TextBox.Size = UDim2.new(TextBox.Size.X.Scale, TextBox.Size.X.Offset, 0, newHeight)
	ChatBox.Size = UDim2.new(ChatBox.Size.X.Scale, ChatBox.Size.X.Offset, 0, newHeight)
	GradientHolder.Size = UDim2.new(GradientHolder.Size.X.Scale, GradientHolder.Size.X.Offset, 0, newHeight + 7)
end)

return module
