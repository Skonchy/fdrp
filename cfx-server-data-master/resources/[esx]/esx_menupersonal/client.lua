local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local GUI                       = {}
GUI.Time                        = 0
local PlayerData              = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

--Notification joueur
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

--Message text joueur
function Text(text)
		SetTextColour(186, 186, 186, 255)
		SetTextFont(0)
		SetTextScale(0.378, 0.378)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(0.017, 0.977)
end

function OpenPersonnelMenu()
	
	ESX.UI.Menu.CloseAll()
	
	ESX.TriggerServerCallback('NB:getUsergroup', function(group)
		playergroup = group
		
		local elements = {}
		
		table.insert(elements, {label = 'About Me',		value = 'menuperso_moi'})
		table.insert(elements, {label = 'Actions',					value = 'menuperso_actions'})
		if (IsInVehicle()) then
			local vehicle = GetVehiclePedIsIn( GetPlayerPed(-1), false )
			if ( GetPedInVehicleSeat( vehicle, -1 ) == GetPlayerPed(-1) ) then
				table.insert(elements, {label = 'Vehicle',					value = 'menuperso_vehicule'})
			end
		end
		table.insert(elements, {label = 'GPS',			value = 'menuperso_gpsrapide'})
		if PlayerData.job.grade_name == 'boss' then
			table.insert(elements, {label = 'Business Management',			value = 'menuperso_grade'})
		end
				
		if playergroup == 'mod' or playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'owner' then
			table.insert(elements, {label = 'Admin',				value = 'menuperso_modo'})
		end
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'menu_perso',
			{
				title    = 'Personal Menu',
				align    = 'center',
				elements = elements
			},
			function(data, menu)
	
				local elements = {}
				
				if playergroup == 'mod' then
					table.insert(elements, {label = 'Teleport to Player',    							value = 'menuperso_modo_tp_toplayer'})
					table.insert(elements, {label = 'Teleport Player to me',             			value = 'menuperso_modo_tp_playertome'})
					--table.insert(elements, {label = 'Teleport to coordinates',						value = 'menuperso_modo_tp_pos'})
					--table.insert(elements, {label = 'NoClip',										value = 'menuperso_modo_no_clip'})
					--table.insert(elements, {label = 'Invincible',									value = 'menuperso_modo_godmode'})
					--table.insert(elements, {label = 'Ghost Mode',									value = 'menuperso_modo_mode_fantome'})
					--table.insert(elements, {label = 'Repair Vehicle',								value = 'menuperso_modo_vehicle_repair'})
					--table.insert(elements, {label = 'Spawn Vehicle',								value = 'menuperso_modo_vehicle_spawn'})
					--table.insert(elements, {label = 'Delete Vehicle',								value = 'menuperso_modo_vehicle_flip'})
					--table.insert(elements, {label = 'Give Money',									value = 'menuperso_modo_give_money'})
					--table.insert(elements, {label = 'Give Money to Bank',							value = 'menuperso_modo_give_moneybank'})
					--table.insert(elements, {label = 'Give Dirty Money',							value = 'menuperso_modo_give_moneydirty'})
					table.insert(elements, {label = 'Show / Hide Coordinates',		     		    value = 'menuperso_modo_showcoord'})
					table.insert(elements, {label = 'Show / Hide Player Names',      				value = 'menuperso_modo_showname'})
					--table.insert(elements, {label = 'Teleport to Marker',							value = 'menuperso_modo_tp_marcker'})
					--table.insert(elements, {label = 'Treat Player',								value = 'menuperso_modo_heal_player'})
					--table.insert(elements, {label = 'Spectator Mode',								value = 'menuperso_modo_spec_player'})
					--table.insert(elements, {label = 'Change Skin',								value = 'menuperso_modo_changer_skin'})
					--table.insert(elements, {label = 'Save Skin',									value = 'menuperso_modo_save_skin'})
				end
			
				if playergroup == 'admin' then
					table.insert(elements, {label = 'Teleport to Player',    							value = 'menuperso_modo_tp_toplayer'})
					table.insert(elements, {label = 'Teleport Player to me',             			value = 'menuperso_modo_tp_playertome'})
					table.insert(elements, {label = 'Teleport to coordinates',						value = 'menuperso_modo_tp_pos'})
					table.insert(elements, {label = 'NoClip',										value = 'menuperso_modo_no_clip'})
					table.insert(elements, {label = 'Invincible',									value = 'menuperso_modo_godmode'})
					table.insert(elements, {label = 'Ghost Mode',									value = 'menuperso_modo_mode_fantome'})
					table.insert(elements, {label = 'Repair Vehicle',								value = 'menuperso_modo_vehicle_repair'})
					table.insert(elements, {label = 'Spawn Vehicle',								value = 'menuperso_modo_vehicle_spawn'})
					table.insert(elements, {label = 'Delete Vehicle',								value = 'menuperso_modo_vehicle_flip'})
					table.insert(elements, {label = 'Give Money',									value = 'menuperso_modo_give_money'})
					table.insert(elements, {label = 'Give Money to Bank',							value = 'menuperso_modo_give_moneybank'})
					table.insert(elements, {label = 'Give Dirty Money',							value = 'menuperso_modo_give_moneydirty'})
					table.insert(elements, {label = 'Show / Hide Coordinates',		     		    value = 'menuperso_modo_showcoord'})
					table.insert(elements, {label = 'Show / Hide Player Names',      				value = 'menuperso_modo_showname'})
					table.insert(elements, {label = 'Teleport to Marker',							value = 'menuperso_modo_tp_marcker'})
					table.insert(elements, {label = 'Treat Player',								value = 'menuperso_modo_heal_player'})
					--table.insert(elements, {label = 'Spectator Mode',								value = 'menuperso_modo_spec_player'})
					table.insert(elements, {label = 'Change Skin',								value = 'menuperso_modo_changer_skin'})
					table.insert(elements, {label = 'Save Skin',									value = 'menuperso_modo_save_skin'})
				end
			
				if playergroup == 'superadmin' then
					table.insert(elements, {label = 'Teleport to Player',    							value = 'menuperso_modo_tp_toplayer'})
					table.insert(elements, {label = 'Teleport Player to me',             			value = 'menuperso_modo_tp_playertome'})
					table.insert(elements, {label = 'Teleport to coordinates',						value = 'menuperso_modo_tp_pos'})
					table.insert(elements, {label = 'NoClip',										value = 'menuperso_modo_no_clip'})
					table.insert(elements, {label = 'Invincible',									value = 'menuperso_modo_godmode'})
					table.insert(elements, {label = 'Ghost Mode',									value = 'menuperso_modo_mode_fantome'})
					table.insert(elements, {label = 'Repair Vehicle',								value = 'menuperso_modo_vehicle_repair'})
					table.insert(elements, {label = 'Spawn Vehicle',								value = 'menuperso_modo_vehicle_spawn'})
					table.insert(elements, {label = 'Delete Vehicle',								value = 'menuperso_modo_vehicle_flip'})
					table.insert(elements, {label = 'Give Money',									value = 'menuperso_modo_give_money'})
					table.insert(elements, {label = 'Give Money to Bank',							value = 'menuperso_modo_give_moneybank'})
					table.insert(elements, {label = 'Give Dirty Money',							value = 'menuperso_modo_give_moneydirty'})
					table.insert(elements, {label = 'Show / Hide Coordinates',		     		    value = 'menuperso_modo_showcoord'})
					table.insert(elements, {label = 'Show / Hide Player Names',      				value = 'menuperso_modo_showname'})
					table.insert(elements, {label = 'Teleport to Marker',							value = 'menuperso_modo_tp_marcker'})
					table.insert(elements, {label = 'Treat Player',								value = 'menuperso_modo_heal_player'})
					table.insert(elements, {label = 'Spectator Mode',								value = 'menuperso_modo_spec_player'})
					table.insert(elements, {label = 'Change Skin',								value = 'menuperso_modo_changer_skin'})
					table.insert(elements, {label = 'Save Skin',									value = 'menuperso_modo_save_skin'})
				end

				if data.current.value == 'menuperso_modo' then
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'menuperso_modo',
						{
							title    = 'Moderation',
							align    = 'top-left',
							elements = elements
						},
						function(data2, menu2)

							if data2.current.value == 'menuperso_modo_tp_toplayer' then
								admin_tp_toplayer()
							end

							if data2.current.value == 'menuperso_modo_tp_playertome' then
								admin_tp_playertome()
							end

							if data2.current.value == 'menuperso_modo_tp_pos' then
								admin_tp_pos()
							end

							if data2.current.value == 'menuperso_modo_no_clip' then
								admin_no_clip()
							end

							if data2.current.value == 'menuperso_modo_godmode' then
								admin_godmode()
							end

							if data2.current.value == 'menuperso_modo_mode_fantome' then
								admin_mode_fantome()
							end

							if data2.current.value == 'menuperso_modo_vehicle_repair' then
								admin_vehicle_repair()
							end

							if data2.current.value == 'menuperso_modo_vehicle_spawn' then
								admin_vehicle_spawn()
							end

							if data2.current.value == 'menuperso_modo_vehicle_flip' then
								admin_vehicle_flip()
							end

							if data2.current.value == 'menuperso_modo_give_money' then
								admin_give_money()
							end

							if data2.current.value == 'menuperso_modo_give_moneybank' then
								admin_give_bank()
							end

							if data2.current.value == 'menuperso_modo_give_moneydirty' then
								admin_give_dirty()
							end

							if data2.current.value == 'menuperso_modo_showcoord' then
								modo_showcoord()
							end

							if data2.current.value == 'menuperso_modo_showname' then
								modo_showname()
							end

							if data2.current.value == 'menuperso_modo_tp_marcker' then
								admin_tp_marcker()
							end

							if data2.current.value == 'menuperso_modo_heal_player' then
								admin_heal_player()
							end

							if data2.current.value == 'menuperso_modo_spec_player' then
								admin_spec_player()
							end

							if data2.current.value == 'menuperso_modo_changer_skin' then
								changer_skin()
							end
							
						end,
						function(data2, menu2)
							menu2.close()
						end
					)
				end
				
				if data.current.value == 'menuperso_vehicule' then
					OpenVehiculeMenu()
				end

				--if data.current.value == 'menuperso_moi' then
	
				--	local elements = {}
					
				--	table.insert(elements, {label = 'Telephone',    							value = 'menuperso_moi_telephone'})
				--	table.insert(elements, {label = 'Inventory',             					value = 'menuperso_moi_inventaire'})
				--	table.insert(elements, {label = 'My Bills',									value = 'menuperso_moi_factures'})
						
				--	ESX.UI.Menu.Open(
						
				--		'default', GetCurrentResourceName(), 'menuperso_moi',
				--		{
				--			title    = 'Personal Menu',
				--			align    = 'top-left',
				--			elements = elements
				--		},
						--function(data2, menu2)

						--	if data2.current.value == 'menuperso_moi_telephone' then
				--				openTelephone()
						--	end

						--	if data2.current.value == 'menuperso_moi_inventaire' then
				--				openInventaire()
						--	end

						--	if data2.current.value == 'menuperso_moi_factures' then
				--				openFacture()
						--	end

							
						--end,
				--		function(data2, menu2)
				--			menu2.close()
				--		end
				--	)
				--end

				if data.current.value == 'menuperso_actions' then

					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'menuperso_actions',
						{
							title    = 'Actions',
							align    = 'top-left',
							elements = {
								{label = 'Stop animation',  value = 'menuperso_actions__annuler'},
								{label = 'Greetings',  value = 'menuperso_actions_Salute'},
								{label = 'Humor',  value = 'menuperso_actions_Humor'},
								{label = 'Job related',  value = 'menuperso_actions_Travail'},
								{label = 'Festive',  value = 'menuperso_actions_Festives'},
								{label = 'Misc',  value = 'menuperso_actions_Others'},
							},
						},
						function(data2, menu2)

							if data2.current.value == 'menuperso_actions__annuler' then
								local ped = GetPlayerPed(-1);
								if ped then
									ClearPedTasks(ped);
								end
							end

							if data2.current.value == 'menuperso_actions_pipi' then
								ESX.UI.Menu.CloseAll()
							end

							if data2.current.value == 'menuperso_actions_Salute' then
								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'menuperso_actions_Salute',
									{
										title    = 'Greetings',
										align    = 'top-left',
										elements = {
											{label = 'Greet',  value = 'menuperso_actions_Salute_saluer'},
											{label = 'Shaking hands',     value = 'menuperso_actions_Salute_serrerlamain'},
											{label = 'Hi-Five',     value = 'menuperso_actions_Salute_tapeen5'},
											{label = 'Military salute',  value = 'menuperso_actions_Salute_salutmilitaire'},
										},
									},
									function(data3, menu3)

										if data3.current.value == 'menuperso_actions_Salute_saluer' then
											animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_hello" })
										end

										if data3.current.value == 'menuperso_actions_Salute_serrerlamain' then
											animsAction({ lib = "mp_common", anim = "givetake1_a" })
										end

										if data3.current.value == 'menuperso_actions_Salute_tapeen5' then
											animsAction({ lib = "mp_ped_interaction", anim = "highfive_guy_a" })
										end

										if data3.current.value == 'menuperso_actions_Salute_salutmilitaire' then
											animsAction({ lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute" })
										end

									end,
									function(data3, menu3)
										menu3.close()
									end
								)
							end

							if data2.current.value == 'menuperso_actions_Humor' then
								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'menuperso_actions_Humor',
									{
										title    = 'Humor',
										align    = 'top-left',
										elements = {
											{label = 'Congratulate',  value = 'menuperso_actions_Humor_feliciter'},
											{label = 'Super',     value = 'menuperso_actions_Humor_super'},
											{label = 'Calm down',     value = 'menuperso_actions_Humor_calmetoi'},
											{label = 'Show fear',  value = 'menuperso_actions_Humor_avoirpeur'},
											{label = 'Not possible!',  value = 'menuperso_actions_Humor_cestpaspossible'},
											{label = 'Embrace',  value = 'menuperso_actions_Humor_enlacer'},
											{label = 'F*** You!',  value = 'menuperso_actions_Humor_doightdhonneur'},
											{label = 'Wanker',  value = 'menuperso_actions_Humor_branleur'},
											{label = 'Suicide',  value = 'menuperso_actions_Humor_balledanslatete'},
										},
									},
									function(data3, menu3)

										if data3.current.value == 'menuperso_actions_Humor_feliciter' then
											animsActionScenario({anim = "WORLD_HUMAN_CHEERING" })
										end

										if data3.current.value == 'menuperso_actions_Humor_super' then
											animsAction({ lib = "anim@mp_player_intcelebrationmale@thumbs_up", anim = "thumbs_up" })
										end

										if data3.current.value == 'menuperso_actions_Humor_calmetoi' then
											animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_easy_now" })
										end

										if data3.current.value == 'menuperso_actions_Humor_avoirpeur' then
											animsAction({ lib = "amb@code_human_cower_stand@female@idle_a", anim = "idle_c" })
										end

										if data3.current.value == 'menuperso_actions_Humor_cestpaspossible' then
											animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_damn" })
										end

										if data3.current.value == 'menuperso_actions_Humor_enlacer' then
											animsAction({ lib = "mp_ped_interaction", anim = "kisses_guy_a" })
										end

										if data3.current.value == 'menuperso_actions_Humor_doightdhonneur' then
											animsAction({ lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" })
										end

										if data3.current.value == 'menuperso_actions_Humor_branleur' then
											animsAction({ lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01" })
										end

										if data3.current.value == 'menuperso_actions_Humor_balledanslatete' then
											animsAction({ lib = "mp_suicide", anim = "pistol" })
										end

									end,
									function(data3, menu3)
										menu3.close()
									end
								)
							end

							if data2.current.value == 'menuperso_actions_Travail' then
								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'menuperso_actions_Travail',
									{
										title    = 'Work related',
										align    = 'top-left',
										elements = {
											{label = 'Fishing',  value = 'menuperso_actions_Travail_pecheur'},
											{label = 'Gardener',     value = 'menuperso_actions_Travail_agriculteur'},
											{label = 'Mechanic',     value = 'menuperso_actions_Travail_depanneur'},
											{label = 'Clipboard',  value = 'menuperso_actions_Travail_prendredesnotes'},
											{label = 'Medic Kneel',  value = 'menuperso_actions_Travail_inspecter'},
										},
									},
									function(data3, menu3)

										if data3.current.value == 'menuperso_actions_Travail_pecheur' then
											animsActionScenario({anim = "world_human_stand_fishing" })
										end

										if data3.current.value == 'menuperso_actions_Travail_agriculteur' then
											animsActionScenario({anim = "world_human_gardener_plant" })
										end

										if data3.current.value == 'menuperso_actions_Travail_depanneur' then
											animsActionScenario({anim = "world_human_vehicle_mechanic" })
										end

										if data3.current.value == 'menuperso_actions_Travail_prendredesnotes' then
											animsActionScenario({anim = "WORLD_HUMAN_CLIPBOARD" })
										end

										if data3.current.value == 'menuperso_actions_Travail_inspecter' then
											animsActionScenario({anim = "CODE_HUMAN_MEDIC_KNEEL" })
										end

									end,
									function(data3, menu3)
										menu3.close()
									end
								)
							end

							if data2.current.value == 'menuperso_actions_Festives' then
								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'menuperso_actions_Festives',
									{
										title    = 'Festives',
										align    = 'top-left',
										elements = {
											{label = 'Party',  value = 'menuperso_actions_Festives_danser'},
											{label = 'Musical Instrument',     value = 'menuperso_actions_Festives_jouerdelamusique'},
											{label = 'Smoke Pot', value = 'menuperso_actions_pot'},
											{label = 'Drinking a 40oz',     value = 'menuperso_actions_Festives_boireunebiere'},
											{label = 'Air Guitar',  value = 'menuperso_actions_Festives_airguitar'},
										},
									},
									function(data3, menu3)

										if data3.current.value == 'menuperso_actions_Festives_danser' then
											animsAction({ lib = "amb@world_human_partying@female@partying_beer@base", anim = "base" })
										end

										if data3.current.value == 'menuperso_actions_Festives_jouerdelamusique' then
											animsActionScenario({anim = "WORLD_HUMAN_MUSICIAN" })
										end
										
										if data3.current.value == 'menuperso_actions_pot' then
											animsActionScenario({anim = "WORLD_HUMAN_SMOKING_POT" })
										end

										if data3.current.value == 'menuperso_actions_Festives_boireunebiere' then
											animsActionScenario({anim = "WORLD_HUMAN_DRINKING" })
										end

										if data3.current.value == 'menuperso_actions_Festives_airguitar' then
											animsAction({ lib = "anim@mp_player_intcelebrationfemale@air_guitar", anim = "air_guitar" })
										end

									end,
									function(data3, menu3)
										menu3.close()
									end
								)
							end

							if data2.current.value == 'menuperso_actions_Others' then
								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'menuperso_actions_Others',
									{
										title    = 'Misc',
										align    = 'top-left',
										elements = {
											{label = 'Smoking',     value = 'menuperso_actions_Others_fumeruneclope'},
											{label = 'Push-ups',     value = 'menuperso_actions_Others_fairedespompes'},
											{label = 'Binoculars',     value = 'menuperso_actions_Others_regarderauxjumelles'},
											{label = 'Yoga',     value = 'menuperso_actions_Others_faireduyoga'},
											{label = 'Statue',     value = 'menuperso_actions_Others_fairelastatut'},
											{label = 'Jogging',     value = 'menuperso_actions_Others_fairedujogging'},
											{label = 'Flexing Muscles',     value = 'menuperso_actions_Others_fairedesetirements'},
											{label = 'Prostitute 1',     value = 'menuperso_actions_Others_racoller'},
											{label = 'Prostitute 2',     value = 'menuperso_actions_Others_racoller2'},
											{label = 'Laying on back',     value = 'menuperso_actions_Others_sasseoir'},
											{label = 'Laying on stomach',     value = 'menuperso_actions_Others_sasseoir2'},
											{label = 'Sitting picnic',     value = 'menuperso_actions_Others_sasseoirparterre'},
											{label = 'Lean',     value = 'menuperso_actions_Others_attendre'},
											{label = 'Washing',     value = 'menuperso_actions_Others_nettoyerquelquechose'},
											{label = 'Grab crotch',     value = 'menuperso_actions_Others_segratterlesc'},
											{label = 'Selfie',     value = 'menuperso_actions_Others_prendreunselfie'},
											{label = 'Check map', value = 'menuperso_actions_Others_maps'},
											{label = 'Urinate', value = 'menuperso_actions_Others_urinate3'},
										},
									},
									function(data3, menu3)

										if data3.current.value == 'menuperso_actions_Others_fumeruneclope' then
											animsActionScenario({ anim = "WORLD_HUMAN_SMOKING" })
										end

										if data3.current.value == 'menuperso_actions_Others_fairedespompes' then
											animsActionScenario({ anim = "WORLD_HUMAN_PUSH_UPS" })
										end

										if data3.current.value == 'menuperso_actions_Others_regarderauxjumelles' then
											animsActionScenario({ anim = "WORLD_HUMAN_BINOCULARS" })
										end

										if data3.current.value == 'menuperso_actions_Others_faireduyoga' then
											animsActionScenario({ anim = "WORLD_HUMAN_YOGA" })
										end

										if data3.current.value == 'menuperso_actions_Others_fairelastatut' then
											animsActionScenario({ anim = "WORLD_HUMAN_HUMAN_STATUE" })
										end

										if data3.current.value == 'menuperso_actions_Others_fairedujogging' then
											animsActionScenario({ anim = "WORLD_HUMAN_JOG_STANDING" })
										end

										if data3.current.value == 'menuperso_actions_Others_fairedesetirements' then
											animsActionScenario({ anim = "WORLD_HUMAN_MUSCLE_FLEX" })
										end

										if data3.current.value == 'menuperso_actions_Others_racoller' then
											animsActionScenario({ anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS" })
										end

										if data3.current.value == 'menuperso_actions_Others_racoller2' then
											animsActionScenario({ anim = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS" })
										end

										if data3.current.value == 'menuperso_actions_Others_sasseoir' then
											animsActionScenario({ anim = "WORLD_HUMAN_SUNBATHE_BACK" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_sasseoir2' then
											animsActionScenario({ anim = "WORLD_HUMAN_SUNBATHE" })
										end

										if data3.current.value == 'menuperso_actions_Others_sasseoirparterre' then
											animsActionScenario({ anim = "WORLD_HUMAN_PICNIC" })
										end

										if data3.current.value == 'menuperso_actions_Others_attendre' then
											animsActionScenario({ anim = "world_human_leaning" })
										end

										if data3.current.value == 'menuperso_actions_Others_nettoyerquelquechose' then
											animsActionScenario({ anim = "world_human_maid_clean" })
										end

										if data3.current.value == 'menuperso_actions_Others_leverlesmains' then
											animsAction({ lib = "random@mugging3", anim = "handsup_standing_base" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_urinate1' then
											animsAction({ lib = "misscarsteal2peeing", anim = "peeing_loop" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_urinate2' then
											animsAction({ lib = "misstrevor1bathroom", anim = "trevor_peeing" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_urinate3' then
											animsAction({ lib = "rcm_epsilonism4", anim = "peeing" })
										end

										if data3.current.value == 'menuperso_actions_Others_positiondefouille' then
											animsAction({ lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female" })
										end

										if data3.current.value == 'menuperso_actions_Others_segratterlesc' then
											animsAction({ lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" })
										end

										if data3.current.value == 'menuperso_actions_Others_prendreunselfie' then
											animsActionScenario({ anim = "world_human_tourist_mobile" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_prendreunselfie' then
											animsActionScenario({ anim = "WORLD_HUMAN_MOBILE_FILM_SHOCKING" })
										end
										
										if data3.current.value == 'menuperso_actions_Others_maps' then
											animsActionScenario({ anim = "WORLD_HUMAN_TOURIST_MAP" })
										end

									end,
									function(data3, menu3)
										menu3.close()
									end
								)
							end
							
							
						end,
						function(data2, menu2)
							menu2.close()
						end
					)

				end

				if data.current.value == 'menuperso_gpsrapide' then
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'menuperso_gpsrapide',
						{
							title    = 'GPS',
							align    = 'top-left',
							elements = {
								{label = 'LSPD',     value = 'menuperso_gpsrapide_poleemploi'},
								{label = 'Hospital', value = 'menuperso_gpsrapide_hopital'}
							},
						},
						function(data2, menu2)

							if data2.current.value == 'menuperso_gpsrapide_poleemploi' then
								x, y, z = Config.poleemploi.x, Config.poleemploi.y, Config.poleemploi.z
								SetNewWaypoint(x, y, z)
								local source = GetPlayerServerId();
								ESX.ShowNotification("Destination entered into GPS!")
							end

							if data2.current.value == 'menuperso_gpsrapide_comico' then
								x, y, z = Config.comico.x, Config.comico.y, Config.comico.z
								SetNewWaypoint(x, y, z)
								local source = GetPlayerServerId();
								ESX.ShowNotification("Destination entered into GPS!!")
							end

							if data2.current.value == 'menuperso_gpsrapide_hopital' then
								x, y, z = Config.hopital.x, Config.hopital.y, Config.hopital.z
								SetNewWaypoint(x, y, z)
								local source = GetPlayerServerId();
								ESX.ShowNotification("Destination entered into GPS!!")
							end

							if data2.current.value == 'menuperso_gpsrapide_concessionnaire' then
								x, y, z = Config.concessionnaire.x, Config.concessionnaire.y, Config.concessionnaire.z
								SetNewWaypoint(x, y, z)
								local source = GetPlayerServerId();
								ESX.ShowNotification("Destination entered into GPS!!")
							end

							
						end,
						function(data2, menu2)
							menu2.close()
						end
					)

				end
				
				if data.current.value == 'menuperso_grade' then
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'menuperso_grade',
						{
							title    = 'Employee Management',
							align    = 'top-left',
							elements = {
								{label = 'recruit',     value = 'menuperso_grade_recruter'},
								{label = 'Fire',              value = 'menuperso_grade_virer'},
								{label = 'Promote', value = 'menuperso_grade_promouvoir'},
								{label = 'Demote',  value = 'menuperso_grade_destituer'}
							},
						},
						function(data2, menu2)

							if data2.current.value == 'menuperso_grade_recruter' then
								if PlayerData.job.grade_name == 'boss' then
										local job =  PlayerData.job.name
										local grade = 0
										local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestPlayer == -1 or closestDistance > 3.0 then
										ESX.ShowNotification("No players nearby")
									else
										TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(closestPlayer), job,grade)
									end

								else
									Notify("That is above your pay grade.")

								end
								
							end

							if data2.current.value == 'menuperso_grade_virer' then
								if PlayerData.job.grade_name == 'boss' then
										local job =  PlayerData.job.name
										local grade = 0
										local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestPlayer == -1 or closestDistance > 3.0 then
										ESX.ShowNotification("No players nearby")
									else
										TriggerServerEvent('NB:virerplayer', GetPlayerServerId(closestPlayer))
									end

								else
									Notify("That is above your pay grade.")

								end
								
							end

							if data2.current.value == 'menuperso_grade_promouvoir' then

								if PlayerData.job.grade_name == 'boss' then
										local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestPlayer == -1 or closestDistance > 3.0 then
										ESX.ShowNotification("No players nearby")
									else
										TriggerServerEvent('NB:promouvoirplayer', GetPlayerServerId(closestPlayer))
									end

								else
									Notify("That is above your pay grade.")

								end
								
								
							end

							if data2.current.value == 'menuperso_grade_destituer' then

								if PlayerData.job.grade_name == 'boss' then
										local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestPlayer == -1 or closestDistance > 3.0 then
										ESX.ShowNotification("No players nearby")
									else
										TriggerServerEvent('NB:destituerplayer', GetPlayerServerId(closestPlayer))
									end

								else
									Notify("That is above your pay grade.")

								end
								
								
							end

							
						end,
						function(data2, menu2)
							menu2.close()
						end
					)
				end	
				
				
			end,
			function(data, menu)
				menu.close()
			end
		)
		
	end)
end

---------------------------------------------------------------------------Vehicle Menu

function OpenVehiculeMenu()
	
	ESX.UI.Menu.CloseAll()
		
	local elements = {}
	
	if vehiculeON then
		table.insert(elements, {label = 'Shut off engine',			value = 'menuperso_vehicule_MoteurOff'})
	else
		table.insert(elements, {label = 'Start your engine',		value = 'menuperso_vehicule_MoteurOn'})
	end
	
	if porteAvantGaucheOuverte then
		table.insert(elements, {label = 'Close left door',	value = 'menuperso_vehicule_fermerportes_fermerportegauche'})
	else
		table.insert(elements, {label = 'Open left door',		value = 'menuperso_vehicule_ouvrirportes_ouvrirportegauche'})
	end
	
	if porteAvantDroiteOuverte then
		table.insert(elements, {label = 'Close right door',	value = 'menuperso_vehicule_fermerportes_fermerportedroite'})
	else
		table.insert(elements, {label = 'Open right door',		value = 'menuperso_vehicule_ouvrirportes_ouvrirportedroite'})
	end
	
	if porteArriereGaucheOuverte then
		table.insert(elements, {label = 'Close left rear door',	value = 'menuperso_vehicule_fermerportes_fermerportearrieregauche'})
	else
		table.insert(elements, {label = 'Open left rear door',		value = 'menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche'})
	end
	
	if porteArriereDroiteOuverte then
		table.insert(elements, {label = 'Close right rear door',	value = 'menuperso_vehicule_fermerportes_fermerportearrieredroite'})
	else
		table.insert(elements, {label = 'Open right rear door',		value = 'menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite'})
	end
	
	if porteCapotOuvert then
		table.insert(elements, {label = 'Close hood',	value = 'menuperso_vehicule_fermerportes_fermercapot'})
	else
		table.insert(elements, {label = 'Open hood',		value = 'menuperso_vehicule_ouvrirportes_ouvrircapot'})
	end
	
	if porteCoffreOuvert then
		table.insert(elements, {label = 'Close trunk',	value = 'menuperso_vehicule_fermerportes_fermercoffre'})
	else
		table.insert(elements, {label = 'Open trunk',		value = 'menuperso_vehicule_ouvrirportes_ouvrircoffre'})
	end
	
	if porteAutre1Ouvert then
		table.insert(elements, {label = 'Close other 1',	value = 'menuperso_vehicule_fermerportes_fermerAutre1'})
	else
		table.insert(elements, {label = 'Open other 1',		value = 'menuperso_vehicule_ouvrirportes_ouvrirAutre1'})
	end
	
	if porteAutre2Ouvert then
		table.insert(elements, {label = 'Close other 2',	value = 'menuperso_vehicule_fermerportes_fermerAutre2'})
	else
		table.insert(elements, {label = 'Open other 2',		value = 'menuperso_vehicule_ouvrirportes_ouvrirAutre2'})
	end
	

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'menuperso_vehicule',
		{
			img    = 'menu_vehicule',
			 title    = 'Vehicle',
			align    = 'top-left',
			elements = elements
		},
		function(data, menu)
--------------------- GESTION MOTEUR
			if data.current.value == 'menuperso_vehicule_MoteurOn' then
				vehiculeON = true
				SetVehicleEngineOn(GetVehiclePedIsIn( GetPlayerPed(-1), false ), true, false, true)
				SetVehicleUndriveable(GetVehiclePedIsIn( GetPlayerPed(-1), false ), false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_MoteurOff' then
				vehiculeON = false
				SetVehicleEngineOn(GetVehiclePedIsIn( GetPlayerPed(-1), false ), false, false, true)
				SetVehicleUndriveable(GetVehiclePedIsIn( GetPlayerPed(-1), false ), true)
				OpenVehiculeMenu()
			end
--------------------- OUVRIR LES PORTES
			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirportegauche' then
				porteAvantGaucheOuverte = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 0, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirportedroite' then
				porteAvantDroiteOuverte = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 1, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche' then
				porteArriereGaucheOuverte = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 2, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite' then
				porteArriereDroiteOuverte = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 3, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrircapot' then
				porteCapotOuvert = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 4, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrircoffre' then
				porteCoffreOuvert = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 5, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirAutre1' then
				porteAutre1Ouvert = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 6, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirAutre2' then
				porteAutre2Ouvert = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 7, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_ouvrirportes_ouvrirTout' then
				porteAvantGaucheOuverte = true
				porteAvantDroiteOuverte = true
				porteArriereGaucheOuverte = true
				porteArriereDroiteOuverte = true
				porteCapotOuvert = true
				porteCoffreOuvert = true
				porteAutre1Ouvert = true
				porteAutre2Ouvert = true
				porteToutOuvert = true
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 0, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 1, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 2, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 3, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 4, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 5, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 6, false, false)
				SetVehicleDoorOpen(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 7, false, false)
				OpenVehiculeMenu()
			end
--------------------- FERMER LES PORTES
			if data.current.value == 'menuperso_vehicule_fermerportes_fermerportegauche' then
				porteAvantGaucheOuverte = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 0, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerportedroite' then
				porteAvantDroiteOuverte = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 1, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerportearrieregauche' then
				porteArriereGaucheOuverte = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 2, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerportearrieredroite' then
				porteArriereDroiteOuverte = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 3, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermercapot' then
				porteCapotOuvert = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 4, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermercoffre' then
				porteCoffreOuvert = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 5, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerAutre1' then
				porteAutre1Ouvert = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 6, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerAutre2' then
				porteAutre2Ouvert = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 7, false, false)
				OpenVehiculeMenu()
			end

			if data.current.value == 'menuperso_vehicule_fermerportes_fermerTout' then
				porteAvantGaucheOuverte = false
				porteAvantDroiteOuverte = false
				porteArriereGaucheOuverte = false
				porteArriereDroiteOuverte = false
				porteCapotOuvert = false
				porteCoffreOuvert = false
				porteAutre1Ouvert = false
				porteAutre2Ouvert = false
				porteToutOuvert = false
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 0, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 1, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 2, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 3, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 4, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 5, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 6, false, false)
				SetVehicleDoorShut(GetVehiclePedIsIn( GetPlayerPed(-1), false ), 7, false, false)
				OpenVehiculeMenu()
			end
			
		end,
		function(data, menu)
			menu.close()
		end
	)
end

---------------------------------------------------------------------------Modération

-- GOTO JOUEUR
function admin_tp_toplayer()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter the player ID")
	inputgoto = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputgoto == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputgoto = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputgoto = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputgoto = 0
			end
		end
		if inputgoto == 2 then
			local gotoply = GetOnscreenKeyboardResult()
			local playerPed = GetPlayerPed(-1)
			local teleportPed = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tonumber(gotoply))))
			SetEntityCoords(playerPed, teleportPed)
			
			inputgoto = 0
		end
	end
end)
-- FIN GOTO JOUEUR

-- TP UN JOUEUR A MOI
function admin_tp_playertome()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter the player ID...")
	inputteleport = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputteleport == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputteleport = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputteleport = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputteleport = 0
			end
		end
		if inputteleport == 2 then
			local teleportply = GetOnscreenKeyboardResult()
			local playerPed = GetPlayerFromServerId(tonumber(teleportply))
			local teleportPed = GetEntityCoords(GetPlayerPed(-1))
			SetEntityCoords(playerPed, teleportPed)
			
			inputteleport = 0
		end
	end
end)
-- FIN TP UN JOUEUR A MOI

-- TP A POSITION
function admin_tp_pos()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter location...")
	inputpos = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputpos == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputpos = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputpos = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputpos = 0
			end
		end
		if inputpos == 2 then
			local pos = GetOnscreenKeyboardResult() -- GetOnscreenKeyboardResult RECUPERE LA POSITION RENTRER PAR LE JOUEUR
			local _,_,x,y,z = string.find( pos or "0,0,0", "([%d%.]+),([%d%.]+),([%d%.]+)" )
			
			--SetEntityCoords(GetPlayerPed(-1), x, y, z)
		    SetEntityCoords(GetPlayerPed(-1), x+0.0001, y+0.0001, z+0.0001) -- TP LE JOUEUR A LA POSITION
			inputpos = 0
		end
	end
end)
-- FIN TP A POSITION

-- FONCTION NOCLIP 
local noclip = false
local noclip_speed = 1.0

function admin_no_clip()
  noclip = not noclip
  local ped = GetPlayerPed(-1)
  if noclip then -- activé
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
	Notify("Noclip ~g~active")
  else -- désactivé
    SetEntityInvincible(ped, false)
    SetEntityVisible(ped, true, false)
	Notify("Noclip ~r~deactivated")
  end
end

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function isNoclip()
  return noclip
end

-- noclip/invisible
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if noclip then
      local ped = GetPlayerPed(-1)
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed

      -- reset du velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

      -- aller vers le haut
      if IsControlPressed(0,32) then -- MOVE UP
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end

      -- aller vers le bas
      if IsControlPressed(0,269) then -- MOVE DOWN
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end

      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
    end
  end
end)
-- FIN NOCLIP

-- GOD MODE
function admin_godmode()
  godmode = not godmode
  local ped = GetPlayerPed(-1)
  
  if godmode then -- activé
		SetEntityInvincible(ped, true)
		Notify("Godmode ~g~active")
	else
		SetEntityInvincible(ped, false)
		Notify("Godmode ~r~deactivated")
  end
end
-- FIN GOD MODE

-- INVISIBLE
function admin_mode_fantome()
  invisible = not invisible
  local ped = GetPlayerPed(-1)
  
  if invisible then -- activé
		SetEntityVisible(ped, false, false)
		Notify("Ghostmode : active")
	else
		SetEntityVisible(ped, true, false)
		Notify("Ghostmode : deactivated")
  end
end
-- FIN INVISIBLE

-- Réparer vehicule
function admin_vehicle_repair()

    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsUsing(ped)
	
		SetVehicleFixed(car)
		SetVehicleDirtLevel(car, 0.0)

end
-- FIN Réparer vehicule

-- Spawn vehicule
function admin_vehicle_spawn()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter vehicle name...")
	inputvehicle = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputvehicle == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputvehicle = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputvehicle = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputvehicle = 0
			end
		end
		if inputvehicle == 2 then
		local vehicleidd = GetOnscreenKeyboardResult()

				local car = GetHashKey(vehicleidd)
				
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					RequestModel(car)
					while not HasModelLoaded(car) do
						Citizen.Wait(0)
					end
                    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
					veh = CreateVehicle(car, x,y,z, 0.0, true, false)
					SetEntityVelocity(veh, 2000)
					SetVehicleOnGroundProperly(veh)
					SetVehicleHasBeenOwnedByPlayer(veh,true)
					local id = NetworkGetNetworkIdFromEntity(veh)
					SetNetworkIdCanMigrate(id, true)
					SetVehRadioStation(veh, "OFF")
					SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
					Notify("Your vehicle has been delivered.")
				end)
		
        inputvehicle = 0
		end
	end
end)
-- FIN Spawn vehicule

-- flipVehicle
function admin_vehicle_flip()

    local player = GetPlayerPed(-1)
    posdepmenu = GetEntityCoords(player)
    carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
	if carTargetDep ~= nil then
			platecarTargetDep = GetVehicleNumberPlateText(carTargetDep)
	end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
	
	SetEntityCoords(carTargetDep, playerCoords)
	
	Notify("Reset vehicle.")

end
-- FIN flipVehicle

-- GIVE DE L'ARGENT
function admin_give_money()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter amount...")
	inputmoney = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoney == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoney = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoney = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoney = 0
			end
		end
		if inputmoney == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('AdminMenu:giveCash', money)
			inputmoney = 0
		end
	end
end)
-- FIN GIVE DE L'ARGENT

