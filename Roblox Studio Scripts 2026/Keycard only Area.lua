--//Services
local Players = game:GetService("Players") --Variable for Players

--//Variables
local wall = script.Parent --Variable for wall

--//Function
wall.Touched:Connect(function(hit) --When wall is touched
    if hit and hit.Parent:FindFirstChild("Humanoid") then --Check if its a player
        local char = hit.Parent --Variable for character
        local player = Players:GetPlayerFromCharacter(char) --Variable for character's Player
        local backpack = player.Backpack --Variable for Player's backpack
        if char:FindFirstChild("Keycard") or backpack:FindFirstChild("Keycard") then --Locate keycard in player or backpack
            wall.CanCollide = false -- Allow player to go through wall
            task.wait(1) --1 second wait
            wall.CanCollide = true -- Make wall solid
        end
    end
end)
