--//Variables
local TeleportService = game:GetService("TeleportService") --Gets the TeleportService from the Game
local gameId = 12109044833 --Replace the numbers with the PlaceId of your game
local player = game.Players.LocalPlayer --Gets the player
local db = true --Debounce/Cooldown

--//Teleport
script.Parent.MouseButton1Click:Connect(function() --Fires Event when button is clicked
	if db then --If debounce then
		db = false --Sets debounce to false
		TeleportService:Teleport(gameId, player) --Teleports player to the Game
		task.wait(1) --Wait 1 second
		db = true --Sets debounce to true
	end
end)
