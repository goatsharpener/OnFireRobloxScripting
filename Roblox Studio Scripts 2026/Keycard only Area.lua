--//Services
local Players = game:GetService("Players") --Variable for Players
local PhysicsService = game:GetService("PhysicsService") --Variable for PhysicsService

--//Variables
local wall = script.Parent --Variable for wall

--//Collision Groups
PhysicsService:RegisterCollisionGroup("KeycardAccess")

--//Function
wall.Touched:Connect(function(hit) --When wall is touched
    if hit and hit.Parent:FindFirstChild("Humanoid") then --Check if its a player
        local char = hit.Parent --Variable for character
        local player = Players:GetPlayerFromCharacter(char) --Variable for character's Player
        local backpack = player.Backpack --Variable for Player's backpack
        if char:FindFirstChild("Keycard") or backpack:FindFirstChild("Keycard") then --Locate keycard in player or backpack
            for _, descendant in pairs(char:GetDescendants()) do --Get everything in the character
                if descendant:IsA("BasePart") then --If it's a BasePart
                    descendant.CollisionGroup = "KeycardAccess" -- Allow player to go through wall
                end
            end
            task.wait(1) --1 second wait
            for _, descendant in pairs(char:GetDescendants()) do --Get everything in the character
                if descendant:IsA("BasePart") then --If it's a BasePart
                    descendant.CollisionGroup = "Default" -- Make wall solid
                end
            end
        end
    end
end)

--//Collision Group Settings
PhysicsService:CollisionGroupSetCollidable("KeycardAccess", "KeycardAccess", false) --Make parts in this collision group not collidable with other parts in the same collision group
wall.CollisionGroup = "KeycardAccess" --Set the wall's collision group