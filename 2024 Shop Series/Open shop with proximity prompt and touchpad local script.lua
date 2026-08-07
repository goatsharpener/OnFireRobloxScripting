--//Variables
local remoteEvent = game.ReplicatedStorage:WaitForChild("OpenShop")
local shop = script.Parent.ShopFrame
local exit = shop.Exit

--//Open
remoteEvent.OnClientEvent:Connect(function()
	shop.Visible = true
end)

--//Close
exit.MouseButton1Click:Connect(function()
	shop.Visible = false
end)

--Full Video: https://youtu.be/YNAUAVvMa38
