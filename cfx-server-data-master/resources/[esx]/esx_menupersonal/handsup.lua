local canHandsUp = true
local GUI							= {}
GUI.Time							= 0

AddEventHandler("handsup:toggle", function(param)
	canHandsUp = param
end)
RegisterNetEvent("dropweapon")
AddEventHandler('dropweapon', function()
	local ped = GetPlayerPed(-1)
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		if (IsControlPressed(1, Config.handsUP.keyboard) and (GetGameTimer() - GUI.Time) > 150) or ((IsControlPressed(2, Config.handsUP.controller1) and IsControlPressed(2, Config.handsUP.controller2)) and (GetGameTimer() - GUI.Time) > 150) then
			SetPedDropsWeapon(ped)
			ShowNotification("~r~You have dropped your weapon.")
		end
	end
end)


function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end


Citizen.CreateThread(function()
	local handsup = false
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("random@mugging3")
		if canHandsUp then
			if (IsControlPressed(1, Config.handsUP.keyboard) and (GetGameTimer() - GUI.Time) > 150) or ((IsControlPressed(2, Config.handsUP.controller1) and IsControlPressed(2, Config.handsUP.controller2)) and (GetGameTimer() - GUI.Time) > 150) then
				if handsup then
					if DoesEntityExist(lPed) then
						Citizen.CreateThread(function()
							RequestAnimDict("random@mugging3")
							SetPedDropsWeapon(lped)
							SetPedDropsInventoryWeapon(Ped, Gun, 0, -2.5, 1, 0)
							GiveWeaponToPed(Ped, fists, 0, 0, 1) -- Disarm Ped
            
							while not HasAnimDictLoaded("random@mugging3") do
								Citizen.Wait(100)
							end

							if handsup then
								handsup = false
								ClearPedSecondaryTask(lPed)
							end
						end)
					end
				else
					if DoesEntityExist(lPed) then
						Citizen.CreateThread(function()
							RequestAnimDict("random@mugging3")
							SetPedDropsWeapon(ped)
							while not HasAnimDictLoaded("random@mugging3") do
								Citizen.Wait(100)
							end

							if not handsup then
								handsup = true
								SetPedDropsWeapon(lped)
								TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
							end
						end)
					end
				end
				
				GUI.Time  = GetGameTimer()
			end

		end
	end
end)

