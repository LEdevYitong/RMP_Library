--Variables
local healPart = script.Parent
local healPercentage = 25
local healAmount = 30
local isTouched = false

--Functions
local function HealCharacterOnTouch(otherPart)
	--Debouncing
	if isTouched then return end
	isTouched = true
    
    --Double-check if the part is touched by a character with health
	local character = otherPart.Parent
	local humanoid = character:FindFirstChild('Humanoid')
	if not humanoid then return end
	
	--[Option 1] Heal the character by percentage
	humanoid.Health += humanoid.MaxHealth * (healPercentage / 100)

    --[Option 2] Heal the character by amount
	--humanoid.Health += healthAmount

    --(For Option 1 & 2 only) Make sure the character's health doesn't exceed max health
    if humanoid.Health > humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end

    --[Option 3] Fully recover
    --humanoid.Health = humanoid.MaxHealth
    print(character.Name .. ' has healed by ' .. healPart.Name)

    --Reset debouncing
	wait(1)
	isTouched = false
end

--Events
healPart.Touched:Connect(HealCharacterOnTouch)