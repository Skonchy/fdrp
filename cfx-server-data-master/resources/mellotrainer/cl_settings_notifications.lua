--[[--------------------------------------------------------------------------
	*
	* Mello Trainer
	* (C) Michael Goodwin 2017
	* http://github.com/thestonedturtle/mellotrainer/releases
	*
	* This menu used the Scorpion Trainer as a framework to build off of.
	* https://github.com/pongo1231/ScorpionTrainer
	* (C) Emre Cürgül 2017
	* 
	* A lot of useful functionality has been converted from the lambda menu.
	* https://lambda.menu
	* (C) Oui 2017
	*
	* Additional Contributors:
	* WolfKnight (https://forum.fivem.net/u/WolfKnight)
	*
---------------------------------------------------------------------------]]

local selfDeathMessage = "~o~You ~s~died."
local deathSuicideMessage = "~o~You ~s~commited suicide."

-- Hold dead players to prevent multiple messages.
local deadPlayers = {}

RegisterNUICallback("notifications", function(data, cb)
	local action = data.action
	local state = data.newstate
	local request = data.data[3]
	local text,text2

	if(state) then
		text = "~g~ON"
		text2 = "~r~OFF"
	else
		text = "~r~OFF"
		text2 = "~g~ON"
	end



	if(cb)then cb("ok") end
end)

RegisterNetEvent( 'mellotrainer:playerJoined' )
AddEventHandler( 'mellotrainer:playerJoined', function( ID )

	end
end)

RegisterNetEvent( 'mellotrainer:playerLeft' )
AddEventHandler( 'mellotrainer:playerLeft', function( person )
	if ( featurePlayerNotifications ) then
	
	end
end )

-- Better Death Messages
function killActionFromWeaponHash(weaponHash)
	
end

-- Other Player died
function handlePlayerDeathMessage( pedID, currentPed )
	local me = PlayerId()
	local entity, weaponHash = NetworkGetEntityKillerOfPlayer( pedID )
	local name = GetPlayerName( pedID )

	local msg = "~o~<C>" .. name .. "</C> ~s~died."

	if ( IsPedAPlayer( entity ) ) then
		local killer = NetworkGetPlayerIndexFromPed( entity )
		local kname = GetPlayerName( killer )

		if ( kname == name ) then
			msg = "~o~<C>" .. name .. "</C> ~s~commited suicide."
		elseif ( kname == GetPlayerName( me ) )then
			msg = "~o~<C>You</C> ~s~" .. killActionFromWeaponHash( weaponHash ) .. " ~o~<C>" .. name .. "</C>~s~."
		else
			msg = "~y~<C>" .. kname .. "</C> ~s~" .. killActionFromWeaponHash( weaponHash ) .. " ~o~<C>" .. name .. "</C>~s~."
		end
	end

	drawNotification( msg )
end


-- Check for death messages
function checkForDeaths()
    local me = PlayerId()

    for i = 0, maxPlayers, 1 do
        if ( NetworkIsPlayerConnected( i ) ) then
        	local currentPed = GetPlayerPed( i )

        	if ( DoesEntityExist( currentPed ) and IsEntityDead( currentPed ) ) then 

        		if(deadPlayers[i] == nil)then
	       			handlePlayerDeathMessage( i, currentPed )
	       			deadPlayers[i] = true
	       		end
	       	else
				deadPlayers[i] = nil	       		
			end
		end
	end
end


Citizen.CreateThread( function()
	while true do
		Citizen.Wait( 0 )

		if ( featureDeathNotifications ) then
			checkForDeaths()
		end
	end
end )