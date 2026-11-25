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
		
		local Initial = Vector3.new(0,0,0)
		while true do
			task.wait(0.2)
			local projClone = Projectile:Clone()
			
			projClone.Position = Cannon.Position
			
			local Velocity = HRootPart.AssemblyLinearVelocity
			
			local alignPos = projClone.AlignPosition
			
			alignPos.Mode = "OneAttachment"
			alignPos.MaxForce = 10000000 --10,000,000
			alignPos.Attachment0 = projClone.Attachment
			
			print(HRootPart.Position - Initial)
			print(HRootPart.AssemblyLinearVelocity)
			
			local Scale = (HRootPart.Position - Initial)  * 5
			Scale = Vector3.new(Scale.X,0,Scale.Z)
			print(Scale)
			alignPos.Position = HRootPart.Position + Scale
			print(HRootPart.Position + Scale)
			
			projClone.Parent = workspace
			
			--local speedVector = math.sqrt(math.pow(HRootPart.AssemblyLinearVelocity.X,2) + math.pow(HRootPart.AssemblyLinearVelocity.Z,2))
			--print(speedVector) mag of 16
			game:GetService("Debris"):AddItem(projClone,2)
			
			
			Initial = HRootPart.Position
		end
		
	end)
	
	
end)