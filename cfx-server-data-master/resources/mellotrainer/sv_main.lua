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

_VERSION = '0.5.0'

--[[------------------------------------------------------------------------
	Version Check 
	Credits to EssentialMode 
------------------------------------------------------------------------]]--



--[[------------------------------------------------------------------------
	Steam Only Connection 
------------------------------------------------------------------------]]--
AddEventHandler( 'playerConnecting', function( name, cb )
	if ( Config.settings.steamOnly ) then 
		local id = DATASAVE:GetIdentifier( source, "steam" )

		if ( id == nil ) then 
			cb( "This server requires you to be logged into the Steam client." )
			CancelEvent()
		end 
	end 
end )