--Variables
local killPart = script.Parent
local isTouched = false

--Functions
local function KillCharacterOnTouch(otherPart)
	--Debouncing
	if isTouched then return end
	isTouched = true
	
	--Double-check if the part is touched by a character with health
	local character = otherPart.Parent
	local humanoid = character:FindFirstChild('Humanoid')
	if not humanoid then return end
	
	--Kill the character
	humanoid.Health = 0
	print(character.Name .. ' has killed by ' .. killPart.Name)

	--Reset debouncing
	wait(1)
	isTouched = false
end

--Events
killPart.Touched:Connect(KillCharacterOnTouch)