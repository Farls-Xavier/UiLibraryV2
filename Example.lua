local Players = game:GetService("Players")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibraryV2/main/Source.lua"))()

local Window = Library:Window({Title = "Example"})

local Tab = Window:Tab()

local Button = Tab:Button({Text = "A Button", ToolTip = "Press me"})
local Toggle = Tab:Toggle({Text = "A Toggle", ToolTip = "Toggle me"})
local Image = Tab:ImageLabel({Image = "rbxassetid://133772874267731", ToolTip = "View me"})
local Bind = Tab:Keybind({Text = "A Bind", ToolTip = "Press my key"})
local Label = Tab:Label({Text = "A Label with tooltip", ToolTip = "Read me"})
