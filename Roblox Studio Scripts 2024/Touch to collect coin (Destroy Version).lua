--//Variables
local coin = script.Parent --Variable for coin

coin.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then --Checks for players
		local char = hit.Parent --Gets character
		local player = game:GetService("Players"):GetPlayerFromCharacter(char) --Gets player
		local leaderstats = player:FindFirstChild("leaderstats") --Find leaderstats
		if leaderstats then --Checks for leaderstats
			leaderstats.Cash.Value += 50 --Give Cash
		end
		coin:Destroy() --Destroy Coin
	end
end)
