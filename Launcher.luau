local SpeedXZ = 5
local Projectile = game.ServerStorage.Projectile
local Cannon = script.Parent

--
--
-- 
-- human walkspeed: 16  
--  XZ velocity vector should be 16 


-- similar triangles velocity and displacement
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		
		local target = char
		
		local humanoid = char:WaitForChild("Humanoid")
		local HRootPart = char:WaitForChild("HumanoidRootPart")
		while true do
			
			local projClone = Projectile:Clone()
			
			projClone.Position = Cannon.Position
			
			local Velocity = HRootPart.AssemblyLinearVelocity
			
			local alignPos = Instance.new("AlignPosition",projClone)
			
			alignPos.Mode = "OneAttachment"
			alignPos.MaxForce = 1000000 --1,000,000
			alignPos.Attachment0 = projClone.Attachment
			alignPos.Position = HRootPart.Position
			
			projClone.Parent = workspace
			print(HRootPart.AssemblyLinearVelocity)
			--local speedVector = math.sqrt(math.pow(HRootPart.AssemblyLinearVelocity.X,2) + math.pow(HRootPart.AssemblyLinearVelocity.Z,2))
			--print(speedVector) mag of 16
			game:GetService("Debris"):AddItem(projClone,2)
			wait(1)
			
			
		end
		
	end)
	
	
end)