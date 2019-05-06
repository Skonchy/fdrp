--[[function GetVehHealthPercent()
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsUsing(ped)
	local vehiclehealth = GetEntityHealth(vehicle) - 100
	local maxhealth = GetEntityMaxHealth(vehicle) - 100
	local procentage = (vehiclehealth / maxhealth) * 100
	return procentage
end




function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsUsing(ped)
		local damage = GetVehHealthPercent(vehicle)
		if IsPedInAnyVehicle(ped, false) then
			SetPlayerVehicleDamageModifier(PlayerId(), 100) -- Seems to not work at the moment --
			if damage < 87			then
				SetVehicleUndriveable(vehicle, true)
				ShowNotification("~g~Vehicle is too damaged.")
			end
		end
	end
end)--]]
local levelOfDamageToKillThisBitch = 750.0 

function IsValidVehicle( veh )
    local model = GetEntityModel( veh )

    if ( IsThisModelACar( model ) or IsThisModelABike( model ) or IsThisModelAQuadbike( model ) ) then  
        return true 
    else 
        return false 
    end 
end 

function ManageVehicleDamage()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                local damage = GetVehicleEngineHealth( vehicle )

                if ( damage < levelOfDamageToKillThisBitch and IsValidVehicle( vehicle ) ) then 
                    SetVehicleEngineHealth( vehicle, 299 )
                    SetVehicleUndriveable(vehicle, true)
                end 
            end  
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
        ManageVehicleDamage()

        Citizen.Wait( 0 )
    end 
end )

