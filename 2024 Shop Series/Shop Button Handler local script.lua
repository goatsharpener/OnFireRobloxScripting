--//Variables
local remoteEvent = game.ReplicatedStorage:WaitForChild("OpenShop")
local shop = script.Parent.ShopFrame
local exit = shop.Exit

--//Open
remoteEvent.OnClientEvent:Connect(function()
	shop.Visible = true
end)

--//Close
exit.MouseButton1Click:Connect(function()
	shop.Visible = false
end)

--//Everything above this comment is different for each person depending on what you chose in part 1 of the series

local function OpenFrame(frame) --Function for opening frames
	local framefolder = script.Parent.ShopFrame.Information --Variable for Frame Folder
	for _, Frame in ipairs(framefolder:GetChildren()) do --Loop through all the frames in Frame Folder
		if Frame:IsA("Frame") then --If item is a Frame then
			if Frame == frame then --If the item is the Frame we want then
				Frame.Visible = true --Set the frame's visibility to True
			end
		end
	end
end

local function CloseFrames() --Function for closing frames
	local framefolder = script.Parent.ShopFrame.Information --Variable for Frame Folder
	for _, Frame in ipairs(framefolder:GetChildren()) do --Loop through all the frames in Frame Folder
		if Frame:IsA("Frame") then --If the item is a Frame then
			Frame.Visible = false --Set the frame's visibility to False
		end
	end
end

--//Buttons
local ClassicSwordButton = shop.Buttons.ClassicSword.ImageButton --Variable for Classic Sword Button
local FlashLightButton = shop.Buttons.FlashLight.ImageButton --Variable for Flash Light Button
--//Frames
local ClassicSwordFrame = shop.Information.ClassicSwordInfo --Variable for Classic Sword Frame
local FlashLightFrame = shop.Information.FlashLightInfo --Variable for Flash Light Frame

--//Open Frame Functions
ClassicSwordButton.MouseButton1Click:Connect(function() --When Classic Sword Button is clicked
	CloseFrames() --Close All Frames
	OpenFrame(ClassicSwordFrame) --Open Classic Sword Frame
end)

FlashLightButton.MouseButton1Click:Connect(function() --Same thing as Classic Sword but with Flash Light instead
	CloseFrames()
	OpenFrame(FlashLightFrame)
end)
