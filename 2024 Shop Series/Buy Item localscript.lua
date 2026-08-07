--//Variables
local BuyRE = game.ReplicatedStorage:WaitForChild("Buy") --Variable for the buy remote event
local BuyButton = script.Parent --Variable for the buy button

BuyButton.MouseButton1Click:Connect(function() --When the buy button is clicked
	BuyRE:FireServer("Classic Sword") --Send the remote event with the string of item we want to buy (Which happens to be "Classic Sword" in this case)
end)
