--//Variables
local speedPad = script.Parent --Variable for Speed Pad
local debounce = {} --Tracks players that have touched the Speed Pad

local BOOST_SPEED = 32 --Boosted Speed
local NORMAL_SPEED = 16 --16 is the default speed of Roblox games
local BOOST_TIME = 3 --Duration in seconds of the Speed Boost

--//Function
speedPad.Touched:Connect(function(hit) --When the speed pad is touched
    local character = hit.Parent --Variable for the character
    local humanoid = character and character:FindFirstChild("Humanoid") --Variable for the humanoid

    if humanoid and not debounce[character] then --If Player is not tracked yet
        debounce[character] = true --Start tracking the player

        humanoid.WalkSpeed = BOOST_SPEED --Boost Player's Speed

        task.wait(BOOST_TIME) --Wait boost duration
        humanoid.WalkSpeed = NORMAL_SPEED --Set Player's Speed back to normal

        debounce[character] = nil --Untrack the player
    end
end)
