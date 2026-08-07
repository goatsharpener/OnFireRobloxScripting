--//Variables
local exitButton = script.Parent
local frame = exitButton.Parent

--//Function
exitButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)
