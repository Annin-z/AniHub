local uis = game:GetService("UserInputService")
local activated = false

if game.CoreGui:FindFirstChild("ScreenGui") == nil then
	local gui = Instance.new("ScreenGui",game.CoreGui)
	local frame = Instance.new("Frame",gui)
	frame.BackgroundColor3 = Color3.fromRGB(64,64,64)
	frame.Position = UDim2.new(0.2,0,0.125,0)
	frame.Size = UDim2.new(0.6,0,0.75,0)
	local UICorner = Instance.new("UICorner",frame)
	UICorner.CornerRadius = UDim.new(0.35,0)
	local textBox = Instance.new("TextBox",frame)
	textBox.Position = UDim2.new(0.3,0,0.7,0)
	textBox.Size = UDim2.new(0.4,0,0.12,0)
	textBox.TextScaled = true
	textBox.TextColor3 = Color3.fromRGB(255,255,255)
	textBox.Text = ""
	textBox.Font = "Jura"
	local title = Instance.new("TextLabel",frame)
	title.Position = UDim2.new(0.225,0,0.1,0)
	title.Size = UDim2.new(0.55,0,0.2,0)
	title.BackgroundTransparency = 1
	title.Font = "Jura"
	title.TextScaled = true
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.Text = "Enter the Key"
	local discord = Instance.new("TextLabel",frame)
	discord.Position = UDim2.new(0.225,0,0.3,0)
	discord.Size = UDim2.new(0.55,0,0.2,0)
	discord.BackgroundTransparency = 1
	discord.Font = "Jura"
	discord.TextScaled = true
	discord.TextColor3 = Color3.fromRGB(255,255,255)
	discord.Text = "Get it from https://discord.gg/g6TPHUKZkP"
	local tip = Instance.new("TextLabel",frame)
	tip.Position = UDim2.new(0.25,0,0.85,0)
	tip.Size = UDim2.new(0.5,0,0.1,0)
	tip.BackgroundTransparency = 1
	tip.Font = "Jura"
	tip.TextScaled = true
	tip.TextColor3 = Color3.fromRGB(255,255,255)
	tip.Text = "Tip: Alt+F to hide the GUI"
	textBox.FocusLost:Connect(function(enterPressed)
		if textBox.Text == "AnninMiruDayo" then
			activated = true
			frame:Destroy()
		end
	end)
	uis.InputBegan:Connect(function(input,gpe)
		if uis:IsKeyDown(Enum.KeyCode.LeftAlt) and input.KeyCode == Enum.KeyCode.F then
			gui.Enabled = not gui.Enabled
		end
	end)
end

repeat wait() until activated

if game.PlaceId == 5024793931 and game.Players.LocalPlayer.Team ~= "Deciding" then
	game.Lighting.ClockTime = 12
	workspace[game.Players.LocalPlayer.Name].AntiVelocity.Disabled = true
	workspace[game.Players.LocalPlayer.Name].AntiBH.Disabled = true
	game.Players.LocalPlayer.PlayerScripts.CloudScript.Disabled = true
	game.Players.LocalPlayer.PlayerScripts.AntiHitBox.Disabled = true
	game.Players.LocalPlayer.PlayerScripts.ClimateReplicator.Disabled = true
	for _,v in pairs(game:GetService("Lighting"):GetChildren()) do
		if not v:IsA("Tool") then
			v:Destroy()
		end
	end
	if workspace.GameTime.GamePlayer.Gamemode.Value == "Classic" then
		local gui = game:GetService("CoreGui").ScreenGui
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(0.2,0,0.1,0)
		button.TextColor3 = Color3.fromRGB(255,255,255)
		button.BackgroundColor3 = Color3.fromRGB(48,48,48)
		button.Font = "Jura"
		button.TextScaled = true
		local uiCorner = Instance.new("UICorner",button)
		uiCorner.CornerRadius = UDim.new(0.3,0)
		local tpEnemyTank1 = button:Clone()
		tpEnemyTank1.Text = "TP Enemy Tank 1"
		tpEnemyTank1.Parent = gui
		local tpEnemyTank2 = button:Clone()
		tpEnemyTank2.Text = "TP Enemy Tank 2"
		tpEnemyTank2.Position = UDim2.new(0.2,0,0,0)
		tpEnemyTank2.Parent = gui
		local invisible = button:Clone()
		invisible.Text = "Invisibility"
		invisible.Position = UDim2.new(0.4,0,0,0)
		invisible.Parent = gui
		local destroy = button:Clone()
		destroy.Text = "Destroy GUI"
		destroy.Position = UDim2.new(0.6,0,0,0)
		destroy.Parent = gui
		destroy.MouseButton1Click:Connect(function()
			gui:Destroy()
		end)
		invisible.MouseButton1Click:Connect(function()
			local character = game.Players.LocalPlayer.Character
			local storedCFrame = character.PrimaryPart.CFrame
			local part = Instance.new("Part",workspace)
			part.Size = Vector3.new(5,0,5)
			part.Anchored = true
			part.CFrame = CFrame.new(Vector3.new(9999,9999,9999))
			character.PrimaryPart.CFrame = part.CFrame*CFrame.new(0,3,0)
			if character:WaitForChild('Humanoid').RigType == Enum.HumanoidRigType.R6 then
				local Clone = character.HumanoidRootPart:Clone()
				character.HumanoidRootPart:Destroy()
				Clone.Parent = character
			else
				local Clone = character.LowerTorso:WaitForChild("Root"):Clone()
				character.LowerTorso.Root:Destroy()
				Clone.Parent = character.LowerTorso
			end
			part:Destroy()
			character.PrimaryPart.CFrame = storedCFrame
			for _,v in pairs(character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.5
				end
			end
		end)
		for _,v in pairs(workspace:GetDescendants()) do
			if v.Name == "Zeppelin" then
				if v.TEAM.Value ~= game.Players.LocalPlayer.TeamColor then
					tpEnemyTank1.MouseButton1Click:Connect(function()
						workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = v.FuelTank1.Top.CFrame
					end)
					tpEnemyTank2.MouseButton1Click:Connect(function()
						workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = v.FuelTank2.Top.CFrame
					end)
				else
					--
				end
			end
		end
	else
		--
	end
end