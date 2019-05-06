local signal13 = false
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end



RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	local source = source
	if message == "/13" then
		CancelEvent()
		TriggerClientEvent('signal13:getcoords', source)
	end
end)

RegisterServerEvent('signal13:activate')
AddEventHandler('signal13:activate', function(coords)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				TriggerClientEvent('esx:showNotification', xPlayers[i], _U('signal_alert'))
				TriggerClientEvent('signal13:setblip', xPlayers[i], coords)
		end
	end
	TriggerClientEvent('esx:showNotification', source, _U('signal_13'))
				local savedSource = source
	SetTimeout(300000, function()
		signal13 = false
		TriggerClientEvent('signal13:disabled', savedSource, job)
		if(xPlayer)then
			local xPlayers = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
 				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('signal_disabled'))
					TriggerClientEvent('signal13:killblip', xPlayers[i])
				end
			end
		end
	end
end)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	