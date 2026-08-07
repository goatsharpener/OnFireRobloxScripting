--//Variables
local touchpad = script.Parent
local remoteEvent = game.ReplicatedStorage:WaitForChild("OpenShop")

--//Open
touchpad.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		remoteEvent:FireClient(player)
	end
end)

--Full Video: https://youtu.be/YNAUAVvMa38
