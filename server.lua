----------------------------------
-- Player Logger, Made by FAXES --
----------------------------------

fileName = "Player-Logs" -- Name of the txt file. Do not include .txt
resourceDirectory = "resources/PlayerLogger/" -- Directory from server-data folder. Include the / at the end. This is not needed if the below is false
saveInResource = false -- Save the Player-Logs.txt into the resource. Having this off leaves it in the server-data folder. 
-- NOTE: If on you MUST change the directory above so its correct!

function writeLog(name, identifierSteam, identifierRock)
    local time = os.date("%m/%d/%Y %I:%M %p")
    if saveInResource == true then
        file = io.open(resourceDirectory .. fileName .. ".txt", "a")
    else
        file = io.open(fileName .. ".txt", "a")
    end
    if file then
        file:write("[" .. time .. "] Name: " .. name .. " -> ID: " .. identifierSteam .. " -> Licence: " .. identifierRock .. "\n")
    end
    file:close()
end

AddEventHandler('playerConnecting', function()
    local source = source
    local identifierSteam = GetPlayerIdentifiers(source)[1]
    local identifierRock = GetPlayerIdentifiers(source)[2]
    local name = GetPlayerName(source)

    if identifierSteam == nil then
        identifierSteam = "N/A"
    end
    if identifierRock == nil then
        identifierRock = "N/A"
    end
    
    writeLog(name, identifierSteam, identifierRock)
end)