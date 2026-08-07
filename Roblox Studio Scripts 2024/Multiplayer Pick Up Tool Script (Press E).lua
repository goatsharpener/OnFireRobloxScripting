--//Variables
local prox = script.Parent --Variable for proximity prompt
local tool = prox.Parent.Parent --Variable for tool

--//Pick up
prox.Triggered:Connect(function(player) --When proximity prompt is triggered
	local char = player.Character --Variable for player's character
	if not char:FindFirstChild(tool.Name) then --Check for tool inside character
		if not player.Backpack:FindFirstChild(tool.Name) then --Check for tool inside character's backpack
			local newtool = tool:Clone() --If checks are passed then clone the tool
			newtool:WaitForChild("Handle"):WaitForChild("ProximityPrompt"):Destroy() --Destroy current proximity prompt inside tool
			newtool.Parent = player.Backpack --Put tool inside player's backpack
		end
	end
end)
