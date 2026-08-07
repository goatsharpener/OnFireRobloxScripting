--//Variables
local prox = script.Parent
local remoteEvent = game.ReplicatedStorage:WaitForChild("OpenShop")

--//Open
prox.Triggered:Connect(function(player)
	remoteEvent:FireClient(player)
end)

--Full Video: https://youtu.be/YNAUAVvMa38
