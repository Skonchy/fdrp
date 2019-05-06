ESX               = nil
local playerCars = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- 
function OpenCloseVehicle()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local locked = GetVehicleDoorLockStatus(vehicle)
			if locked == 1 then -- if unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				ESX.ShowNotification("Vehicle ~r~locked.")
			elseif locked == 2 then -- if locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				ESX.ShowNotification("Vehicle ~g~unlocked.")
			end
		else
			ESX.ShowNotification("~r~You do not have the keys for this vehicle.")
		end
	end, GetVehicleNumberPlateText(vehicle))
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if GetLastInputMethod(2) then 
			if IsControlJustReleased(0, 40) then
			--	OpenCloseVehicle()
			car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        
				if car ~= 0 then
				lastCar = car
				end
		
				lockStatus = GetVehicleDoorLockStatus(lastCar)
				if lastCar ~= nil then
					if lockStatus == 0 or lockStatus == 1 then
						SetVehicleDoorsLocked(lastCar, 2)
						SetVehicleDoorsLockedForPlayer(lastCar, PlayerId(), false)
						TriggerEvent("chatMessage", "Info", {255, 255, 0}, "Door is now ^1locked^0.")
					elseif lockStatus == 2 then
						SetVehicleDoorsLocked(lastCar, 1)
						SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					TriggerEvent("chatMessage", "Info", {255, 255, 0}, "Door is now ^2unlocked^0.")
					end
				else
					TriggerEvent("chatMessage", "Info", {255, 255, 0}, "You don't have a car.")
				end
			end
		end
	end
end)
Citizen.CreateThread(function()
    while true do
		Wait(0)

			local player = GetPlayerPed(-1)

	        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(player))) then

	            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(player))
	            local lock = GetVehicleDoorLockStatus(veh)

	            if lock == 7 then
	                SetVehicleDoorsLocked(veh, 2)
	            end

	            local pedd = GetPedInVehicleSeat(veh, -1)

	            if pedd then
	                SetPedCanBeDraggedOut(pedd, false)
	            end
	        end
	end
end)