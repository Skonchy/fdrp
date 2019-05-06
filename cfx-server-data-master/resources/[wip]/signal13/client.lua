local signal13 = false
secondsRemaining = 0
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
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
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('signal13:killblip')
AddEventHandler('signal13:killblip', function()
    RemoveBlip(blip13)
end)

RegisterNetEvent('signal13:setblip')
AddEventHandler('signal13:setblip', function(position)
    blip13 = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blip13 , 161)
    SetBlipScale(blip13 , 4.0)
    SetBlipColour(blip13, 3)
    PulseBlip(blip13)
end)

RegisterNetEvent('signal13:disable')
AddEventHandler('signal13:disable', function()
	ESX.ShowNotification('Signal 13 alert terminated.')
	signal13 = false
	secondsRemaining = 0
end)

RegisterNetEvent('signal13:location')
AddEventHandler('signal13:location', function(gx, gy, gz)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		if signal13 then
			local blip13 = AddBlipForCoord(gx, gy, gz)
			SetBlipSprite(blip13 , 161)
			SetBlipScale(blip13 , 4.0)
			SetBlipColour(blip13, 1)
			PulseBlip(blip13)
		end
	end
end)

RegisterNetEvent('signal13:getcoords')
AddEventHandler('signal13:getcoords', function()
	Citizen.CreateThread(function()
		Citizen.Wait(0)
			local ped = GetPlayerPed(-1)
			local x, y, z = GetEntityCoords(ped, true)
			TriggerServerEvent('signal13:activate', x, y, z)
		end
	end)
end)

RegisterNetEvent('signal13:active')
AddEventHandler('signal13:active', function(coords)
	signal13 = true
	secondsRemaining = 300
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if signal13 then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if signal13 then
		   drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('signal_13') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)			
		end
		Citizen.Wait(0)
	end
end)