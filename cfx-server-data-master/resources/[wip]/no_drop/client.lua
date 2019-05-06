
--=================================--
--			Threading DO NOT EDIT 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
       	findNpc()
    end
end)

function findNpc()
    local aiming = false
    local entity
    if IsPlayerFreeAiming(PlayerId()) then
        aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
        if (aiming) then
            if IsEntityAPed(entity) then
                SetPedDropsWeaponsWhenDead(entity, false) 
            end
        end
    end
end