--//Variables
local jumpPad = script.Parent --Variable for jumpPad
local jumpPower = 100 --New jumpPower
local cooldown = {} --Cooldown table for players

--//Function
jumpPad.Touched:Connect(function(hit) --When jumpPad is touched
	local character = hit.Parent --Variable for character
	local humanoid = character:FindFirstChild("Humanoid") --Variable for Humanoid
	local rootPart = character:FindFirstChild("HumanoidRootPart") --Variable for rootPart

	if humanoid and rootPart and not cooldown[character] then --confirm character
		cooldown[character] = true --add to cooldown table

		rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 2, 0) --Add initial height
		rootPart.AssemblyLinearVelocity = Vector3.new( --Launch character into air
			rootPart.AssemblyLinearVelocity.X,
			jumpPower,
			rootPart.AssemblyLinearVelocity.Z
		)

		task.wait(1) --wait 1 second
		cooldown[character] = nil --remove character from cooldown table
	end
end)
