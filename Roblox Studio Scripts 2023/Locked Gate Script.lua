--// leaderstats (regular script in serverscriptservice)

local RemoteEvent = game.ReplicatedStorage:WaitForChild("Unlockwall") --Variable for RemoteEvent

--//leaderstats
game.Players.PlayerAdded:Connect(function(player) --Run script when player joins the game
	local leaderstats = Instance.new("Folder") --Create a new folder for leaderstats
	leaderstats.Name = "leaderstats" --Names folder to "leaderstats"
	leaderstats.Parent = player --Put folder under player
	
	local level = Instance.new("IntValue") --Create a new IntValue
	level.Name = "Level" --Name it "Level"
	level.Value = 0 --Set the starting value to 0
	level.Parent = leaderstats --Put it under the leaderstats folder
	
	if level.Value >= 5 then --If the player's level Value is over or equal to 5, fire the RemoteEvent (If you have a datastore instead of leaderstats, don't delete this)
		RemoteEvent:FireClient(player) --Fire RemoteEvent
	end
	
	level:GetPropertyChangedSignal("Value"):Connect(function() --When the Level Value is changed
		if level.Value >= 5 then --If the player's level Value is over or equal to 5, fire the RemoteEvent
			RemoteEvent:FireClient(player) --Fire RemoteEvent
		end
	end)
end)

--//Local Script under the player

local RemoteEvent = game.ReplicatedStorage:WaitForChild("Unlockwall")

RemoteEvent.OnClientEvent:Connect(function()
	local wall = workspace.Statwall
	wall.CanCollide = false
	wall.BrickColor = BrickColor.new("Bright green")
end)


Watch the Full Video to set it up/learn how it works
https://youtu.be/x4xEO192oPA
