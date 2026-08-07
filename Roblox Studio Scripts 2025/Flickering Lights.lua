--//Variables
local light = script.Parent --Variable for light part
local spotlight = light.SpotLight --Variable for spotlight

while task.wait(0.1) do --A forever loop that runs every 0.1 seconds
    if math.random() < 0.1 then --10% chance
        spotlight.Enabled = false --spotlight flickers
        task.wait(0.1)
        spotlight.Enabled = true
    end
end
