--//NOTE: this will work with any coin, as long as coinamount exists and you decreased the coinamount counter when you collect your coin

--//Services
local ReplicatedStorage = game:GetService("ReplicatedStorage") --Variable for Replicated Storage

--//Variables
local coinamount = workspace.CoinAmount --Variable for IntAmount inside workspace
local coin = ReplicatedStorage:WaitForChild("Coin") --Variable for your coin in the Replicated Storage

--//Functions
local function spawnCoins() --New function to spawn coins
	for count = 1, 20 do --Repeat 20 times (replace 20 with amount of coins you want to spawn)
		local newcoin = coin:Clone() --Copy the coin
		local randomx = math.random(-118, 150) --Random X Value
		local randomz = math.random(-163, 190) --Random Z Value
		newcoin.Position = Vector3.new(randomx, 1.5, randomz) --Place new coin in random place
		newcoin.Parent = workspace --Place coin inside the workspace
		coinamount.Value += 1 --Increment IntValue inside workspace
	end
end

spawnCoins() --Spawn coins when the server first starts

coinamount.Changed:Connect(function() --When number of coins changes
	if coinamount.Value <= 10 then --If total number of coins drops to 10 or below (replace 10 with amount of coins you want left in the world before spawning more)
		spawnCoins() --Spawn coins
	end
end)
