local gameID = tostring(game.GameId)
print("hecker_melon was here")
print(gameID)
local supported_games = {
    "9098443082",
}

for _, v in ipairs(supported_games) do
    if v == gameID then
        print("Game is supported!")
        break
    end
end


loadstring("https://raw.githubusercontent.com/FXSploit/FXHub/refs/heads/main/games/".. tostring(gameID).. ".lua", true)()