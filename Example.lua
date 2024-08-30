local Players = game:GetService("Players")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibraryV2/main/Source.lua"))()

local Window = Library:Window({Title = "Example"})

local Tab1 = Window:Tab({Text = "Tab 1", Icon = "rbxassetid://18700960425"})
local Tab2 = Window:Tab({Text = "Tab 2", Icon = "rbxassetid://18703386053"})
local Tab3 = Window:Tab({Text = "Tab 3"})

Tab1:Button({Text = "A button"})
Tab1:Toggle({Text = "A toggle"})

Tab2:ImageLabel({Image = "rbxassetid://18703386053"})
Tab2:Keybind({Text = "A keybind", Keybind = Enum.KeyCode.F})

Tab3:Player({Player = Players.LocalPlayer})
