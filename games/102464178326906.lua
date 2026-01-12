local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local players = game:GetService("Players")

local Window = Fluent:CreateWindow({
    Title = "FXHub",
    SubTitle = "by FXSploit / hecker_melon",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "FXHub",
        Content = "",
        Duration = 3
    })



    Tabs.Main:AddParagraph({
        Title = "Welcum," .. players.LocalPlayer.DisplayName .. "!",
        Content = "ty 4 using FXhub"
    })




    local Infsta = Tabs.Main:AddToggle("Infsta", {Title = "[OP] Infinite stamina", Default = false })

    local Infmana = Tabs.Main:AddToggle("Infmana", {Title = "[For Wizard] Infinite mana", Default = false })

    Tabs.Main:AddButton({
        Title = "Tp 2 end",
        Description = "makes the game unfunny ngl",
        Callback = function()
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Sections.ShopArea.Exit.CFrame
        end
    })

    --Tabs.Main:AddButton({
    --    Title = "[no redo] pototo graphics",
    --    Callback = function()
    --        for i, v in game.Lighting do
    --            v:Destroy()
    --        end
    --    end
    --})

    Infsta:OnChanged(function()
        if Options.Infsta.Value then
            task.spawn(function()
                while Options.Infsta.Value do
                    local stamina = players.LocalPlayer.Character:FindFirstChild("Stamina")
                    if stamina then
                        stamina.Value = math.random(133,150)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end)

    
    Infmana:OnChanged(function()
        if Options.Infmana.Value then
            task.spawn(function()
                while Options.Infmana.Value do
                    local mana = players.LocalPlayer.Character:FindFirstChild("Mana")
                    if mana then
                        mana.Value = math.random(101,133)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end)

    Options.Infsta:SetValue(false)

    Options.Infmana:SetValue(false)


end


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})


InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)



SaveManager:LoadAutoloadConfig()