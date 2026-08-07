game.Players.PlayerAdded:Connect(function(player) --When the player joins the game
	player.CharacterAdded:Wait() --Wait for the player's character to load
	--//leaderstats
	local leaderstats = Instance.new("Folder", player) --Create a folder and put it under the player
	leaderstats.Name = "leaderstats" --Name that folder "leaderstats" <- DON'T CHANGE THIS
	
	--//Values
	local clicks = Instance.new("IntValue", leaderstats) --Create an IntValue and put it under the leaderstats
	clicks.Name = "Clicks" --Name that IntValue "Clicks"
	clicks.Value = 100 --Give starting stats for that value (Change 100 to how much of this stat you want players to start with)
end)