-- GIVE DE L'ARGENT EN BANQUE
function admin_give_bank()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter amount...")
	inputmoneybank = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoneybank == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoneybank = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoneybank = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoneybank = 0
			end
		end
		if inputmoneybank == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('AdminMenu:giveBank', money)
			inputmoneybank = 0
		end
	end
end)
-- FIN GIVE DE L'ARGENT EN BANQUE

-- GIVE DE L'ARGENT SALE
function admin_give_dirty()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter amount...")
	inputmoneydirty = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoneydirty == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoneydirty = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoneydirty = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoneydirty = 0
			end
		end
		if inputmoneydirty == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('AdminMenu:giveDirtyMoney', money)
			inputmoneydirty = 0
		end
	end
end)
-- FIN GIVE DE L'ARGENT SALE

-- Afficher Coord
function modo_showcoord()
	if showcoord then
		showcoord = false
	else
		showcoord = true
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		
		if showcoord then
			local playerPos = GetEntityCoords(GetPlayerPed(-1))
			local playerHeading = GetEntityHeading(GetPlayerPed(-1))
			Text("~r~X~s~: " ..playerPos.x.." ~b~Y~s~: " ..playerPos.y.." ~g~Z~s~: " ..playerPos.z.." ~y~Angle~s~: " ..playerHeading.."")
		end
		
	end
