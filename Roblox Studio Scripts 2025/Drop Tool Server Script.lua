--//Variables
local replicatedStorage = game:GetService("ReplicatedStorage") --Variable for Replicated Storage
local DropEvent = replicatedStorage:WaitForChild("DropEvent") --Variable for Remote Event

--//Functions
DropEvent.OnServerEvent:Connect(function(player) --When Server recieves the Remote Event, find the Player
	local character = player.Character --Find the player's character
	local tool = character:FindFirstChildOfClass("Tool") --Find the tool in character
	
	if tool then --If the script found a tool then
		local originalCFrame = tool.Handle.CFrame --Stores Original Tool Position
		tool.Handle.CanTouch = false --Can't touch the tool
		tool.Parent = workspace --Put tool in workspace
		tool.Handle.CFrame = originalCFrame --Position tool in original position
		task.wait(1) --Wait 1 second
		tool.Handle.CanTouch = true --Can touch the tool again
	end
end)
