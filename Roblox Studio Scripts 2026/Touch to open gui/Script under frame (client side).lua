--//Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--//Variables
local openUiEvent = ReplicatedStorage.OpenUi
local frame = script.Parent.Frame

--//Function
openUiEvent.OnClientEvent:Connect(function()
    frame.Visible = true
end)
