--//Variables
local deathscreen = script.Parent.Frame --Variable for the Frame
local player = game.Players.LocalPlayer --Variable for the Player
local character = player.Character --Variable for the Player's character

character:WaitForChild("Humanoid").Died:Connect(function() --When the character dies
	deathscreen.Visible = true --Make the deathscreen visible
	task.wait(5) --Wait 5 seconds
	deathscreen.Visible = false --Make the deathscreen invisible
end)
