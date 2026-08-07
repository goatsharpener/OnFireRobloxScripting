--//Variables
local textLabel = script.Parent:WaitForChild("Message") --Reference your TextLabel
local message = "Welcome to the game!" --Your message
local speed = 0.05 --Speed in seconds per character

--//Functions
local function typewriter(textLabel, fullText, typingSpeed)
    textLabel.Text = "" --Clear text first
    for i = 1, #fullText do --Loop through every letter in your message
        textLabel.Text = string.sub(fullText, 1, i) --Sub in the message to its current index
        task.wait(typingSpeed) --Wait your typing speed
    end
end

task.wait(3)
typewriter(textLabel, message, speed)
