
local Players = game:GetService("Players") --Variable for Players

Players.RespawnTime = 3 --Default is 3, delete this if you have a custom one set in the properties or elsewhere

-- Joint rotation limits, you can play around with these values a bit
local jointLimits = {
    Neck = 45,
    Shoulders = 90,
    Elbows = 10,
    Hips = 65,
    Knees = 10
}

local function ragdollCharacter(character) --Function for ragdolling the character
    local humanoid = character:FindFirstChild("Humanoid") --Find Humanoid

    if not humanoid then return end

    -- Replace Motor6Ds with BallSocketConstraints
    for _, motor in ipairs(character:GetDescendants()) do --Find every Motor6D
        if motor:IsA("Motor6D") then

            local attachment0 = Instance.new("Attachment") --Create attachments and constraints
            attachment0.CFrame = motor.C0
            attachment0.Parent = motor.Part0

            local attachment1 = Instance.new("Attachment")
            attachment1.CFrame = motor.C1
            attachment1.Parent = motor.Part1

            local constraint = Instance.new("BallSocketConstraint")
            constraint.Attachment0 = attachment0
            constraint.Attachment1 = attachment1

            -- Set joint rotation limits
            local limit = jointLimits[motor.Name] or 45

            constraint.LimitsEnabled = true
            constraint.UpperAngle = limit

            constraint.TwistLimitsEnabled = true
            constraint.TwistLowerAngle = -45
            constraint.TwistUpperAngle = 45

            constraint.Parent = motor.Parent

            -- Disable the original joint
            motor.Enabled = false
        end
    end
end

local function setupCharacter(character) --Function for setting up the character
    local humanoid = character:WaitForChild("Humanoid")

    -- Prevent joints from breaking on death
    humanoid.BreakJointsOnDeath = false
    humanoid.RequiresNeck = false

    -- Ragdoll when the player dies
    humanoid.Died:Connect(function()
        ragdollCharacter(character)
    end)
end

Players.PlayerAdded:Connect(function(player) --Make sure every player that joins has their character set up to ragdoll
    player.CharacterAdded:Connect(setupCharacter)
end)
