--//Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--//Variables
local openUiEvent = ReplicatedStorage.OpenUi
local touchPart = script.Parent

--//Function
touchPart.Touched:Connect(function(hit)
    if hit and hit.Parent:FindFirstChild("Humanoid") then
        local character = hit.Parent
        local player = Players:GetPlayerFromCharacter(character)
        openUiEvent:FireClient(player)
    end
end)
