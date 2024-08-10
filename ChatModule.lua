-- Sigh this module is so annoying too make. Gonna have to make topbar plus inside of this too.

local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local function tween(object, goal, speed, callback)
	local tween = TweenService:Create(object, TweenInfo.new(speed or .2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local module = {}

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

module.__index = module

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

BackFrame.Name = "BackFrame"
BackFrame.Parent = ScreenGui
BackFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrame.BackgroundTransparency = 1.000
BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrame.BorderSizePixel = 0
BackFrame.Position = UDim2.new(0.00801974069, 0, 0.0132145705, 0)
BackFrame.Size = UDim2.new(0, 450, 0, 290)

UICornerBackFrame.CornerRadius = UDim.new(0, 4)
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
TextLabelTemplate.Size = UDim2.new(0, 200, 0, 20)
TextLabelTemplate.Font = Enum.Font.MontserratMedium
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

BackFrame.MouseEnter:Connect(function()
	tween(GradientHolder, {Transparency = 0})
	tween(Messages, {ScrollBarImageTransparency = 0})
	tween(ChatBox, {Transparency = .65})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(0,0,0)})
end)

BackFrame.MouseLeave:Connect(function()
	tween(GradientHolder, {Transparency = 1})
	tween(Messages, {ScrollBarImageTransparency = 1})
	tween(ChatBox, {Transparency = .970})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(11,11,11)})
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	
	if input.KeyCode == Enum.KeyCode.Slash then
		task.wait(0.01)
		TextBox:CaptureFocus()
	end
end)

local ColorTable = {
	"#3E8EC6",
	"#8D6F64",
	"#A63939"
}

function module:GetTextChatVersion()
	return TextChatService.ChatVersion
end

function module.RenderMessage(Sender, Message)
	local msg = TextLabelTemplate:Clone()
	msg.Parent = Messages
	tween(msg, {TextTransparency = 0}, .1)
	msg.Visible = true
	msg.Name = "MessageLabel"
	if Sender == Players.LocalPlayer then
		msg.Text = "<font color=\"#FFDE59\">"..Sender.DisplayName.."</font>: ".."<b>"..tostring(Message).."</b>"
	else
		msg.Text = "<font color=\""..ColorTable[math.random(1, #ColorTable)].."\">"..Sender.DisplayName.."</font>: ".."<b>"..tostring(Message).."</b>"
	end
end

function module.SendMessage(Message, Recipent)
	if module:GetTextChatVersion() == Enum.ChatVersion.LegacyChatService and string.len(TextBox.Text) > 0 then
		local args = {
			[1] = Message,
			[2] = Recipent or "All",
		}
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	elseif module:GetTextChatVersion() == Enum.ChatVersion.TextChatService then
		TextChatService:WaitForChild("TextChannels").RBXGeneral:SendAsync(tostring(Message))
	end
end

function module.ConnectPlayerChatEvent(player)
	if module:GetTextChatVersion() == Enum.ChatVersion.LegacyChatService then
		player.Chatted:Connect(function(Message)

		end)
	elseif module:GetTextChatVersion() == Enum.ChatVersion.TextChatService then
		TextChatService.OnIncomingMessage = function(Message:TextChatMessage)
			local sender = Players:GetPlayerByUserId(Message.TextSource.UserId)

		end
	end
end

TextBox.Focused:Connect(function()
	if ChatBox.Transparency ~= .65 then
		tween(ChatBox, {Transparency = .65})
	end
	if ChatBox.BackgroundColor3 ~= Color3.fromRGB(0,0,0) then
		tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(0,0,0)})
	end
	if TextBox.TextTransparency ~= 0 then
		tween(TextBox, {TextTransparency = 0})
	end
end)

TextBox.FocusLost:Connect(function(ep)
	tween(ChatBox, {Transparency = .970})
	tween(ChatBox, {BackgroundColor3 = Color3.fromRGB(11,11,11)})
	tween(TextBox, {TextTransparency = .44})

	if ep then
		module.SendMessage(TextBox.Text, "All")
		module.RenderMessage(Players.LocalPlayer, TextBox.Text)
	end
	TextBox.Text = ""
end)

return module
