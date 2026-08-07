--//Replicated Storage
local replicatedStorage = game:GetService("ReplicatedStorage") --Replicated Storage
local TeamChangeEvent = replicatedStorage:WaitForChild("TeamChange") --Variable for Remote Event
local Teams = game:GetService("Teams") --Teams

TeamChangeEvent.OnServerEvent:Connect(function(player, teamName) --When server recieves Remote Event, get the player and team name
	local team = Teams:FindFirstChild(teamName) --Find team using team name
	if team then --if team exists
		player.Team = team --change player's team to desired team
		player.TeamColor = team.TeamColor --change player's team color to desired color
	end
end)