end)
-- FIN Afficher Coord

-- Afficher Nom
function modo_showname()
	if showname then
		showname = false
	else
		Notify("Open/Close pause menu to display names")
		showname = true
	end
end

Citizen.CreateThread(function()
	while true do
		Wait( 1 )
		if showname then
			for id = 0, 200 do
				if NetworkIsPlayerActive( id ) and GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
					ped = GetPlayerPed( id )
					blip = GetBlipFromEntity( ped )
					headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, (GetPlayerServerId( id )..' - '..GetPlayerName( id )), false, false, "", false )
				end
			end
		else
			for id = 0, 200 do
				if NetworkIsPlayerActive( id ) and GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
					ped = GetPlayerPed( id )
					blip = GetBlipFromEntity( ped )
					headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, (' '), false, false, "", false )
				end
			end
		end
	end
end)
-- FIN Afficher Nom

-- TP MARCKER
function admin_tp_marcker()
	
	ESX.TriggerServerCallback('NB:getUsergroup', function(group)
		playergroup = group
		
		if playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'owner' then
			local playerPed = GetPlayerPed(-1)
			local WaypointHandle = GetFirstBlipInfoId(8)
			if DoesBlipExist(WaypointHandle) then
				local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
				--SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, coord.z, false, false, false, true)
				SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.5, false, false, false, true)
				Notify("Teleport to marker!")
			else
				Notify("No marker placed!")
			end
		end
		
	end)
