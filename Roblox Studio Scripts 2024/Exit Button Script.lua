--//Variable
local exitbutton = script.Parent --Variable for exit button
local frame = exitbutton.Parent --Variable for your frame

--//Close Frame
exitbutton.MouseButton1Click:Connect(function() --When the exit button is clicked
	frame.Visible = false --Make the frame invisible
end)

--//In order to work, make sure this script is under your exit button
--//Then make sure you exit button is under the frame you want to close
