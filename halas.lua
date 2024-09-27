local partContainer = workspace:WaitForChild("FogScreenObjects")

local fogscreensize = 500
local res = 600
local freq = 9
local ampl = 14
local seed = math.random(-9999999,9999999)
local function getheight(x,z)
	local noiseheight = math.noise(x/res*freq,z/res*freq,seed)
	noiseheight = math.clamp(noiseheight, -0.5, 0.5) + 0.5
	
	return noiseheight
end

for x = 0, fogscreensize do
	for z = 0, fogscreensize do
		local part = Instance.new("Part")
		part.Parent = partContainer
		part.Anchored = true
		part.Size = Vector3.new(1, 1,1)
		local height = getheight(x,z)
		part.Position = Vector3.new(x, height*ampl, z)
		if height*ampl <= 0.4 then
			part.Color = Color3.new(0,0.3,1)
		elseif height*ampl >= 1.1 then
			part.Color = Color3.fromRGB(0,100,30)
		else
			part.Color = Color3.new(1,1,0)
		end
		part.Material = Enum.Material.SmoothPlastic
		--part.Color = Color3.new(0, 0, 0)
		
	end
	game:GetService("RunService").Heartbeat:Wait()
end
