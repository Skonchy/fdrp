-- Created by Murtaza
-- V 1.1
-- Requested by @Dillon_Dobusz on forum.fivem.net

-- Serverside

------ CONFIG ------

local everyoneAllowed = false -- If true, everyone is allowed and you do not need to add steam/ip identifiers. If false, you need to add steam/ip identifiers so they can use the command.

local allowed =  
{
	"steam:110000100084851",
	"steam:1100001010c1bfb",
	"steam:1100001066b0c23",
	"steam:76561198070767964",
	"steam:1100001042ffec7",
	"steam:11000010221fde4",
	"ip:192.168.0.2",
	"ip:10.0.0.2"
}

------ CODE DO NOT TOUCH UNLESS YOU KNOW WHAT YOU ARE DOING :) ------

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	if msg == '/cone' then
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:cone', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:cone', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	elseif msg == '/sbarrier' then
	
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:sbarrier', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:sbarrier', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	elseif msg == '/barrier' then
	
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:barrier', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:barrier', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end
	
	return false
end