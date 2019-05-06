ESX                           = {}
ESX.Game                      = {}

--[[
RegisterNetEvent("Cop")
AddEventHandler("Cop", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			if checkskinmale() then
			
				loadAnimDict("amb@world_human_cop_idles@male@idle_a")
				loadAnimDict("amb@world_human_cop_idles@male@idle_enter")
				loadAnimDict("amb@world_human_cop_idles@male@idle_b")
				while not HasAnimDictLoaded("amb@world_human_cop_idles@male@idle_a") do
					Citizen.Wait(100)
				end
			
				if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 3) then
					ClearPedSecondaryTask(lPed)
				
				else
					TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
					Wait (8300)
					if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 3) then
						TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_b", 8.0, -1, -1, 2, -1, 0, 0, 0)
						Wait (12000)
						if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_b", 3) then
							TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_c", 8.0, -1, -1, 2, -1, 0, 0, 0)
							Wait (8500)
							if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_c", 3) then
								TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_d", 8.0, -1, -1, 2, -1, 0, 0, 0)
								Wait (8500)
								if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_d", 3) then
									TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, -1, -1, 2, -1, 0, 0, 0)
									Wait (8500)
									if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_e", 3) then
										TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
									end
								end
							end
						end
					end
				end		
			else

				RequestAnimDict("amb@world_human_cop_idles@female@base")
				RequestAnimDict("amb@world_human_cop_idles@female@idle_a")
				RequestAnimDict("amb@world_human_cop_idles@female@idle_b")
				while not HasAnimDictLoaded("amb@world_human_cop_idles@female@idle_a") do
					Citizen.Wait(100)
				end
					TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 8.0, -1, -1, 2, -1, 0, 0, 0)
					Wait (6000)
					if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 3) then
						TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_b", 8.0, -1, -1, 2, -1, 0, 0, 0)
						Wait (15200)
						if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_b", 3) then
							TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_c", 8.0, -1, -1, 2, -1, 0, 0, 0)
							Wait (8500)
							if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_c", 3) then
								TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 8.0, -1, -1, 2, -1, 0, 0, 0)
								Wait (10000)
								if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 3) then
									TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_e", 8.0, -1, -1, 1, -1, 0, 0, 0)
									Wait (10000)
									if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_e", 3) then
										TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
										Wait(6000)
										if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 3) then
											TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_b", 8.0, -1, -1, 2, -1, 0, 0, 0)
											Wait (15200)
											if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_b", 3) then
												TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_c", 8.0, -1, -1, 2, -1, 0, 0, 0)
												Wait (8500)
												if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_c", 3) then
													TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 8.0, -1, -1, 2, -1, 0, 0, 0)
													Wait (8500)
													if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 3) then
														TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_e", 8.0, -1, -1, 1, -1, 0, 0, 0)
														Wait (10000)
														if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_e", 3) then
															TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
					
			end
		end)
	end
end)
--]]
--[[
RegisterNetEvent("Cop2")
AddEventHandler("Cop2", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			if checkskinfemale() then
			
				loadAnimDict("amb@world_human_cop_idles@male@idle_a")
				loadAnimDict("amb@world_human_cop_idles@male@idle_enter")
				loadAnimDict("amb@world_human_cop_idles@male@idle_b")
				while not HasAnimDictLoaded("amb@world_human_cop_idles@male@idle_a") do
					Citizen.Wait(100)
				end
			
				if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 3) then
					ClearPedSecondaryTask(lPed)
				
				else
					TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
					Wait (8300)
					if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 3) then
						TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_b", 8.0, -1, -1, 2, -1, 0, 0, 0)
						Wait (12000)
						if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_b", 3) then
							TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_c", 8.0, -1, -1, 2, -1, 0, 0, 0)
							Wait (8500)
							if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_c", 3) then
								TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_d", 8.0, -1, -1, 2, -1, 0, 0, 0)
								Wait (8500)
								if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_d", 3) then
									TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, -1, -1, 2, -1, 0, 0, 0)
									Wait (8500)
									if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@male@idle_b", "idle_e", 3) then
										TaskPlayAnim(lPed, "amb@world_human_cop_idles@male@idle_a", "idle_a", 8.0, -1, -1, 1, -1, 0, 0, 0)
									end
								end
							end
						end
					end
				end		

		    end)
	end
end)
--]]

------============================ TACKLE WIP ============================------

--[[Citizen.CreateThread(function()
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		if DoesEntityExist(lPed) then
			SetPedRagdollOnCollision(lPed, true)
		end
	end
end)--]]

------============================ Delete Key ============================------

