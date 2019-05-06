ESX = nil
local vehPrice = nil
local modPrice = vehPrice

Citizen.CreateThread(function()
	local blipX = 2056.122
	local blipY = 3179.671
	local blipZ = 43.678
	local loadedBlip = false

	while true do
		Citizen.Wait(0)
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		local distance = GetDistanceBetweenCoords(2056.122, 3179.671, 43.678, x, y, z, true)
	
		--load blip
		--if not loadedBlip then 
			--local blipSellCar = AddBlipForCoord(blipX, blipY, blipZ)
			--SetBlipSprite(blipSellCar, 227)
			--SetBlipDisplay(blipSellCar, 2)
			--SetBlipScale(blipSellCar, 1.0)
			--SetBlipColour(blipSellCar, 1)
			--SetBlipAlpha(blipSellCar, 255)
			--SetBlipAsShortRange(blipSellCar, true)
			--BeginTextCommandSetBlipName("String")
			--AddTextComponentString("Chop Shop")
			--EndTextCommandSetBlipName(blipSellCar)
			--loadedBlip = true
		--end
		
		--load marker if player is in vehicle
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then		
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local class = GetVehicleClass(vehicle)
			TriggerServerEvent("getVehPrice", class)
			DrawMarker(1, 2056.122, 3179.671, 43.678, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 0, 0, 50, false, true, 1, false, false, false, false)
		end
		
		--vehicle health modifier
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and vehPrice ~= nil then
			local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
			local modifier = health/1000
			modPrice = round((modifier * vehPrice), 0)
		end
		
		--ability to sell car if in range of chop shop
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and distance <= 4.0 then
			ShowHelp()
			if IsControlPressed(1, 38) then
				local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
				drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Vehicle is being chopped, Please wait!", 255, 255, 255, 255)
				TriggerEvent('chopshop:freezePlayer', true)
				--SetVehicleHalt(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 1.0, 1)
				SetVehicleEngineOn(GetVehiclePedIsIn( GetPlayerPed(-1), false ), false, true, true)
				SetVehicleUndriveable(GetVehiclePedIsIn( GetPlayerPed(-1), false ), false)
				Wait(10000)
				TriggerEvent('chopshop:freezePlayer', false)
				--[[
				if distance > 2.0 then
					drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Chop Failed!", 255, 255, 255, 255)
					break
				else
					]]
					drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Vehicle chopped!", 255, 255, 255, 255)
					sellVehicle()
					Wait(900000)
				--end
			end
		end
	end
end)

RegisterNetEvent("setVehPrice")
AddEventHandler("setVehPrice", function(price)
	vehPrice = price
end)

function ShowHelp()
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName("Press ~INPUT_PICKUP~ to sell your vehicle for ~b~$" .. modPrice .. "~s~!")
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function sellVehicle()
	if vehPrice == nil then
		TriggerEvent("chatMessage", "^2You cannot sell this car!")
	else
		TriggerServerEvent("sellVehicle", modPrice)
		local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
		DeleteVehicle(vehicle)
		vehPrice = nil
	end
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
    end
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('chopshop:freezePlayer')
AddEventHandler('chopshop:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)
