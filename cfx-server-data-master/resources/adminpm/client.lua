RegisterNetEvent("simp:textsent")
AddEventHandler('simp:textsent', function(tPID, names2)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Your Admin Message was sent!")
		SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "Message to: ".. names2 .." [".. tPID .."]", "")
		DrawNotification(true, true)
end)

RegisterNetEvent("simp:textmsg")
AddEventHandler('simp:textmsg', function(source, textmsg, names2, names3 )
		textData.hasRecievedMessage = true
		textData.lastPlayerMessage = textmsg
		textData.lastPlayermessageRecieved = source
		textData.lastMessagenames2 = names3
		SetNotificationTextEntry("STRING")
		AddTextComponentString(textmsg)
		SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "Admin Message From ".. names3 .." [".. source .."]", "")
		DrawNotification(true, true)
end)

RegisterNetEvent("simp:recovermessage")
AddEventHandler('simp:recovermessage', function()
		local textmsg = textData.lastPlayerMessage
		local ply = textData.lastPlayermessageRecieved
		local names3 = textData.lastMessagenames2
		SetNotificationTextEntry("STRING")
		AddTextComponentString(textmsg)
		SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "From: ".. names3 .." [" .. tostring(ply) .. "]", "")
		DrawNotification(true, true)
end)