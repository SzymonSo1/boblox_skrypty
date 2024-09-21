Global_Parts_Tabble = {}
local path = game.Workspace
local i = 1
local PosMult = 5
Global_Parts_Tabble[1]= path.Part1.Position
script.Parent.MouseButton1Click:Connect(function() 
	for a = 1,10,1 do
		onclick()
	end
end)
function onclick()
	i += 1	
	local kopia = path:FindFirstChild("Part"..i-1):Clone()
	local loopCheck = 0
	kopia.Name = "Part"..i
	kopia.Parent = path
	local last_part = path:FindFirstChild("Part"..i-1)
	local lp_pos = last_part.Position
	while random_pos(kopia,last_part,lp_pos,i) == -1 do
		random_pos(kopia,last_part,lp_pos,i)
		loopCheck += 1
		if	loopCheck == 22 then
			print("part cant find a path")
			break
		end
	end
	Global_Parts_Tabble[i] = kopia.Position
	if i >= 11 then
		path:FindFirstChild("Part"..i-10):Destroy()
		Global_Parts_Tabble[i - 10] = nil
	end
	print(Global_Parts_Tabble)
end
function random_pos (kopia, last_part,lp_pos,i)
	local rng_pos = math.random(1,4)
	if rng_pos == 1 then
		kopia.Position = Vector3.new(last_part.Position.x+PosMult, lp_pos.y, lp_pos.z)
	elseif  rng_pos == 2 then
		kopia.Position = Vector3.new(lp_pos.x, lp_pos.y, last_part.Position.z+PosMult) 
	elseif rng_pos == 3 then
		kopia.Position = Vector3.new(lp_pos.x, lp_pos.y, last_part.Position.z-PosMult)
	elseif rng_pos == 4 then
		kopia.Position = Vector3.new(last_part.Position.x-PosMult, lp_pos.y, lp_pos.z)
	end
	for a = 0,i,1 do
		if Global_Parts_Tabble[a] == kopia.Position then
			return -1
		end
	end
end
