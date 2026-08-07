--//Non Added String Version: (No "Tip: "or "Hint: "in front of the tip/hint)

--//Variables
local textlabel = script.Parent --Sets a variable for the textlabel
local tips = { --Creates a list of tips
	"Make sure you Subscribe to OnFireRobloxScripting - YT", --For every tip you add, MAKE SURE THAT:
	"I love cheeseburgers", --The tip is between the quotation marks
	"Did you know that [Insert fun fact here]", --There is a comma outside of the quotation marks
}

--//Loop
while task.wait(10) do --Every 10 seconds do what is in the loop (10 in the brackets means 10 seconds)
	textlabel.Text = tips[math.random(1, #tips)] --Set the textlabel's text to a random tip from the tip list
end

--//Added String Version: (Adds a "Tip: "or "Hint: "in front of the tip/hint)

--//Variables
local textlabel = script.Parent --Sets a variable for the textlabel
local tips = { --Creates a list of tips
	"Make sure you Subscribe to OnFireRobloxScripting - YT", --For every tip you add, MAKE SURE THAT:
	"I love cheeseburgers", --The tip is between the quotation marks
	"Did you know that [Insert fun fact here]", --There is a comma outside of the quotation marks
}

--//Loop
while task.wait(10) do --Every 10 seconds do what is in the loop (10 in the brackets means 10 seconds)
	textlabel.Text = "Tip: "tips[math.random(1, #tips)] --Set the textlabel's text to a random tip from the tip list. Change "Tip: " to "Hint: " if you want it to say Hint:
end
