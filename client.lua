
local uiopened = false
local vehiclemaxspeed = 0
local currentspeed = 0
local vehicletosixty = 0
local sleep = 1000
local multiplier = 3.6 --Change it to 2.2369 FOR MPH!
local hitsixty = false
local timer = 0
local timer2 = 0
local hitonehundred = false
local vehicle
local player = PlayerPedId()

---CHECKS IF A PLAYER IS INSIDE VEHICLE
---RETURNS VALUES LIKE CURRSPEED, MAXSPEED, 0-60, 0-100

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(sleep)   
        if IsPedInAnyVehicle(player, true) and uiopened then
            sleep = 0 
            vehicle = GetVehiclePedIsIn(player, false)
            currentspeed = GetEntitySpeed(vehicle) * multiplier
            if currentspeed > vehiclemaxspeed then 
                vehiclemaxspeed = currentspeed
            end
            if currentspeed <= 60 and currentspeed > 1 and not hitonehundred then    
                timer = timer + 1        
            end
            if currentspeed <= 100 and currentspeed > 1 and not hitonehundred then 
                timer2 = timer2 + 1 
            end
            if currentspeed >= 100 then 
                hitonehundred = true
            end
            SendNUIMessage({
                currentspeed = currentspeed,
                timer = timer / 100,
                timer2 = timer2 / 100,
                vehiclemaxspeed = vehiclemaxspeed,
            })

        else
            sleep = 1000
            vehiclemaxspeed = 0
            timer = 0
            timer2 = 0
            hitonehundred = false
            SendNUIMessage({
                currentspeed = currentspeed,
                timer = timer / 100,
                timer2 = timer2 / 100,
                vehiclemaxspeed = vehiclemaxspeed,
            })
        end
    end
end)

--------RESETS VALUES--------
RegisterCommand("reset", function()
    vehiclemaxspeed = 0
    timer = 0
    timer2 = 0
    hitonehundred = false
end)
--------OPENS UI--------
RegisterCommand('tahometer', function()
    if not uiopened then 
        uiopened = true
        SendNUIMessage({
            type = "ui"
        })
    else
        uiopened = false
        SendNUIMessage({
            type = "ui_close"
        })
    end
end)