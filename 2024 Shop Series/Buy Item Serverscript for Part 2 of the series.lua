--//Variables
local BuyRE = game.ReplicatedStorage:WaitForChild("Buy") --Variable for the buy remote event
local classicsword = game.ReplicatedStorage.Tools:WaitForChild("ClassicSword") --Variable for tool stored under the replicated storage

--//Purchase
BuyRE.OnServerEvent:Connect(function(player, item) --When the server recieves the remote event
	if item == "Classic Sword" then --Check if the string recieved matches
		if player.leaderstats.Cash.Value >= 500 then --Check if player has equal or more than $500 <- You can change the 500 to how much you want it to cost
			player.leaderstats.Cash.Value -= 500 --Deduct $500 <- You can change the 500 to how much you want to deduct
			local newitem = classicsword:Clone() --Create a clone of the tool/item
			newitem.Parent = player.Backpack --Give tool/item to the player
		else --Any other scenario where the player does NOT have equal to or over $500
			print("Not enough cash") --Print error message
		end
	end
end)

--//NOTE:
--This script is not fully complete, it is just a framework and a setup for the next parts in the working shop series. You can use it it you are currently on part 2 of the series.
