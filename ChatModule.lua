local module = {}

local TCS = game:GetService("TextChatService")
local Players = game:GetService("Players")

module.CustomChatUi = false

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

function module.Init()
	TCS.OnIncomingMessage = OnIncomingMessage
	
	if module.CustomChatUi then
	end
end

return module
