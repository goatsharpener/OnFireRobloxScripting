--//Variables
local prox = script.Parent.ProximityPrompt --Variable for the proximity prompt
local teleportLocation = workspace.TeleportLocation --Variable for your teleport location part

prox.Triggered:Connect(function(player) --When the proximity prompt is triggered
	local character = player.Character --Variable for the player's character
	character:PivotTo(teleportLocation.CFrame + Vector3.new(0, 10, 0)) --Teleport character to new location
end)
