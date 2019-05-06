Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 178) then
            if GetVehiclePedIsIn(GetPlayerPed(-1), false) ~= nil then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false)) < 1 then
                   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), (not IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))), false, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = GetPlayerPed(-1)
		
		if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) and not IsPauseMenuActive() then
			local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
			Citizen.Wait(1000)
			if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not IsPauseMenuActive() then
				local veh = GetVehiclePedIsIn(ped, true)
				if (engineWasRunning) then
					SetVehicleEngineOn(veh, true, true, true)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
	local ped = GetPlayerPed(-1)
	local pVeh = GetVehiclePedIsIn(ped, false)
	
    if GetEntitySpeed(pVeh) ~= 0 then
        SetVehicleBrakeLights(pVeh, true)
    else
        SetVehicleBrakeLights(pVeh, false)
    end
end)

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			local inPoliceVehicle = IsPedInAnyPoliceVehicle(GetPlayerPed(-1))
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
			local driver = GetPedInVehicleSeat(-1)
			local engineOn = IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true))
			local engineOff = IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true))
			if ( driver and inPoliceVehicle and engineOn and IsControlJustPressed(1, 23) then
				
					TaskLeaveVehicle(driver, vehicle, 256)
					SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true)
			
			elseif ( drive and inPoliceVehicle and engineOff ) then
				TaskLeaveVehicle(driver, vehicle, 256)
			end
	end
end)
--]]