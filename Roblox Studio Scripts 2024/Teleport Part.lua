--//Variables
local teleportlocation = workspace.End --Variable for end location part

--//Teleport
script.Parent.Touched:Connect(function(hit) --When part is touched
	if hit and hit.Parent:FindFirstChild("Humanoid") then --Determine if a character touched it
		local char = hit.Parent --Find the character that touched it
		if char then --If character found
			char:PivotTo(CFrame.new(teleportlocation.Position + Vector3.new(0, 10, 0))) --Teleport Player slightly above the end location part Vector3.new(0, 10, 0) will put them slightly up in the air
		end
	end
end)