end
-- FIN TP MARCKER

-- HEAL JOUEUR
function admin_heal_player()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter player ID...")
	inputheal = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputheal == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputheal = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputheal = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputheal = 0
			end
		end
		if inputheal == 2 then
		local healply = GetOnscreenKeyboardResult()
		TriggerServerEvent('esx_ambulancejob:revive', healply)
		
        inputheal = 0
		end
	end
end)
-- FIN HEAL JOUEUR

-- SPEC JOUEUR
function admin_spec_player()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	Notify("~b~Enter player ID...")
	inputspec = 1
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputspec == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputspec = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputspec = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputspec = 0
			end
		end
		if inputspec == 2 then
		local target = GetOnscreenKeyboardResult()
		
		TriggerEvent('es_camera:spectate', source, target)
		
        inputspec = 0
		end
	end
end)
-- FIN SPEC JOUEUR

---------------------------------------------------------------------------Me concernant

function openTelephone()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuTelephone')
end

function openInventaire()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuInventaire')
end

function openFacture()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuFactures')
end

---------------------------------------------------------------------------Actions

local playAnim = false
local dataAnim = {}

function animsAction(animObj)
	if (IsInVehicle()) then
		local source = GetPlayerServerId();
		ESX.ShowNotification("Get out of your vehicle to do this!")
	else
		Citizen.CreateThread(function()
			if not playAnim then
				local playerPed = GetPlayerPed(-1);
				if DoesEntityExist(playerPed) then -- Ckeck if ped exist
					dataAnim = animObj

					-- Play Animation
					RequestAnimDict(dataAnim.lib)
					while not HasAnimDictLoaded(dataAnim.lib) do
						Citizen.Wait(0)
					end
					if HasAnimDictLoaded(dataAnim.lib) then
						local flag = 0
						if dataAnim.loop ~= nil and dataAnim.loop then
							flag = 1
						elseif dataAnim.move ~= nil and dataAnim.move then
							flag = 49
						end

						TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
						playAnimation = true
					end

					-- Wait end annimation
					while true do
						Citizen.Wait(0)
						if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
							playAnim = false
							TriggerEvent('ft_animation:ClFinish')
							break
						end
					end
				end -- end ped exist
			end
		end)
	end
