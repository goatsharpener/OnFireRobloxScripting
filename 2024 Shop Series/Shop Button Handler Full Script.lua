--//Variables
local remoteEvent = game.ReplicatedStorage:WaitForChild("OpenShop")
local shop = script.Parent.ShopFrame
local exit = shop.Exit
local BuyRE = game.ReplicatedStorage:WaitForChild("Buy")
--//Open
remoteEvent.OnClientEvent:Connect(function()
	shop:TweenPosition( --creates a new tween position
		UDim2.new(0.124,0,0.138,0), --End target for the position tween
		Enum.EasingDirection.InOut, --Direction of tween (not literal direction, its similar to style)
		Enum.EasingStyle.Sine, --Style of tween
		1, --How long the tween takes, 1 = 1 second
		false --If the tween can be overidden by other tweens
	)
end)

--//Close
exit.MouseButton1Click:Connect(function()
	shop:TweenPosition( --same thing as the tweenposition above this
		UDim2.new(0.124,0,1,0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Sine,
		1,
		false
	)
end)

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
local KeycardButton = shop.Buttons.Keycard.ImageButton
--//Frames
local ClassicSwordFrame = shop.Information.ClassicSwordInfo --Variable for Classic Sword Frame
local FlashLightFrame = shop.Information.FlashLightInfo --Variable for Flash Light Frame
local KeycardFrame = shop.Information.KeycardInfo

--//Open Frame Functions
ClassicSwordButton.MouseButton1Click:Connect(function() --When Classic Sword Button is clicked
	CloseFrames() --Close All Frames
	OpenFrame(ClassicSwordFrame) --Open Classic Sword Frame
end)

FlashLightButton.MouseButton1Click:Connect(function() --Same thing as Classic Sword but with Flash Light instead
	CloseFrames()
	OpenFrame(FlashLightFrame)
end)

KeycardButton.MouseButton1Click:Connect(function() --Same thing as Classic Sword but with Keycard instead
	CloseFrames()
	OpenFrame(KeycardFrame)
end)

BuyRE.OnClientEvent:Connect(function(tool, instruction) --When the client recieves the remote event
	if instruction == "Cash" then --if its the cash error message then
		shop.Errormessage.Text = "Oops! Looks like you don't have enough cash to buy "..tool.."!!!" --cash error message display
		task.wait(3) --wait 3 seconds, replace 3 with the number of seconds you want to wait
		shop.Errormessage.Text = "" --make error message text blank
	elseif instruction == "Max" then --if its the max error message then
		shop.Errormessage.Text = "Oops! Looks like you already bought "..tool.."!!!"
		task.wait(3)
		shop.Errormessage.Text = ""
	end
end)
