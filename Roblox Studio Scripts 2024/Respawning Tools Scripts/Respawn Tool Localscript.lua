--//Services
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

--//Variables
local player = players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local respawnToolEvent = replicatedStorage:WaitForChild("RespawnTool")

--//Respawn upon death
humanoid.Died:Connect(function()
    respawnToolEvent:FireServer()
end)
