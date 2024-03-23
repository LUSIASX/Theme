local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()


function topos2(Pos)
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/310, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if _G.Sit then if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/310, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 100 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        topos2(game.Players.localPlayer.Character.HumanoidRootPart.Position)
        tween:Cancel()
        _G.Clip = false
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(18)
    end

    if _G.BypassTeleport and not _G.AutoCompleteTrial and not _G.Teleport_to_Mythic_Island and not _G.Teleport_to_Gear and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") then
        if Distance > 3000 then
            if _G.Auto_Cursed_Captain and not game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") and not game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(921.5810546875, 125.0942611694336, 32843.96484375))
            else
                pcall(function()
                    tween:Cancel()
                    fkwarp = false
                    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                        if fkwarp == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
                        end
                        fkwarp = true
                    end
                    wait(.08)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                    repeat task.wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                    wait(0.2)
                    return
                end)
            end
        end
    end
end

function totarget(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/310, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 200 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        topos2(game.Players.localPlayer.Character.HumanoidRootPart.Position)
        tween:Cancel()
        wait(.2)
        _G.Clip = false
    end

    if _G.BypassTeleport and not _G.Teleport_to_Mythic_Island and not _G.Teleport_to_Gear and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
		if Distance > 3000 then
			pcall(function()
				tween:Cancel()
				fkwarp = false
                if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                    if fkwarp == false then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
                    end
                    fkwarp = true
                end
                wait(.08)
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                repeat task.wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
				wait(0.2)

				return
			end)
		end
    end
end

function toposMob(target)
    topos(target * CFrame.new(0,50,0))
end

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        wait(1)
        _G.StopTween = false
        _G.NoClip = false
    end
end

if game.PlaceId == 2753915549 then
	World1 = true
elseif game.PlaceId == 4442272183 then
	World2 = true
elseif game.PlaceId == 7449423635 then
	World3 = true
end

local Window = Fluent:CreateWindow({
    Title = "SixMa Tool",
    SubTitle = "by mhooyongtar",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "tv-2" }),
    Travel = Window:AddTab({ Title = "Travel", Icon = "star" }),
    Server = Window:AddTab({ Title = "Server", Icon = "list-collapse" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    local Weapon = Tabs.Main:AddDropdown("SelectWapon", {
        Title = "Select Weapon / Combat",
        Values = {"Melee","Sword","Gun","Blox Fruit"},
        Multi = false,
        Default = 1,
    })

    Weapon:OnChanged(function(Value)
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.ToolTip == Value then
                _G.Select_Weapon = v.Name
            end
        end
        print(_G.Select_Weapon)
    end)

    Tabs.Main:AddParagraph({
        Title = "Paragraph",
        Content = "This is a paragraph.\nSecond line!"
    })


    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    local AutoAncientOneQuest = Tabs.Main:AddToggle("AutoAncientOneQuest", {
        Title = "Auto AncientOneQuest",
        Default = false 
    })

    AutoAncientOneQuest:OnChanged(function()
        _G.AncientOne_Quest = AutoAncientOneQuest.Value
        StopTween(_G.AncientOne_Quest)
    end)

    local AutoCompleteTrial = Tabs.Main:AddToggle("AutoCompleteTrial", {
        Title = "Auto Complete Trial",
        Default = false 
    })

    AutoCompleteTrial:OnChanged(function()
        _G.AutoCompleteTrial = AutoCompleteTrial.Value
        StopTween(_G.AutoCompleteTrial)
    end)

    spawn(function()
        while wait(.1) do
            if _G.HumanTrial and _G.AutoCompleteTrial then
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 300 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.HumanTrial or not _G.AutoCompleteTrial or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end
        end
    end)
    
    spawn(function()
        while wait(.1) do
            if _G.GhoulTrial and _G.AutoCompleteTrial then
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 300 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.GhoulTrial or not _G.AutoCompleteTrial or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end
        end
    end)
    
        spawn(function()
            while wait() do
                if _G.HumanTrial and _G.AutoCompleteTrial then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 1000 then
                                pcall(function()
                                    repeat wait(.1)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                    until not _G.HumanTrial or not _G.AutoCompleteTrial or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    
        spawn(function()
            while wait() do
                if _G.GhoulTrial and _G.AutoCompleteTrial then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 1000 then
                                pcall(function()
                                    repeat wait(.1)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                    until not _G.GhoulTrial or not _G.AutoCompleteTrial or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    
    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.AutoCompleteTrial then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer then
                        if game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Human" and game:GetService("Workspace").Map["HumanTrial"] and game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"] then
                            if _G.AutoCompleteTrial and (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                                repeat wait(.1)
                                    _G.HumanTrial = true
                                until not game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"] or not _G.AutoCompleteTrial or (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500
                            else
                                _G.HumanTrial = false
                            end
                        elseif game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Ghoul" and game:GetService("Workspace").Map["GhoulTrial"] and game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"] then
                            if _G.AutoCompleteTrial and (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                                repeat wait(.1)
                                    _G.GhoulTrial = true
                                until not game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"] or not _G.AutoCompleteTrial or (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500
                            else
                                _G.GhoulTrial = false
                            end
                        elseif game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Fishman" and game:GetService("Workspace").Map["FishTrial"] then
                            if _G.AutoCompleteTrial then       
                                repeat wait(.1)   
                                    _G.FishTrial = true
                                until not game:GetService("Workspace").Map["FishTrial"]
                            else
                                _G.FishTrial = false
                            end
                        elseif game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Cyborg" and game:GetService("Workspace").Map["CyborgTrial"] then
                            if _G.AutoCompleteTrial and (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the Machine"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                                repeat wait(.1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14896.5341796875, 102.62469482421875)
                                until not _G.AutoCompleteTrial or (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the Machine"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1000
                            end
                        elseif game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Skypiea" and game:GetService("Workspace").Map["SkyTrial"] then
                            if _G.AutoCompleteTrial and (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                                repeat wait(.1)
                                    for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model.FinishPart:GetChildren()) do
                                        if v.Name == "TouchInterest" and v.Parent then
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                                            wait(.1)
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                                        end
                                    end
                                until not game:GetService("Workspace").Map.SkyTrial.Model:FindFirstChild("FinishPart") or not game:GetService("Workspace").Map:FindFirstChild("SkyTrial") or not _G.AutoCompleteTrial or (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500
                            end
                        elseif game:GetService("Players")["LocalPlayer"].Data.Race.Value == "Mink" and game:GetService("Workspace").Map["MinkTrial"] and game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"] then
                            if _G.AutoCompleteTrial and (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                                repeat wait(.1)
                                    for i,v in pairs(game:GetService("Workspace").StartPoint:GetChildren()) do
                                        if v.Name == "TouchInterest" and v.Parent then
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                                            wait(.1)
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                                        end
                                    end
                                until not game:GetService("Workspace"):FindFirstChild("StartPoint") or not game:GetService("Workspace").Map:FindFirstChild("MinkTrial") or not _G.AutoCompleteTrial or (game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500
                            end
                        end
                    end
                end
            end)
        end
    end)

    FastAttackSpeed = true ------------------ ไว้บนสคริป
_G.Fast_Delay = 0.01 ------------------ ไว้บนสคริป
------------------ ------------------ ------------------ 
local CurveFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService("VirtualUser")
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShaker:Stop()
function CurveFuckWeapon()
    local p13 = CurveFrame.activeController
    local wea = p13.blades[1]
    if not wea then
        return
    end
    while wea.Parent ~= game.Players.LocalPlayer.Character do
        wea = wea.Parent
    end
    return wea
end

function getHits(Size)
    local Hits = {}
    local Enemies = workspace.Enemies:GetChildren()
    local Characters = workspace.Characters:GetChildren()
    for i = 1, #Enemies do
        local v = Enemies[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if
            Human and Human.RootPart and Human.Health > 0 and
                game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 5
         then
            table.insert(Hits, Human.RootPart)
        end
    end
    for i = 1, #Characters do
        local v = Characters[i]
        if v ~= game.Players.LocalPlayer.Character then
            local Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and
                    game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    return Hits
end

function Boost()
    task.spawn(function()
    	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurveFuckWeapon()))
    end)
end

function Unboost()
    tsak.spawn(function()
    	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon",tostring(CurveFuckWeapon()))
    end)
end

local cdnormal = 0
local Animation = Instance.new("Animation")
local CooldownFastAttack = 0

FastAttack = function()
    local ac = CurveFrame.activeController
    if ac and ac.equipped then
        task.spawn(function()
            if tick() - cdnormal > 0.5 then
                ac:attack()
                cdnormal = tick()
            else
                Animation.AnimationId = ac.anims.basic[2]
                ac.humanoid:LoadAnimation(Animation):Play(1, 1)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
            end
        end)
    end
end

bs = tick()
task.spawn(function()
	while task.wait(_G.Fast_Delay) do
		if FastAttackSpeed then
		    _G.Fast = true
			if bs - tick() > 0.72 then
				task.wait()
				bs = tick()
			end
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
							FastAttack()
							task.wait()
							Boost()
						end
					end
				end
			end)
		end
	end
end)

k = tick()
task.spawn(function()
    if _G.Fast then
    while task.wait(.2) do
            if k - tick() > 0.72 then
                task.wait()
                k = tick()
            end
            end
            pcall(function()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            task.wait(.000025)
                            Unboost()
                        end
                    end
                end
            end)
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Fast then
	   pcall(function()
		CurveFrame.activeController.timeToNextAttack = -1
		CurveFrame.activeController.focusStart = 0
		CurveFrame.activeController.hitboxMagnitude = 100
		CurveFrame.activeController.humanoid.AutoRotate = true
		CurveFrame.activeController.increment = 1 + 1 / 1
	   end)
    end
    end
end)

abc = true
task.spawn(function()
    local a = game.Players.LocalPlayer
    local b = require(a.PlayerScripts.CombatFramework.Particle)
    local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    if not shared.orl then
        shared.orl = c.wrapAttackAnimationAsync
    end
    if not shared.cpc then
        shared.cpc = b.play
    end
    if abc then
        pcall(function()
            c.wrapAttackAnimationAsync = function(d, e, f, g, h)
            local i = c.getBladeHits(e, f, g)
            if i then
                b.play = function()
                end
                d:Play(0.25, 0.25, 0.25)
                h(i)
                b.play = shared.cpc
                wait(.5)
                d:Stop()
            end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Auto_Raid or _G.Auto_Don_Swan or _G.Auto_Stone or _G.Auto_Sea_Beasts or _G.Find_Kitsune_Island or _G.Collect_Azure_Ember or _G.Teleport_to_Kitsune_Island or _G.Auto_Cursed_Captain or _G.Damage_Aura or _G.AutoCompleteTrial or _G.AncientOne_Quest or _G.TeleporttoIsland or _G.Teleport_to_Gear or _G.Teleport_to_Mythic_Island or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Dough_King then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else	
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end)
end)
 
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Auto_Raid or _G.Auto_Don_Swan or _G.Auto_Stone or _G.Auto_Sea_Beasts or _G.Find_Kitsune_Island or _G.Collect_Azure_Ember or _G.Teleport_to_Kitsune_Island or _G.Auto_Cursed_Captain or _G.Damage_Aura or _G.AutoCompleteTrial or _G.AncientOne_Quest or _G.TeleporttoIsland or _G.Teleport_to_Gear or _G.Teleport_to_Mythic_Island or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Dough_King then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Auto_Raid or _G.Auto_Don_Swan or _G.Auto_Stone or _G.Auto_Sea_Beasts or _G.Find_Kitsune_Island or _G.Collect_Azure_Ember or _G.Teleport_to_Kitsune_Island or _G.Auto_Cursed_Captain or _G.Damage_Aura or _G.AutoCompleteTrial or _G.AncientOne_Quest or _G.TeleporttoIsland or _G.Teleport_to_Gear or _G.Teleport_to_Mythic_Island or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Dough_King then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
    end)
end)


function EquipWeapon(ToolSe)
if not _G.NotAutoEquip then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.1)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end
end

function UnEquipWeapon(Weapon)
if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
    _G.NotAutoEquip = true
    wait(.5)
    game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
    wait(.1)
    _G.NotAutoEquip = false
end
end

function AutoHaki()
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end

local VirtualInputManager = game:GetService('VirtualInputManager')

function AutoUseAwakening()
VirtualInputManager:SendKeyEvent(true, "Y", false, game)
wait()
VirtualInputManager:SendKeyEvent(false, "Y", false, game)
end

spawn(function()
while wait() do
    pcall(function()
        if _G.AncientOne_Quest then
            AutoUseAwakening()
        end
    end)
end
end)

HauntedCastlePoint = CFrame.new(-9513.0771484375, 142.13059997558594, 5535.80859375)

spawn(function()
while wait() do
    pcall(function()
        if _G.AncientOne_Quest and World3 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
            
            else
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            end
        end
    end)
end
end)

spawn(function()
while wait(.3) do
    pcall(function()
        if not _G.FastAttack and not _G.FastAttackEL and not _G.FastAttackDK and not _G.FastAttackCP and not _G.FastAttackDA and not _G.FastAttackCC and not _G.FastAttackST and not _G.FastAttackDSW then
            FastAttackSpeed = false
        else
            FastAttackSpeed = true
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if _G.AncientOne_Quest then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
            if not game.Players.LocalPlayer.Character:FindFirstChild("RaceParticle") and not game.Players.LocalPlayer.Character:FindFirstChild("RaceParticles") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    AutoHaki()
                                    EquipWeapon(_G.Select_Weapon)
                                    _G.FastAttack = true
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    AncientOneMon = v.HumanoidRootPart.CFrame
                                    AncientOneMonName = v.Name
                                    toposMob(v.HumanoidRootPart.CFrame)
                                until _G.AncientOne_Quest == false or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character:FindFirstChild("RaceParticle") or game.Players.LocalPlayer.Character:FindFirstChild("RaceParticles")
                            end
                        else
                            UnEquipWeapon(_G.Select_Weapon)
                            _G.FastAttack = false
                        end
                    end
                else
                    UnEquipWeapon(_G.Select_Weapon)
                    _G.FastAttack = false
                    topos(CFrame.new(-9513.0771484375, 142.13059997558594, 5535.80859375))
                end
            else
                UnEquipWeapon(_G.Select_Weapon)
                _G.FastAttack = false
                topos(CFrame.new(-9501.73046875, 600.0858154296875, 6034.048828125))
            end
        else
            _G.FastAttack = false
        end
    end)
end
end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if _G.AncientOne_Quest and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - AncientOneMon.Position).magnitude <= 200 then
                if AncientOneMonName == v.Name then
                    v.HumanoidRootPart.CFrame = AncientOneMon
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    v.HumanoidRootPart.Locked = true
                    v.Humanoid:ChangeState(14)
                    v.Humanoid:ChangeState(11)
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                end
            end
        end
    end)
end)
end)

spawn(function()
while wait(.3) do
    pcall(function()
        if FastAttackSpeed then
            repeat wait(.1)
                AttackNoCD()
            until not FastAttackSpeed
        end
    end)
end
end)

    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
