--//Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage") --Variable for Replicated Storage
local ClickEvent = ReplicatedStorage:WaitForChild("ClickEvent") --Variable for Remote Event

ClickEvent.OnServerEvent:Connect(function(player) --When the server recieves the Remote Event, check for the player that sent it
	local leaderstats = player:FindFirstChild("leaderstats") --Locate leaderstats under the player
	if player and leaderstats then --If the player exists and leaderstats was located then
		local clicks = leaderstats:FindFirstChild("Clicks") --Locate Clicks Value under the leaderstats
		local randomnum = math.random(1, 5) --Generates a random number between 1 and 5 (1 is the lowest it can choose, 5 is the highest. Change depending on what you need.)
		clicks.Value += randomnum --Adds that random number of stats to the Clicks Value (Replace randomnum with any regular number if you don't want random stats)
	end
end)
