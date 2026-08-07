--//Script should be under the StarterGui
--//Variables
local button = script.Parent --Button Variable
local music = workspace:WaitForChild("Relaxed Scene") --Music Variable, replace "Relaxed Scene" with the name of your music
local red = BrickColor.new("Really red") --Variable for color red
local green = BrickColor.new("Lime green") --Variable for color green
local playing = true --Boolean Value for if music is playing

--//Click to Mute/Unmute
button.MouseButton1Click:Connect(function() --Script runs when button is clicked
	if playing then --If Boolean "Playing" is true then
		playing = false --Set Boolean "Playing" to false
		button.BackgroundColor = red --Change background color to Red
		button.Text = "Off" --Change text to "Off"
		music.Playing = false --Stop playing the music
	elseif not playing then --If Boolean "Playing" is false then
		playing = true --Set Boolean "Playing" to true
		button.BackgroundColor = green --Change background color to Green
		button.Text = "On" --Change text to "On"
		music.Playing = true --Start playing the music
	end
end)

--NOTE:
--This Script does not include a cooldown. If you would like to add one, you can watch the full tutorial here: (It also shows you how to set this script up!)
--https://youtu.be/kpBJFDxSXik?si=nD_tMlIX-3EbiPlq
