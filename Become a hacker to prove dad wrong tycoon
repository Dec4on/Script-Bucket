local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HackServiceset = ReplicatedStorage.Packages.Knit.Services.HackService
local StartHack = HackServiceset.RF.StartHack
local EndHack = HackServiceset.RF.EndHack
getgenv().AutoUpgrade = false;
getgenv().AutoHack = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Become a Hacker")
local b = w:CreateFolder("Automation")
local c = w:CreateFolder("Get Items")
local d = w:CreateFolder("Settings")

function autohack()
	spawn(function()
		while AutoHack do
			StartHack:InvokeServer()
			wait(3)
			EndHack:InvokeServer()
			wait()
		end
	end)	
end

function autoupgrade()
	spawn(function()
		while AutoUpgrade do
			local A_1 = "TypingSpeed"
			local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.DataService.RF.BuyUpgrade
			Event:InvokeServer(A_1)

			A_1 = "WifiSpeed"
			Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.DataService.RF.BuyUpgrade
			Event:InvokeServer(A_1)

			A_1 = "HackSkill"
			Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.DataService.RF.BuyUpgrade
			Event:InvokeServer(A_1)

			wait(10)
		end
	end)	
end

function getTool(tool)
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Tool = game:GetService("ReplicatedStorage")[tool]
	Tool.Parent = LocalPlayer.Backpack
end

b:Toggle("Auto-Hack",function(bool)
    getgenv().AutoHack = bool
    print("Auto-Hack is: ", bool)
    if bool then
		autohack()
    end
end)

b:Toggle("Auto-Upgrade",function(bool)
    getgenv().AutoUpgrade = bool
    print("Auto-Upgrade is: ", bool)
    if bool then
		autoupgrade()
    end
end)

c:Button("Energy Drink",function()
    getTool("Energy Drink")
end)

c:Button("Hammer",function()
    getTool("Hammer")
end)

c:Button("Bucket",function()
    getTool("Bucket")
end)

d:DestroyGui()
