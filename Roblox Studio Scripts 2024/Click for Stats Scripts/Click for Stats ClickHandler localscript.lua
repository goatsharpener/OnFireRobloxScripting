--//Variables
local button = script.Parent --Variable for the button
local ReplicatedStorage = game:GetService("ReplicatedStorage") --Variable for Replicated Storage
local ClickEvent = ReplicatedStorage:WaitForChild("ClickEvent") --Variable for Remote Event
local canclick = true --Cooldown Boolean

--//Click for stats
button.MouseButton1Click:Connect(function() --When button is clicked
	if canclick then --If the user can click the button then
		canclick = false --The user can not click the button now
		ClickEvent:FireServer() --Fires the Remote Event to the server
		task.wait(3) --3 Second cooldown (Change 3 to how many seconds you want the cooldown to be. Or delete this line for no cooldown)
		canclick = true --The user can click the button  now
	end
end)
