local module = {}

local MessagingService = game:GetService("MessagingService")
local TCS = game:GetService("TextChatService")
local Config = game:GetService("HttpService"):JSONDecode(readfile("@FarlsXavier\\UiConfig.json"))
local UiTools = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibraryV2/main/UiTools.lua"))()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

function OnIncomingMessage(message:TextChatMessage)
	local Properties = Instance.new("TextChatMessageProperties")
	Properties.Text = message.Text
	
	if message.TextSource then
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)
		if player == Players.LocalPlayer then
			Properties.PrefixText = "<font color='#FFFF00'>[You]</font> " .. message.PrefixText
		elseif Players.LocalPlayer:IsFriendsWith(player.UserId) then
			--Properties.PrefixText = "<font color='#C90588'>[Friend]</font> " .. message.PrefixText
			Properties.PrefixText = "<font color='#FE0AAC'>[Friend]</font> " .. message.PrefixText
		end
	end
	return Properties
end

function module.SendMessage(Message, Recipent)
    if Message == nil or string.len(Message) == 0 then
        return
    end
    local args = {
        [1] = Message,
        [2] = Recipent,
    }
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end

function module.Init()
    --[[if not Config.CustomChat then
        if TCS.ChatVersion == Enum.ChatVersion.LegacyChatService then
            printColor("Game is using LegacyChatService custom tags wont work", Color3.fromRGB(255,0,0))
            return
        end
        TCS.OnIncomingMessage = OnIncomingMessage
        return
    end]]

    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

    for i,v in pairs(game.CoreGui:GetDescendants()) do
        if v:IsA("StringValue") and v.Name == "ReferenceValue" and v.Parent.Name == "UiLibChat" then
            warn("DELETING OLD SCRIPT(IF NOT RIGHT THEN TELL ME)")
            v.Parent:Destroy()
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UiLibChat"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = game.CoreGui

    Instance.new("StringValue", ScreenGui).Name = "ReferenceValue"

    local BackFrame = Instance.new("Frame")
    local ChatBox = Instance.new("TextBox")
    local MessageHolder = Instance.new("ScrollingFrame")
    local MessageHolderListLayout = Instance.new("UIListLayout")
    local TemplateMessage = Instance.new("TextLabel")

    BackFrame.Name = "BackFrame"
    BackFrame.Parent = ScreenGui
    BackFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    BackFrame.BackgroundTransparency = 0.500
    BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BackFrame.BorderSizePixel = 0
    BackFrame.Position = UDim2.new(0.0339296721, 0, 0.225563914, 0)
    BackFrame.Size = UDim2.new(0, 500, 0, 400)

    ChatBox.Name = "ChatBox"
    ChatBox.Parent = BackFrame
    ChatBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ChatBox.BackgroundTransparency = 0.500
    ChatBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChatBox.BorderSizePixel = 0
    ChatBox.Position = UDim2.new(0, 0, 0.932500005, 0)
    ChatBox.Size = UDim2.new(0, 500, 0, 27)
    ChatBox.Font = Enum.Font.GothamMedium
    ChatBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
    ChatBox.PlaceholderText = "/ or press me to start chatting"
    ChatBox.Text = ""
    ChatBox.TextColor3 = Color3.fromRGB(200,200,200)
    ChatBox.TextSize = 15.000

    MessageHolder.Name = "MessageHolder"
    MessageHolder.Parent = BackFrame
    MessageHolder.Active = true
    MessageHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageHolder.BackgroundTransparency = 1.000
    MessageHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MessageHolder.BorderSizePixel = 0
    MessageHolder.Size = UDim2.new(0, 500, 0, 373)
    MessageHolder.ScrollBarThickness = 6

    MessageHolderListLayout.Name = "MessageHolderListLayout"
    MessageHolderListLayout.Parent = MessageHolder
    MessageHolderListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    TemplateMessage.Name = "TemplateMessage"
    TemplateMessage.Parent = MessageHolder
    TemplateMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TemplateMessage.BackgroundTransparency = 1.000
    TemplateMessage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TemplateMessage.BorderSizePixel = 0
    TemplateMessage.Size = UDim2.new(0, 500, 0, 15)
    TemplateMessage.Visible = false
    TemplateMessage.Font = Enum.Font.GothamMedium
    TemplateMessage.Text = "[Farleyy]: Test Message"
    TemplateMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
    TemplateMessage.TextSize = 15.000
    TemplateMessage.TextXAlignment = Enum.TextXAlignment.Left

    UiTools.MakeDraggable(BackFrame, BackFrame)

    local function RenderMessage(Sender:Player, Message:string)
        local label = TemplateMessage:Clone()
        label.Parent = MessageHolder
        label.Text = "["..Sender.DisplayName.."]: "..tostring(Message)
        label.Visible = true
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Slash and not ChatBox:IsFocused() then
            ChatBox:CaptureFocus()
        end
    end)

    ChatBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            module.SendMessage(ChatBox.Text, "All")
            RenderMessage(Players.LocalPlayer, ChatBox.Text)
        end
    end)

    for i,v in pairs(Players:GetPlayers()) do
        v.Chatted:Connect(function(message)
            RenderMessage(v, message)
        end)
    end

    --[[TCS.MessageReceived:Connect(function(textChatMessage:TextChatMessage)
        local player = Players:GetPlayerByUserId(textChatMessage.TextSource.UserId)
        RenderMessage(player, textChatMessage.Text)
    end)]]
end

return module
