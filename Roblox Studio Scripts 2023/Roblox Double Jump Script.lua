--//Put under StarterCharacterScripts
--//Variables
local uis = game:GetService("UserInputService") --Gets the UserInputService in Roblox
local humanoid = script.Parent:WaitForChild("Humanoid") --Gets the Player's Humanoid
local doublejumped = false --Sets a variable called "doublejumped" to false
local jumped = false --Sets a variable called "jumped" to false

--//Double Jump System
uis.JumpRequest:Connect(function() --Triggers when player requests a jump
	if not jumped then --If variable jump is false then
		jumped = true --Set variable jump to true
		if humanoid.FloorMaterial ~= Enum.Material.Air then --If the humanoid is not in the air (on the ground) then
			doublejumped = false --They have not double jumped, so sets variable "doublejumped" to false
			task.wait(0.2) --Self explanatory
			jumped = false --Sets variable "jumped" to false
		elseif not doublejumped then --if they have not double jumped then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping) --Change the Humanoid state to jumping (makes humanoid jump)
			doublejumped = true --Sets variable "doublejumped" to true
			task.wait(0.2) --Self explanatory
			jumped = false --Sets variable "jumped" to false
		end
	end
end)
