local gameID = tostring(game.GameId)
print("hecker_melon was here")

local supported_games = {
    "102464178326906",
}

for _, v in ipairs(supported_games) do
    if v == gameID then
        print("Game is supported!")
        break
    end
end
print(gameID)

loadstring("https://raw.githubusercontent.com/FXSploit/FXHub/refs/heads/main/games/".. tostring(gameID).. ".lua", true)()