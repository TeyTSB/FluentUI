function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message,
        ["username"] = "webhook mesage"
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        },
        ["username"] = "WhatTheSigma" 
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

local player = game.Players.LocalPlayer
local username = player.Name
local avatarId = player.UserId

local profileUrl = "https://www.roblox.com/tr/users/" .. avatarId .. "/profile"

local currentTime = os.date("%Y-%m-%d %H:%M:%S") 

local url = "https://discord.com/api/webhooks/1316870348817563658/o09QHLCOh1RYQ0Jav7ovsoy7fF5Yl2rVpQzzuFFtaPOHsOtFxeuKBlDoWCtfJ40mXUKH"



local embed = {
    ["title"] = "Someone Used VexonHub",
    ["description"] = "This Is Not IP Logger!!",
    ["color"] = 20202,
    ["fields"] = {
{
["name"] = "UserName",
["value"] = username,
["inline"] = true
},
{
            ["name"] = "Profile",
            ["value"] = profileUrl,
            ["inline"] = true
        },
        {
            ["name"] = "Time",
            ["value"] = currentTime,
            ["inline"] = true
        }
    },
    ["footer"] = {
        ["text"] = "By TheVex0n"
    }
}
SendMessageEMBED(url, embed)
