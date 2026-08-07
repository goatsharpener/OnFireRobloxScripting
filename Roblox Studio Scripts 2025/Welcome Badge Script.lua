--//Variables
local badgeID = 1576562945771162 -- Replace with you own ID

--//Services
local BadgeService = game:GetService("BadgeService") --Variable for badge service
local Players = game:GetService("Players") --Variable for Players

--//Functions
local function awardBadge(player) --Function for awarding badges
	local success, hasBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeID)
	end)
	
	if success and not hasBadge then --If protected call is a success, give badge (given player doesn't already have badge)
		pcall(function()
			BadgeService:AwardBadge(player.UserId, badgeID) --Actual line awarding Badge
		end)
	end
end

Players.PlayerAdded:Connect(awardBadge) --Initiate badge awarding when a player joins the game
