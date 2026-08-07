--//Services
local tweenService = game:GetService("TweenService") --Variable for TweenService

--//Variables
local ui = script.Parent
local originalSize = ui.Size
local originalPosition = ui.Position
local hoverSizeIncrease = UDim2.new(0.01, 0, 0.01, 0) --Variable for size increase
local hoverSize = originalSize + hoverSizeIncrease --Variable for original size
local hoverPosition = originalPosition - UDim2.new(hoverSizeIncrease.X.Scale / 2, 0, hoverSizeIncrease.Y.Scale / 2, 0) --Scaling
local tweenTime = 0.2

--//Tweens
local hoverTween = tweenService:Create(ui, TweenInfo.new(tweenTime), {Size = hoverSize, Position = hoverPosition})
local leaveTween = tweenService:Create(ui, TweenInfo.new(tweenTime), {Size = originalSize, Position = originalPosition})

ui.MouseEnter:Connect(function() --When mouse enters
    hoverTween:Play()
end)

ui.MouseLeave:Connect(function() --When mouse leaves
    leaveTween:Play()
end)
