--//Variables
local coin = script.Parent --Variable for coin
local touched = false --Variable for a debounce

coin.Touched:Connect(function(hit)
	if not touched then --Checks if the debounce variable is set to false
		touched = true --Debounce variable set to true
		if hit.Parent:FindFirstChild("Humanoid") then --Checks for players
			local char = hit.Parent --Gets character
			local player = game:GetService("Players"):GetPlayerFromCharacter(char) --Gets player
			local leaderstats = player:FindFirstChild("leaderstats") --Find leaderstats
			if leaderstats then --Checks for leaderstats
				leaderstats.Cash.Value += 50 --Give Cash
			end
			coin.Transparency = 1 --Makes coin invisible
			coin.CanCollide = false --Nothing can touch the coin
			task.wait(10) --Wait 10 seconds, change 10 to # of seconds you want to wait
			coin.Transparency = 0 --Makes coin visible
			coin.CanCollide = true --Coin can be touched again
		end
		touched = false --Debounce variable set to false
	end
end)
