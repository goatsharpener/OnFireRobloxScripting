--//Variables
local textbutton = script.Parent --Variable for Tip/Hint GUI
local tips = { --Table for tips, to add more, go down a line, write tip in quotes, then add a comma at the end
    "Fun Fact1: [insert cool fact about game]", --Feel Free to replace what is inside the quotes and delete/add any tips you want!
    "Fun Fact2: [insert cool fact about game]",
    "Fun Fact3: [insert cool fact about game]",
    "Tip1: [Tip Here]",
    "Tip2: [Tip Here]",
    "Tip3: [Tip Here]",
    "Hint1: [Hint Here]",
    "Hint2: [Hint Here]",
    "Hint3: [Hint Here]",
} --End table

--//Manual
textbutton.MouseButton1Click:Connect(function() --When user clicks on the button
    textbutton.Text = tips[math.random(1, #tips)] --Choose a random tip
end)

--//Automatic (Delete the next few lines if you don't want an automatic tip selector)
while task.wait(5) do --Every 5 seconds
    textbutton.Text = tips[math.random(1, #tips)] --Choose a random tip
end
