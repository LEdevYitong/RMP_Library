--Variables
local damagePart = script.Parent
local damagePercentage = 25
local damageAmount = 30
local isTouched = false

--Functions
local function DamageCharacterOnTouch(otherPart)
	--Debouncing
	if isTouched then return end
	isTouched = true
    
    --Double-check if the part is touched by a character with health
	local character = otherPart.Parent
	local humanoid = character:FindFirstChild('Humanoid')
	if not humanoid then return end
	
	--[Option 1] Damage the character by percentage
	--humanoid.Health -= humanoid.MaxHealth * (damagePercentage / 100)

    --[Option 2] Damage the character by amount
	humanoid.Health -= damageAmount
    print(character.Name .. ' has damaged by ' .. damagePart.Name)

    --Reset debouncing
	wait(1)
	isTouched = false
end

--Events
damagePart.Touched:Connect(DamageCharacterOnTouch)