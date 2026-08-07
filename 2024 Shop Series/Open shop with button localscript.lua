--//Variables
local shop = script.Parent.ShopFrame
local open = script.Parent.Open
local exit = shop.Exit

--//Open
open.MouseButton1Click:Connect(function()
	shop.Visible = true
	open.Visible = false
end)

--//Close
exit.MouseButton1Click:Connect(function()
	shop.Visible = false
	open.Visible = true
end)

--Full video: https://youtu.be/YNAUAVvMa38
