--//Variables
local TeleportService = game:GetService("TeleportService") --Variable for Teleport Service
local Players = game:GetService("Players") --Variable for Players
local gameId = 6651677874 --Replace this number with your game ID
local db = true --Debounce
local teleportpart = script.Parent --Variable for our teleport part

--//Teleport
teleportpart.Touched:Connect(function(hit) --When the teleport part is touched
	if hit and hit.Parent:FindFirstChild("Humanoid") then --Check if it is a character (characters have humanoids in them)
		if db then --If it is a character, check if the debounc is true
			db = false --If it is true, set it to false
			local player = Players:GetPlayerFromCharacter(hit.Parent) --Retrieves the player from the character
			TeleportService:Teleport(gameId, player) --Teleport the player to the game
			db = true --Sets the debounce back to true so other players can teleport too
		end
	end
end)
