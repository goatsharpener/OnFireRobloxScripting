--//Variables
local tool = script.Parent.Parent --Variable for the tool
local clickdetector = tool.ClickDetector --Variable for the click detector

--//Pick up
clickdetector.MouseClick:Connect(function(player) --When the click detector is clicked
	local char = player.Character --Variable for the player's character
	if not char:FindFirstChild(tool.Name) then --Check for tool inside character
		if not player.Backpack:FindFirstChild(tool.Name) then --Check for tool inside character's backpack
			local newtool = tool:Clone() --IF checks passed then clone the tool
			newtool:WaitForChild("ClickDetector"):Destroy() --Destory the click detector in the new tool
			newtool.Parent = player.Backpack --Put tool inside the player's backpack
		end
	end
end)
