-- Text cmds.
-- How to add commands?
-- Copy line 9 to 13 then change the command and message, you can change the color by changing the rgb color code.

AddEventHandler('chatMessage', function(source, n, msg)

	msg = string.lower(msg)
	
	if(msg == "/help") then
		CancelEvent()
		TriggerClientEvent('chatMessage', source, "Basic Help: ", {255, 0, 0}, "/emotes for a list of all emotes / commands & /report to send a message to server admins")
		TriggerEvent('disclaimer:display', true)
	end
	if(msg == "/ahelp") then
		CancelEvent()
		TriggerClientEvent('chatMessage', source, "Admin CMD's: ", {255, 0, 0}, " ^8 /ban [id] [reason]  /kick [id] [reason] /teampbanclient [id] [reason] /givemoney [id] [amount] /goto [id] /bring [id] /setweather [weathertype] /toggleweather [on/off] ")
		
	end
	
	if(msg == "/emotes") then
		CancelEvent()
		TriggerClientEvent('chatMessage', source, "Available emotes useing /: ", {255, 0, 0}, " ^8 /notepad /cop /smoke /smoke2 /smokepot /map /drink /cheer /camera /standfire /impatient /walleat /walltablet /cower /chair /bench /windowshop /deal /dealhard /coffee /lean /sit /investigate /crowd /binos /drill /stupor /guard /golf /atm /phone /flashlight /medic /traffic /bin /sleep /impatient ")
		
	end
end)

