Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if GetLastInputMethod(2) then 
			if IsControlJustPressed(1, 137) then
				TriggerEvent('glg:setCruiseSpeed')
			end
		end
    end
end)
 
local cruise = 0
 
AddEventHandler('glg:setCruiseSpeed', function()
    if cruise == 0 and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        if GetEntitySpeedVector(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)['y'] > 0 then
            cruise = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            local cruiseMph = math.floor(cruise * 2.23694 + 0.5)
           
            NotificationMessage("CruiseControl: ~g~ ON~w~ - ~b~ " .. cruiseMph .." mph")
           
            Citizen.CreateThread(function()
                while cruise > 0 and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) do
                    local cruiseVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    if IsVehicleOnAllWheels(cruiseVeh) and GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) > (cruise - 2.0) then
                        SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), cruise)
                    else
                        cruise = 0
                        NotificationMessage("CruiseControl: ~r~ OFF")
                        break
                    end
                    if IsControlPressed(1, 8) then
                        cruise = 0
                        NotificationMessage("CruiseControl: ~r~ OFF")
                    end
                     if IsControlPressed(1, 22) then
                        cruise = 0
                        NotificationMessage("CruiseControl: ~r~ OFF")
                    end
                    if IsControlPressed(1, 32) then
                        cruise = 0
                        TriggerEvent('glg:setNewSpeed')
                    end
                    Wait(300)
                end
                cruise = 0
            end)
        else
            cruise = 0
            NotificationMessage("CruiseControl: ~r~OFF")
        end
    else
        if cruise > 0 then
            NotificationMessage("CruiseControl: ~r~OFF")
        end
        cruise = 0
    end
end)
 
AddEventHandler('glg:setNewSpeed', function()
    Citizen.CreateThread(function()
		if GetLastInputMethod(2) then 
			while IsControlPressed(1, 32) do
				Wait(100)
			end
			TriggerEvent('glg:setCruiseSpeed')
		end
    end)
end)
 
function NotificationMessage(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local inVehicle = IsPedInAnyVehicle(ped, false)
      local ped = GetPlayerPed(-1)
      local veh = GetVehiclePedIsIn(ped, false )
      local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
      local slow = speed < 20

      if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            if ( IsPedSittingInAnyVehicle( ped ) ) then 
                local vehicle = GetVehiclePedIsIn( ped, false )
                if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 

    		    if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) and slow and IsControlPressed(1, 21) then
     		    setVehicleEnginePowerMultiplier(veh, 1000.0)
     			elseif ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) and slow and not IsControlPressed(1, 21) then
     			SetVehicleEnginePowerMultiplier(veh, -20.25)
     		end
     	  end
     	end
      end
    end
end)