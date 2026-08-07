--//Services
local Players = game:GetService("Players") --Gets the Player Service
local UserInputService = game:GetService("UserInputService") --Gets the UserInputService

--//Variables
local player = Players.LocalPlayer --Gets the player
local character = player.Character or player.CharacterAdded:Wait() --Gets the Player's character

--//Function
local function dropTool() --Creates a new function called "dropTool"
	local tool = character:FindFirstChildOfClass("Tool") --Checks for the tool the player is holding
	if tool then --If the tool exsits
		tool.Parent = workspace --Places tool in the workspace (your game)
		tool.Handle.Position = character.HumanoidRootPart.Position --Places it at the HumanoidRootPart
	end
end

--//Drop tool
UserInputService.InputBegan:Connect(function(input, gameProcessed) --When the player presses any key on their keyboard
	if input.KeyCode == Enum.KeyCode.Q and not gameProcessed then --Checks if the letter is "Q" and if the game has NOT processed it, change Q to whatever key you want
		dropTool() --Call the dropTool function
	end
end)
