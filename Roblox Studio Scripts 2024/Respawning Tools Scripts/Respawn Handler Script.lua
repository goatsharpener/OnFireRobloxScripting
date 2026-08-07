--//Services
local replicatedStorage = game:GetService("ReplicatedStorage")

--//Variables
local tool = replicatedStorage:WaitForChild("Flash Light")
local respawnToolEvent = replicatedStorage:WaitForChild("RespawnTool")
local blnTool = workspace.Tool

--//Respawn
respawnToolEvent.OnServerEvent:Connect(function(player)
    if blnTool.Value == false then
        blnTool.Value = true
        local newTool = tool:Clone()
        newTool.Parent = workspace
    end
end)
