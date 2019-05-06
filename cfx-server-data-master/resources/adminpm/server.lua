AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	

	if cm[1] == "/apm" or cm[1] == "/adminmessage" then
		CancelEvent()
			if tablelength(cm) > 1 then
			local tPID = tonumber(cm[2])
			local names2 = GetPlayerName(tPID)
			local names3 = GetPlayerName(source)
			local msgVar = {}
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 and i ~= 2 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end
			
			TriggerClientEvent('simp:textmsg', tPID, source, textmsg, names2, names3)
			TriggerClientEvent('simp:textsent', source, tPID, names2)
		end
	end
	
	if cm[1] == "/read" or cm[1] == "/reread" or cm[1] == "/rerd" then
		CancelEvent()
		
			TriggerClientEvent('simp:recovermessage', source)
	end
	
end)

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
