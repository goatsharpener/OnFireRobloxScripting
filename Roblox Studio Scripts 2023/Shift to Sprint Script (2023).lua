local uis = game:GetService("UserInputService") --Gets the UserInputService from the game
local humanoid = script.Parent:WaitForChild("Humanoid") --Gets the Player's Humanoid
local db = true --debounce

--//Press shift
uis.InputBegan:Connect(function(input) --When the player presses a key
	if db then --If debounce is true then
		if input.KeyCode == Enum.KeyCode.LeftShift then --If the key is the left shift then
			humanoid.WalkSpeed = 32 --Sets the Humanoid Speed to 32 (Change 32 to how fast you want)
			db = false --Sets debounce to false
		end
	end
end)

--//Release shift
uis.InputEnded:Connect(function(input) --When the player releases a key
	if not db then --If debounce is false then
		if input.KeyCode == Enum.KeyCode.LeftShift then --If the key is the left shift then
			humanoid.WalkSpeed = 16 --Sets the Humanoid Speed to 16 (16 is default)
			db = true --Sets debounce to true
		end
	end
end)

--If you also want to change the FOV (Field of View) when your speed increases, watch the full tutorial: https://youtu.be/fqAPQ4BneVM