--[[Citizen.CreateThread(function()
	while true do
		Wait(0)
		loadAnimDict("mini@tennis")
		local lPed = GetPlayerPed(-1)
		if IsControlJustPressed(1, 178) and DoesEntityExist(lPed) then 
			TriggerServerEvent('InteractSound_SV:PlayOnAll', 'handcuff', 0.5)
			CancelEvent()
		end
	end
end)--]]

------============================ NOTEPAD ============================------

RegisterNetEvent("notepad")
AddEventHandler("notepad", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("smoke")
AddEventHandler("smoke", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_SMOKING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("cop")
AddEventHandler("cop", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_COP_IDLES", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("shock")
AddEventHandler("shock", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("binos")
AddEventHandler("binos", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_BINOCULARS", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("lean")
AddEventHandler("lean", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_LEANING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("sit")
AddEventHandler("sit", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_PICNIC", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("investigate")
AddEventHandler("investigate", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "CODE_HUMAN_POLICE_INVESTIGATE", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("crowd")
AddEventHandler("crowd", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "CODE_HUMAN_POLICE_CROWD_CONTROL", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("smoke2")
AddEventHandler("smoke2", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_AA_SMOKE", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("smokepot")
AddEventHandler("smokepot", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("map")
AddEventHandler("map", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_TOURIST_MAP", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("drink")
AddEventHandler("drink", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_DRINKING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("cheer")
AddEventHandler("cheer", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_CHEERING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("deal")
AddEventHandler("deal", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_DRUG_DEALER", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("dealhard")
AddEventHandler("dealhard", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_DRUG_DEALER_HARD", 0, true)
			Wait(30000)
		end)
	end
end)


RegisterNetEvent("drill")
AddEventHandler("drill", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_CONST_DRILL", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("stupor")
AddEventHandler("stupor", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STUPOR", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("impatient")
AddEventHandler("impatient", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("standfire")
AddEventHandler("standfire", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STAND_FIRE", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("camera")
AddEventHandler("camera", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_PAPARAZZI", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("walleat")
AddEventHandler("walleat", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_SEAT_WALL_EATING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("walltablet")
AddEventHandler("walltablet", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_SEAT_WALL_TABLET", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("windowshop")
AddEventHandler("windowshop", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("cower")
AddEventHandler("cower", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "CODE_HUMAN_STAND_COWER", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("chair")
AddEventHandler("chair", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_SEAT_CHAIR", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("bench")
AddEventHandler("bench", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_SEAT_BENCH", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("bbq")
AddEventHandler("bbq", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_BBQ", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("wash")
AddEventHandler("wash", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_BUM_WASH", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("stripwatch")
AddEventHandler("stripwatch", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STRIP_WATCH_STAND", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("super")
AddEventHandler("super", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_JOG_STANDING", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("traffic")
AddEventHandler("traffic", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("medic")
AddEventHandler("medic", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("flashlight")
AddEventHandler("flashlight", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_SECURITY_SHINE_TORCH", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("phone")
AddEventHandler("phone", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("bark")
AddEventHandler("bark", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_DOG_BARKING_RETRIEVER", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("dogsit")
AddEventHandler("dogsit", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_DOG_SITTING_RETRIEVER", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("atm")
AddEventHandler("atm", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_ATM", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("golf")
AddEventHandler("golf", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_GOLF_PLAYER", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("guard")
AddEventHandler("guard", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_GUARD_STAND", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("sleep")
AddEventHandler("sleep", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_BUM_SLUMPED", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("bin")
AddEventHandler("bin", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_BUM_SHOPPING_CART", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("impatient")
AddEventHandler("impatient", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "PROP_HUMAN_STAND_IMPATIENT", 0, true)
			Wait(30000)
		end)
	end
end)

RegisterNetEvent("bunnyeat")
AddEventHandler("bunnyeat", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(lPed, "WORLD_RABBIT_EATING", 0, true)
			Wait(30000)
		end)
	end
end)


------=========================== CLEAR AREA ==========================------


RegisterNetEvent("cleararea")
AddEventHandler("cleararea", function()
	local lPed = GetPlayerPed(-1)
	local x, y, z = GetEntityCoords(lPed, true)
		if DoesEntityExist(lPed) then
			Citizen.CreateThread(function()
				ClearAreaOfEverything( x, y, z, 30, false, false, false, false )
			end)
		end
end)


------============================ RAGDOLL ============================------

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		local inVeh = IsPedInAnyVehicle(lPed, true)
		if GetLastInputMethod(2) and IsControlPressed(1, 178) and not inVeh then
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		end
		
 	end
 end)

------============================ Clear Area ============================------ 
 

 
------============================ FEMALE COP ============================------
 
RegisterNetEvent("Copf")
AddEventHandler("Copf", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("amb@world_human_cop_idles@female@idle_a")
			while not HasAnimDictLoaded("amb@world_human_cop_idles@female@idle_a") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_a", 3) then
				ClearPedSecondaryTask(lPed)
				
			else
				TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_a", "idle_c", 8.0, -1, -1, 1, -1, 0, 0, 0)
				
			end		
		end)
	end
end)

------============================  Wheelsnap  ============================------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            veh = GetVehiclePedIsUsing(PlayerPedId())
            angle = GetVehicleSteeringAngle(veh)
            veh2 = GetPlayersLastVehicle()
            speed = GetEntitySpeed(veh)
            Citizen.Wait(20)
            if speed < 10 then
                SetVehicleSteeringAngle(veh2, angle)
            end
        end
    end
end)

------============================ HAND ON GUN ============================------

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		local inVeh = IsPedInAnyVehicle(lPed, true)
		local copCheck = GetPedType(lPed)
		if IsControlJustPressed(1, 47) and ( DoesEntityExist( lPed ) and checkskin2() and not IsEntityDead( lPed )) and not inVeh then 
			RequestAnimDict("move_m@intimidation@cop@unarmed")
			while not HasAnimDictLoaded("move_m@intimidation@cop@unarmed") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "move_m@intimidation@cop@unarmed", "idle", 3) then
				ClearPedSecondaryTask(lPed)
				
			else
				TaskPlayAnim(lPed, "move_m@intimidation@cop@unarmed", "idle", 5.0, -1, -1, 50, 0, false, false, false)
			end
			
		end
	end
end)

skins = {
    GetHashKey("s_cop10"),
	GetHashKey("s_m_y_cop_01"),
    GetHashKey("s_cop11"),
    GetHashKey("s_sheriff1"),
    GetHashKey("s_sheriff3"),
    GetHashKey("s_sheriff6"),
    GetHashKey("s_sheriff7"),
    GetHashKey("s_state1"),
    GetHashKey("s_state6"),
    GetHashKey("s_state7"),
}
skins2 = {
    GetHashKey("s_cop1"),
    GetHashKey("s_cop2"),
    GetHashKey("s_cop4"),
    GetHashKey("s_cop5"),
    GetHashKey("s_cop6"),
    GetHashKey("s_sheriff1"),
    GetHashKey("s_sheriff3"),
    GetHashKey("s_sheriff5"),
    GetHashKey("s_sheriff6"),
    GetHashKey("s_sheriff7"),
    GetHashKey("s_sheriff8"),
    GetHashKey("s_state1"),
    GetHashKey("s_state5"),
    GetHashKey("s_state8"),
    GetHashKey("s_state1"),
    GetHashKey("s_state6"),
    GetHashKey("s_state7"),
	GetHashKey("s_cop10"),
	GetHashKey("s_cop11"),
}

skinsmale = {
    GetHashKey("s_cop1"),
    GetHashKey("s_cop4"),
    GetHashKey("s_cop5"),
    GetHashKey("s_cop6"),
	GetHashKey("s_cop10"),
	GetHashKey("s_cop11"),
    GetHashKey("s_sheriff1"),
    GetHashKey("s_sheriff3"),
    GetHashKey("s_sheriff5"),
    GetHashKey("s_sheriff8"),
    GetHashKey("s_state1"),
    GetHashKey("s_state5"),
    GetHashKey("s_state1"),
    GetHashKey("s_state6"),
}

skinsfemale = {
    GetHashKey("s_cop2"),
    GetHashKey("s_sheriff6"),
    GetHashKey("s_sheriff7"),
    GetHashKey("s_state7"),
	GetHashKey("s_state8"),
}

function checkskin()
    for i = 1, #skins do
        if skins[i] == GetEntityModel(PlayerPedId()) then
            return true
        end
    end
    return false
end

function checkskin2()
    for i = 1, #skins2 do
        if skins2[i] == GetEntityModel(PlayerPedId()) then
            return true
        end
    end
    return false
end

function checkskinmale()
    for i = 1, #skinsmale do
        if skinsmale[i] == GetEntityModel(PlayerPedId()) then
            return true
        end
    end
    return false
end

function checkskinfemale()
    for i = 1, #skinsfemale do
        if skinsfemale[i] == GetEntityModel(PlayerPedId()) then
            return true
        end
    end
    return false
end

------============================ SURRENDER KNEES ============================------

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'KneelHU' )
AddEventHandler( 'KneelHU', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
			DisableControlAction(1, 21, true)
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
			DisableControlAction(1, 21, false)
        end     
    end
end )

		
------============================ EngineON ============================------
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
------============================ RADIO ============================------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		if IsControlJustPressed(1, 244) and ( DoesEntityExist( lPed ) and checkskin() and not IsEntityDead ( lPed )) then
			RequestAnimDict( "random@arrests" )
			while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
				Citizen.Wait( 100 )
			end
			if IsEntityPlayingAnim(lPed, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(lPed)
				SetCurrentPedWeapon(lPed, GetHashKey("GENERIC_RADIO_CHATTER"), true)
			else
				TaskPlayAnim(lPed, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 50, 0, 0, 0, 0 )
				SetCurrentPedWeapon(lPed, GetHashKey("GENERIC_RADIO_CHATTER"), true)
			end 
		end        
    end 
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		if IsControlJustReleased(1, 244) and ( DoesEntityExist( lPed ) and checkskin() and not IsEntityDead ( lPed )) then
			RequestAnimDict( "random@arrests" )
			while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
				Citizen.Wait( 100 )
			end
			if IsEntityPlayingAnim(lPed, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(lPed)
				SetCurrentPedWeapon(lPed, GetHashKey("GENERIC_RADIO_CHATTER"), true)
			end 
		end        
    end 
end)

------============================ HANDCUFF BREAKS ============================------			
		
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(-1), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 21, true)
			DisableControlAction(1, 7, true)
		end
	end
end)
--]]
------============================ VEHICLE EJECTION WIP ============================------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetPedConfigFlag(lPed, 32, true)
				end
			end
		end
	end
end)


--[[RegisterNetEvent('glg:seatbelt')
AddEventHandler('glg:seatbelt'), function()
	local lPed = GetPlayerPed(-1)
	local seatBeltOff = SetPedConfigFlag(lPed, 32, true)
	local seatBeltOn = SetPedConfigFlag(lPed, 32, false)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local veh = GetVehiclePedIsIn(ped, false)
			if seatBeltOn then
				seatBeltOff
				TriggerClientEvent('chatMessage', source, '', {255, 0, 0}, "You've unbuckled your seatbelt.")
			else
				seatBeltOn
				TriggerClientEvent('chatMessage', source, '', {255, 0, 0}, "You've buckled your seatbelt.")
			end
		end
	end)
end)
		
		--]]	
		
------============================ HOLSTERED WEAPON ============================------
		
RegisterNetEvent('playerConnected')
AddEventHandler('playerConnected', function()
    local ped = GetPlayerPed(-1)
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if checkCopModel(ped) then
                if checkCopWeapon(ped) then
                    SetPedComponentVariation(ped, 9, 0, 0, 0)
                    -- print('pistol out')
                else
                    SetPedComponentVariation(ped, 9, 1, 0, 0)
                    -- print('pistol in holster')
                end
            end
        end
    end)
end)

-- Checks if the player is holding a cop/LEO weapon...
function checkCopWeapon(ped)
    if GetCurrentPedWeapon(ped, 453432689, 1)-- Pistol
        or GetCurrentPedWeapon(ped, -771403250, 1)-- HeavyPistol
        or GetCurrentPedWeapon(ped, 1593441988, 1)-- CombatPistol
        or GetCurrentPedWeapon(ped, -1716589765, 1)-- Pistol50
        or GetCurrentPedWeapon(ped, -1076751822, 1) then -- SNSPistol
        return true
    else
        return false
    end
end

-- Checks if the player is in a cop model...
function checkCopModel(ped)
    if (GetEntityModel(ped) == 368603149)--Cop01SFY
        or (GetEntityModel(ped) == 1581098148)-- Cop01SMY
        or (GetEntityModel(ped) == -1699520669)-- CopCutscene/MaleSheriff
        or (GetEntityModel(ped) == 1939545845)-- HWayCop01SMY
        or (GetEntityModel(ped) == 451459928)-- SnowCop01SMM
        or (GetEntityModel(ped) == -1275859404)-- BlackOps01SMY
        or (GetEntityModel(ped) == 2047212121)-- BlackOps02SMY
        or (GetEntityModel(ped) == 1349953339) then -- BlackOps03SMY
        return true
    else
        return false
    end
end


------============================ PLATE READING ============================------

-- you can touch this tho
ScanningDistance = 30.0 -- how far the Plate Reader should look



-- you shouldn't touch anything under this if you don't understand it


function GetVehicleInfrontOfEntity(entity)
	local coords = GetOffsetFromEntityInWorldCoords(entity,0.0,1.0,0.3)
	local coords2 = GetOffsetFromEntityInWorldCoords(entity, 0.0, ScanningDistance,0.0)
	local rayhandle = CastRayPointToPoint(coords, coords2, 10, entity, 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end

function RenderVehicleInfo(vehicle)
	local model = GetEntityModel(vehicle)
	local licenseplate = GetVehicleNumberPlateText(vehicle)
	local passNum = GetVehicleNumberOfPassengers(vehicle)
	if not IsVehicleSeatFree() then
		passNum = passNum + 1
	end
	
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.7)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(licenseplate)
	DrawText(0.22, 0.9)
end

function RotAnglesToVec(rot) -- input vector3
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num, math.cos(z)*num, math.sin(x))
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local vehicle_detected = GetVehicleInfrontOfEntity(GetVehiclePedIsIn(GetPlayerPed(-1)))
		if DoesEntityExist(GetVehiclePedIsIn(GetPlayerPed(-1))) and checkskin2() and DoesEntityExist(vehicle_detected) then
			
			RenderVehicleInfo(vehicle_detected)
				
			
		end
	end
end)

------============================ NO SPAWNY ============================------

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		if ( DoesEntityExist( lPed ) and not IsEntityDead( lPed ) ) then
			SetVehicleModelIsSuppressed(GetHashKey("police"), true)
			SetVehicleModelIsSuppressed(GetHashKey("police2"), true)
			SetVehicleModelIsSuppressed(GetHashKey("sheriff"), true)
			SetVehicleModelIsSuppressed(GetHashKey("sheriff2"), true)
			SetVehicleModelIsSuppressed(GetHashKey("rhino"), true)
			SetVehicleModelIsSuppressed(GetHashKey("police3"), true)
			SetVehicleModelIsSuppressed(GetHashKey("cargobob"), true)
			SetVehicleModelIsSuppressed(GetHashKey("polmav"), true)
			SetVehicleModelIsSuppressed(GetHashKey("buzzard2"), true)
			SetVehicleModelIsSuppressed(GetHashKey("firetruk"), true)
			SetVehicleModelIsSuppressed(GetHashKey("ambulance"), true)
		end
	end
end)

------============================ Gang hassling ============================------

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		if ( DoesEntityExist( lPed ) and not IsEntityDead( lPed ) ) then
			SetPlayerCanBeHassledByGangs(lPed, false)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            SetPedDensityMultiplierThisFrame(0.80)
            ----------
            SetVehicleDensityMultiplierThisFrame(0.55)
            SetRandomVehicleDensityMultiplierThisFrame(0.30)
            SetParkedVehicleDensityMultiplierThisFrame(0.90)
        
    end
end)


------============================ Clipset ============================------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function startAttitude(lib, anim)
 	Citizen.CreateThread(function()
	
	    local playerPed = GetPlayerPed(-1)
	
	    RequestAnimSet(anim)
	      
	    while not HasAnimSetLoaded(anim) do
	        Citizen.Wait(0)
	    end
	    SetPedMovementClipset(playerPed, anim, true)
	end)

end

function OpenAnimationsMenu()

	local elements = {}

	for i=1, #Config.Animations, 1 do
		table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
	end


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'animations',
		{
			title    = 'Animations',
			elements = elements
		},
		function(data, menu)
			OpenAnimationsSubMenu(data.current.value)
		end,
		function(data, menu)
			menu.close()
		end
	)

end
function OpenAnimationsSubMenu(menu)

	local title    = nil
	local elements = {}

	for i=1, #Config.Animations, 1 do
		
		if Config.Animations[i].name == menu then

			title = Config.Animations[i].label

			for j=1, # Config.Animations[i].items, 1 do
				table.insert(elements, {label = Config.Animations[i].items[j].label, type = Config.Animations[i].items[j].type, value = Config.Animations[i].items[j].data})
			end

			break

		end

	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'animations_sub',
		{
			title    = title,
			elements = elements
		},
		function(data, menu)

			local type = data.current.type
			local lib  = data.current.value.lib
			local anim = data.current.value.anim

			if type == 'scenario' then
				startScenario(anim)
			else
				if type == 'attitude' then
					startAttitude(lib, anim)
				else
					startAnim(lib, anim)
				end
			end

		end,
		function(data, menu)
			menu.close()
		end
	)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetLastInputMethod(2) then 
			if IsControlJustReleased(0, 170) then
				OpenAnimationsMenu()
			end
		end
	end
end)

Citizen.CreateThread(function()
  while true do
  Citizen.Wait(0)
	local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)

	  if IsControlJustReleased(0, 68) and not inVeh then
	  	ClearPedTasks(GetPlayerPed(-1))
		ClearPedSecondaryTask(GetPlayerPed(-1))
	  end
  end
end)