end
	

function animsActionScenario(animObj)
	if (IsInVehicle()) then
		local source = GetPlayerServerId();
		ESX.ShowNotification("Get out of your vehicle to do this!")
	else
		Citizen.CreateThread(function()
			if not playAnim then
				local playerPed = GetPlayerPed(-1);
				if DoesEntityExist(playerPed) then
					dataAnim = animObj
					TaskStartScenarioInPlace(playerPed, dataAnim.anim, 0, false)
					playAnimation = true
				end
			end
		end)
	end
end

-- Verifie si le joueurs est dans un vehicule ou pas
function IsInVehicle()
	local ply = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(ply) then
		return true
	else
		return false
	end
end

function changer_skin()
	TriggerEvent('esx_skin:openSaveableMenu', source)
end

function save_skin()
	TriggerEvent('esx_skin:requestSaveSkin', source)
end

---------------------------------------------------------------------------------------------------------
--NB : gestion des menu
---------------------------------------------------------------------------------------------------------

RegisterNetEvent('NB:goTpMarcker')
AddEventHandler('NB:goTpMarcker', function()
	admin_tp_marcker()
end)

RegisterNetEvent('NB:openMenuPersonnel')
AddEventHandler('NB:openMenuPersonnel', function()
	OpenPersonnelMenu()
end)
