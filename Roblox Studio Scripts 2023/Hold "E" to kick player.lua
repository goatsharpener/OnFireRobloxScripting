script.Parent.Triggered:Connect(function(player) --When we trigger the proximity prompt, pass the parameter player
	player:Kick("You got kicked lol") --Kick the player with the message. Replace "you got kicked" with your own message
end)
