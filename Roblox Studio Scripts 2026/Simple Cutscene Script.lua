--//Variables
local Camera = workspace.CurrentCamera --Camera
local Player = game.Players.LocalPlayer --Player
local cutsceneParts = workspace:WaitForChild("CutsceneParts") --Cutscene Parts Folder
local Point1 = cutsceneParts:WaitForChild("Part1") --Variable for part 1
local Point2 = cutsceneParts:WaitForChild("Part2") -- Variable for part 2

--//Services
local TweenService = game:GetService("TweenService") --TweenService

--//Set Camera
local function TweenCamera(Pos)
	--//Parameters: time, style, direction, repeat, reverse, delay
	local TweenInf = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	local Tween = TweenService:Create(Camera, TweenInf, {CFrame = Pos}) --Create Tween using camera and tween info
	Tween:Play() --Play Tween
end

--//Get Camera
task.wait(2) --Wait 2 seconds
repeat
	task.wait() --Very brief wait
	Camera.CameraType = Enum.CameraType.Scriptable 
until Camera.CameraType == Enum.CameraType.Scriptable --Scriptable Camera (can modify)
Camera.CFrame = Point1.CFrame --Start Camera on part 1
task.wait(2) --Wait 2 seconds
TweenCamera(Point2.CFrame) --Tween Camera to part 2
task.wait(7) --wait accounts for tween to finish
Camera.CameraType = Enum.CameraType.Custom --Set Camera back to player
