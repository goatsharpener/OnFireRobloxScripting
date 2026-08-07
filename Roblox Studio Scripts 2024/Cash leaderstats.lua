--//leaderstats
game.Players.PlayerAdded:Connect(function(player) --When player joins the game
	player.CharacterAdded:Wait() --Waits for the player's character to load

	local leaderstats = Instance.new("Folder", player) --Creates new folder and puts it under the player
	leaderstats.Name = "leaderstats" --Names the folder "leaderstats"
	
	local Cash = Instance.new("IntValue", leaderstats) --Creates new Intvalue and puts it under the leaderstats folder
	Cash.Name = "Cash" --Names the IntValue "Cash" <- You can change Cash to any currency you like
	Cash.Value = 100 --Gives the player 100 starting "Cash"
end)
