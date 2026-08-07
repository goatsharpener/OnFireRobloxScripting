--//Make sure your proximity prompt and script is under the coin

--//Variables
local prox = script.Parent.ProximityPrompt --Variable for proximity prompt

prox.Triggered:Connect(function(player) --When the proximity prompt is triggered activate the function
	local cash = player.leaderstats.Cash --Variable for the Player's Cash
	cash.Value += 10 --Add 10 Cash (Change 10 to # of Cash you want to add for the Player)
	script.Parent:Destroy() --Optional, delete if you don't want the coin to disappear after you collect it
end)
