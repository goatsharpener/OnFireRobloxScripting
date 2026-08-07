--//Variables
local button = script.Parent --Variable for the button
local replicatedStorage = game:GetService("ReplicatedStorage") --Variable for Replicated Storage
local DropEvent = replicatedStorage:WaitForChild("DropEvent") --Variable for Remote Event

button.MouseButton1Click:Connect(function() --When the button is clicked
	DropEvent:FireServer() --Tell the Server the button has been clicked
end)
