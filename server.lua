----------------------------------
-- Player Logger, Made by FAXES --
----------------------------------

fileName = "Player-Logs" -- Name of the txt file. Do not include .txt
resourceDirectory = "resources/PlayerLogger/" -- Directory from server-data folder. Include the / at the end. This is not needed if the below is false
saveInResource = false -- Save the Player-Logs.txt into the resource. Having this off leaves it in the server-data folder. 
-- NOTE: If on you MUST change the directory above so its correct!
logSteamId = true
logRockId = true
logDiscordId = true
logIP = true

function writeLog(name, identifierSteam, identifierRock, identifierDiscord, identifierIP)
    local time = os.date("%m/%d/%Y %I:%M %p")
    if saveInResource == true then
        file = io.open(resourceDirectory .. fileName .. ".txt", "a")
    else
        file = io.open(fileName .. ".txt", "a")
    end
    if file then
        file:write("[" .. time .. "] Name: " .. name .. " -> Steam: " .. identifierSteam .. " -> Licence: " .. identifierRock .. " -> IP: " .. identifierIP .. " -> Discord: " .. identifierDiscord .. " \r\n")
    end
    file:close()
end

AddEventHandler('playerConnecting', function()
    local source = source
    local identifierIP = GetPlayerEP(source)
    local name = GetPlayerName(source)
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifierSteam = v
        end
        if string.sub(v, 1, string.len("license:")) == "license:" then
            identifierRock = v
        end
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierSteam == nil or not logSteamId then
        identifierSteam = "N/A"
    end
    if identifierRock == nil or not logRockId then
        identifierRock = "N/A"
    end
    if identifierDiscord == nil or not logDiscordId then
        identifierDiscord = "N/A"
    end
    if identifierIP == nil or not logSteamId then
        identifierIP = "N/A"
    end
    
    writeLog(name, identifierSteam, identifierRock, identifierDiscord, identifierIP)
end)
