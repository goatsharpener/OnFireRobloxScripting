--//Replicated Storage
local replicatedStorage = game:GetService("ReplicatedStorage") --Replicated Storage
local TeamChangeEvent = replicatedStorage:WaitForChild("TeamChange") --Variable for Remote Event

--//Variables
local openButton = script.Parent.Open
local background = script.Parent.Background
local redButton = background.Red
local blueButton = background.Blue
local exitButton = background.Exit

local function exit() --Function for exiting
	openButton.Visible = true --Makes open button visible
	background.Visible = false --Makes background invisible
end

--//Ui Functionality
openButton.MouseButton1Click:Connect(function()
	openButton.Visible = false --Makes open button invisible
	background.Visible = true --Makes background visible
end)

exitButton.MouseButton1Click:Connect(function()
	exit()
end)

--//Change Teams
redButton.MouseButton1Click:Connect(function()
	TeamChangeEvent:FireServer("Red") --Fires Remote Event to server
	exit()
end)

blueButton.MouseButton1Click:Connect(function()
	TeamChangeEvent:FireServer("Blue")
	exit()
end)
