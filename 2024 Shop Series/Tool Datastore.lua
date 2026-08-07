--//Datastore
local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("stats")

--//Tools
local rs = game.ReplicatedStorage
local tools = rs:WaitForChild("Tools")
local swordtool = tools:WaitForChild("ClassicSword")
local flashlighttool = tools:WaitForChild("FlashLight")
local keycardtool = tools:WaitForChild("SCP Card Level 4")

--//save data
local function saveData(player) --Function that saves data
	local tableToSave = { --Creates a table to save values
		player.leaderstats.Cash.Value;
		player.Tools["Classic Sword"].Value;
		player.Tools["Flash Light"].Value;
		player.Tools["Keycard"].Value;
	}
	
	local success, errorMessage = pcall(dataStore.SetAsync, dataStore, player.UserId, tableToSave) --SetAsync saves the data
	
	if success then
		print("Data has been saved")
	else
		print("Data has not been saved!")
	end
end

--//leaderstats
game.Players.PlayerAdded:Connect(function(player) --When player joins the game
	player.CharacterAdded:Wait()
	local leaderstats = Instance.new("Folder", player) --Creates new folder and puts it under the player
	leaderstats.Name = "leaderstats" --Names the folder "leaderstats"
	
	local cash = Instance.new("IntValue", leaderstats) --Creates new Intvalue and puts it under the leaderstats folder
	cash.Name = "Cash" --Names the IntValue "Cash" <- You can change Cash to any currency you like
	cash.Value = 1600 --Gives the player 100 starting "Cash"
	
	local toolfolder = Instance.new("Folder", player) --Creates new folder for tools, puts it under the player
	toolfolder.Name = "Tools"
	
	local sword = Instance.new("BoolValue", toolfolder) --Creates new Bookvalue and puts it under the toolfolder
	sword.Name = "Classic Sword" --Names the boolvalue (Make sure this is the same as your table in ToolHandler)
	sword.Value = false --Sets Boolvalue to be false
	
	local flashlight = Instance.new("BoolValue", toolfolder)
	flashlight.Name = "Flash Light"
	flashlight.Value = false
	
	local keycard = Instance.new("BoolValue", toolfolder)
	keycard.Name = "Keycard"
	keycard.Value = false
	
	local data = nil
	
	local success, errorMessage = pcall(function()
		data = dataStore:GetAsync(player.UserId)
	end)
	
	if success and data then --Get Async retrieves data from the data store, and loads them from the table
		cash.Value = data[1]
		sword.Value = data[2]
		flashlight.Value = data[3]
		keycard.Value = data[4]
	else
		print("The Player has no data!")
		warn(errorMessage)
	end
	
	if sword.Value == true then --This if statements check for the bookvalues and gives tools to players
		local newtool = swordtool:Clone()
		newtool.Parent = player.Backpack
	end
	
	if flashlight.Value == true then
		local newtool = flashlighttool:Clone()
		newtool.Parent = player.Backpack
	end
	
	if keycard.Value == true then
		local newtool = keycardtool:Clone()
		newtool.Parent = player.Backpack
	end
	
end)


game.Players.PlayerRemoving:Connect(function(player) --When player leaves the game, save data
	saveData(player) 
end)

game:BindToClose(function() --When the game's server shuts down, save all player's data
	for _, player in ipairs(game.Players:GetPlayers()) do
		task.spawn(saveData, player)
	end
end)
