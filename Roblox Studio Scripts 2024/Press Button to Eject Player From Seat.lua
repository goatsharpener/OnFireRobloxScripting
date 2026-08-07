--Script under the Seat

--//Variables
local prox = script.Parent --Variable for the proximity prompt
local seat = prox.Parent --Variable for the seat
local eject = game.ReplicatedStorage:WaitForChild("Eject") --Variable for the Remote Event

--//Seat Check
seat:GetPropertyChangedSignal("Occupant"):Connect(function() --When Seat status is changed
	if seat.Occupant then --If someone is on the seat
		prox.Enabled = false --Disable the proximity prompt
	else --Any other scenario
		prox.Enabled = true --Show the proximity prompt
		seat.Disabled = true --Disable the seat
	end
end)

--//Sit on Seat
prox.Triggered:Connect(function(player) --When the proximity prompt is triggered
	local hum = player.Character:WaitForChild("Humanoid") --Variable for the player's humanoid
	seat.Disabled = false --Disable the seat
	seat:Sit(hum) --Sit the player on the seat
	hum.JumpPower = 0 --Remove their ability to jump out of the seat
	eject:FireClient(player) --Fire the Remote Event
end)

--//Restore JumpPower
eject.OnServerEvent:Connect(function(player) --When we recieve the Remote Event from the client
	local hum = player.Character:WaitForChild("Humanoid") --Find the humanoid
	hum.Sit = false
	hum.JumpPower = 50 --Restor their ability to jump
end)

--(different script) LocalScript under button
--//Variables
local player = game.Players.LocalPlayer --Variable for the player
local hum = player.Character:WaitForChild("Humanoid") --Variable for the humanoid
local eject = game.ReplicatedStorage:WaitForChild("Eject") --Variable for the Remote Event

--//Show Button
eject.OnClientEvent:Connect(function() --When we recieve the Remote Event from the server
	script.Parent.Visible = true --Show the button (make it visible)
end)

--//Eject Player
script.Parent.MouseButton1Click:Connect(function() --When the button is clicked
	script.Parent.Visible = false --Hide the button (make it invisible)
	eject:FireServer(player) --Fire the Remote Event back to the server
end)
