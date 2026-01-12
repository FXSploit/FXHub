local gameID = tostring(game.GameId)
print("hecker_melon was here")
print(gameID)

local supported_games = {
    "9098443082",
}

for _, v in ipairs(supported_games) do
    if v == gameID then
        print("load!")

        loadstring(game:HttpGet("https://raw.githubusercontent.com/FXSploit/FXHub/refs/heads/main/games/" .. gameID .. ".lua"), true)()

        break
    end
end
