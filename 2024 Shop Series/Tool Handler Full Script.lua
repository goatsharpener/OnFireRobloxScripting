--//Variables
local BuyRE = game.ReplicatedStorage:WaitForChild("Buy") --Variable for the buy remote event
local toolsDictionary = { --Variable for Tool Dictionary
	["Classic Sword"] = { --New item in Tool Dictionary
		price = 500, --Price of item
		tool = game.ReplicatedStorage.Tools:WaitForChild("ClassicSword"), --Physical location of item
		bought = false --Checks if player has already bought the item
	},
	["Flash Light"] = { --Same thing but with a flash light
		price = 750,
		tool = game.ReplicatedStorage.Tools:WaitForChild("FlashLight"),
		bought = false
	},
	["Keycard"] = { --Same thing but with a key card
		price = 1000,
		tool = game.ReplicatedStorage.Tools:WaitForChild("SCP Card Level 4"),
		bought = false
	},
}

--//Purchase
BuyRE.OnServerEvent:Connect(function(player, item) --When the server recieves the remote event
	local selectedItem = toolsDictionary[item] --Variable for the selected item
	if selectedItem then --if selected item exists then
		if player.leaderstats.Cash.Value >= selectedItem.price and selectedItem.bought == false then --if player has enough cash and has not bought the item yet then
			player.leaderstats.Cash.Value -= selectedItem.price --subtract cash from the player
			selectedItem.bought = true
			local newItem = selectedItem.tool:Clone() --clone the tool player wants
			newItem.Parent = player.Backpack --give tool to player
		elseif selectedItem.bought == true then --if the player already bought the item
			BuyRE:FireClient(player, item, "Max") --sends max error message
		elseif player.leaderstats.Cash.Value < selectedItem.price then --if the player does not have enough cash
			BuyRE:FireClient(player, item, "Cash") --sends cash error message
		end
	end
end)
