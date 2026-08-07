--//Variables
local BuyRE = game.ReplicatedStorage:WaitForChild("Buy") --Variable for the buy remote event
local toolsDictionary = { --Variable for Tool Dictionary
	["Classic Sword"] = { --New item in Tool Dictionary
		price = 500, --Price of item
		tool = game.ReplicatedStorage.Tools:WaitForChild("ClassicSword") --Physical location of item
	},
	["Flash Light"] = { --Same thing but with a flash light
		price = 750,
		tool = game.ReplicatedStorage.Tools:WaitForChild("FlashLight")
	}
}

--//Purchase
BuyRE.OnServerEvent:Connect(function(player, item) --When the server recieves the remote event
	local selectedItem = toolsDictionary[item] --Variable for the selected item
	if selectedItem then --if selected item exists then
		if player.leaderstats.Cash.Value >= selectedItem.price then --if player has enough cash then
			player.leaderstats.Cash.Value -= selectedItem.price --subtract cash from the player
			local newItem = selectedItem.tool:Clone() --clone the tool player wants
			newItem.Parent = player.Backpack --give tool to player
		end
	end
end)
