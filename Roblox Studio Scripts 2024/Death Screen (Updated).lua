--//Variables
local player = game:GetService("Players").LocalPlayer --Variable for the player
local deathScreen = script.Parent.DeathScreen --Variable for the death screen
local deathMessageLabel = deathScreen.DeathMessage --Variable for the text
local character = player.Character --Variable for the player's character
local humanoid = character:WaitForChild("Humanoid") --Variable for the character's Humanoid

--//Death Messages
local deathMessages = { --Creates a new list to hold our death messages
	"You died!", --For each death message, put text inside "" then follow it with a comma
	"Try harder text time!", --Use this template if you are confused: "Death message here",
	"Ouch! That must've hurt!",
	"You met your match.",
	"Respawning... try again!",
	"Don't give up!",
	"Almost had it!",
	"Rest in peace... for now!",
	"Yikes! That was rough!",
}

--//Display Death Messages
local function onPlayerDeath() --Function for displaying the death message
	local randomMessage = deathMessages[math.random(1, #deathMessages)] --Chooses a random death message from our list
	deathMessageLabel.Text = randomMessage --Changes the text to the random death message
	
	deathScreen.Visible = true --Makes the death screen visible to the player
	task.wait(3)  --*When the player respawns, the death screen will automatically disappear. But this is to make sure just in case they don't for some reason
	deathScreen.Visible = false --Makes the death screen invisible to the player
end

humanoid.Died:Connect(function() --When the humanoid (the player in the game) dies
	onPlayerDeath() --Call the function onPlayerDeath which will display the death screen
end)

--If your death screen is already visible before you die, make sure you disable "Visible" under the death screen Frame!
