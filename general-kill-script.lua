local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Kill Player")
local b = w:CreateFolder("Kill")
local c = w:CreateFolder("Other")
local d = w:CreateFolder("Settings")
getgenv().killingThePlayer = false
getgenv().lp = game:FindService("Players").LocalPlayer

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end 
    elseif strl == "me" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lp.Name or v.DisplayName == lp.Name then
                table.insert(Found,v)
            end
        end 
    else
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == strl or v.DisplayName:lower():sub(1, #String) == strl then
                table.insert(Found,v)
            end
        end 
    end
    return Found 
end

function respawn()
    local character = lp.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    end
    character:ClearAllChildren()
    local newCharacter = Instance.new("Model")
    newCharacter.Parent = workspace
    lp.Character = newCharacter
    wait()
    lp.Character = character
    newCharacter:Destroy()
end

local function killPlayer()
    if getgenv().targetPlayer then
        local Target = gplr(getgenv().targetPlayer)
        if Target[1] then
            Target = Target[1]
            local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
            Thrust.Force = Vector3.new(9999,9999,9999)
            Thrust.Name = "Force"
            repeat
                lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                Thrust.Location = Target.Character.HumanoidRootPart.Position
                game:FindService("RunService").Heartbeat:wait()
            until not Target.Character:FindFirstChild("Head") or not getgenv().killingThePlayer
            respawn()
        else
            notif("Invalid player")
        end
    end
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

c:Toggle("Sprinting", function(bool)
    sprintingSetting = bool
    print("Shift-to-Sprint is: ", bool)
end)

userInput.InputBegan:Connect(beginSprint)
userInput.InputEnded:Connect(endSprint)

b:Box("Player:","string",function(value)
    getgenv().targetPlayer = value
end)

b:Toggle("Kill", function(bool)
    getgenv().killingThePlayer = bool
    if bool then
        coroutine.wrap(killPlayer)()
    end
end)

d:DestroyGui()
