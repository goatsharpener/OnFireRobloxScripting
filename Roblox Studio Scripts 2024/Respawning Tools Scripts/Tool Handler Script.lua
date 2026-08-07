--//Variables
local tool = script.Parent
local prox = tool.Handle.ProximityPrompt
local blntool = workspace.Tool

--//Pick Up Tool
prox.Triggered:Connect(function(player)
    tool.Parent = player.Backpack
    prox.Enabled = false
    blntool.Value = false
end)
