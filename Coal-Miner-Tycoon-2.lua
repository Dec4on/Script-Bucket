local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Coal Miner Tycoon 2")
local b = w:CreateFolder("Teleports")
local c = w:CreateFolder("Get Coal")
local d = w:CreateFolder("Other")
local e = w:CreateFolder("Settings")

function getCoal()
    local player = game:GetService("Players").LocalPlayer
    local tycoons = {"Blue Miners", "Green Miners", "Red Miners", "Orange Miners", "Purple Miners"}
    for _, tycoon in ipairs(tycoons) do
        local drops = game:GetService("Workspace")["TycoonKit 1.13"].Tycoons[tycoon].Drops
        for _, item in pairs(drops:GetChildren()) do
            item.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end


function tpToMiner()
    local teleport = game:GetService("Workspace")["TycoonKit 1.13"].Tycoons["Blue Miners"].Essentials.TycoonSpawn
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    character:SetPrimaryPartCFrame(CFrame.new(teleport.Position))
end

function tpToConveyor()
    local targetPosition = Vector3.new(508.9957, 4.1271, -61.6890)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
end

local userInput = game:GetService("UserInputService")
local players = game:GetService("Players")

local sprintSpeed = 30 
local walkSpeed = 16 
local player = players.LocalPlayer

local sprintingSetting = false

local function beginSprint(input, gameProcessed)
    if not gameProcessed then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local keycode = input.KeyCode
            if keycode == Enum.KeyCode.LeftShift and sprintingSetting then
                player.Character.Humanoid.WalkSpeed = sprintSpeed
            end
        end
    end
end

local function endSprint(input, gameProcessed)
    if not gameProcessed then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local keycode = input.KeyCode
            if keycode == Enum.KeyCode.LeftShift then
                player.Character.Humanoid.WalkSpeed = walkSpeed
            end
        end
    end
end

d:Toggle("Sprinting", function(bool)
    sprintingSetting = bool
    print("Shift-to-Sprint is: ", bool)
end)

userInput.InputBegan:Connect(beginSprint)
userInput.InputEnded:Connect(endSprint)


b:Button("Home",function()
    tpToMiner()
end)

b:Button("Mine",function()
    tpToConveyor()
end)

c:Button("TP Coal",function()
    getCoal()
end)

e:DestroyGui()
