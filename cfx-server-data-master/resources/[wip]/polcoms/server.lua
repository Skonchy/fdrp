AddEventHandler("chatMessage", function(source, name, message)
	cm = stringsplit(message, " ")

	if cm[1] == "/cuff" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local tPID = tonumber(cm[2])
			TriggerClientEvent("Handcuff", tPID)
		end
	end

	if cm[1] == "/drag" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local tPID = tonumber(cm[2])
			TriggerClientEvent("Drag", tPID, source)
		end
	end
end)

--[[ Handsup Kneel Script]]-- Author-Coshark

TriggerEvent('es:addCommand', 'huk', function(source, args, user)
	TriggerClientEvent('KneelHU', source, {})
end, {help = "Get down on your knees and put your hands on your head"})

--[[Stringsplit]]--

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
	if message == "/cop" then
		CancelEvent()
		TriggerClientEvent("cop", source)
	end
end)
RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/cop2" then
		CancelEvent()
		TriggerClientEvent("Cop2", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/restartannounce" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 15 minutes. Please begin preparations for safe disconnection.")
		print('Announced 15 minutes till restart')
		Wait(300000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 10 minutes. Please find a safe place to disconnect.")
		print('Announced 10 minutes till restart')
		Wait(300000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 5 minutes. Please find a safe place to disconnect.")
		print('Announced 5 minutes till restart')
		Wait(180000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 2 minutes. Please safely disconnect or your character may not save properly.")
		print('Announced 2 minutes till restart')
		Wait(60000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 1 minute. Please disconnect now!")
		print('Announced 1 minute till restart')
		Wait(55000)
		print('Restart in 5')
		Wait(1000)
		print('Restart in 4')
		Wait(1000)
		print('Restart in 3')
		Wait(1000)
		print('Restart in 2')
		Wait(1000)
		print('Restart now!')
	end
end)

AddEventHandler("rconCommand", function(command, args)
    if command == "restartannounce" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 15 minutes. Please begin preparations for safe disconnection.")
		print('Announced 15 minutes till restart')
		Wait(300000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 10 minutes. Please find a safe place to disconnect.")
		print('Announced 10 minutes till restart')
		Wait(300000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 5 minutes. Please find a safe place to disconnect.")
		print('Announced 5 minutes till restart')
		Wait(180000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 2 minutes. Please safely disconnect or your character may not save properly.")
		print('Announced 2 minutes till restart')
		Wait(60000)
		TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "Server restarting in 1 minute. Please disconnect now!")
		print('Announced 1 minute till restart')
		Wait(55000)
		print('Restart in 5')
		Wait(1000)
		print('Restart in 4')
		Wait(1000)
		print('Restart in 3')
		Wait(1000)
		print('Restart in 2')
		Wait(1000)
		print('Restart now!')
	end
end)
		
		
RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/notepad" then
		CancelEvent()
		TriggerClientEvent("notepad", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/smoke" then
		CancelEvent()
		TriggerClientEvent("smoke", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/smoke2" then
		CancelEvent()
		TriggerClientEvent("smoke2", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/smokepot" then
		CancelEvent()
		TriggerClientEvent("smokepot", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/map" then
		CancelEvent()
		TriggerClientEvent("map", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/drink" then
		CancelEvent()
		TriggerClientEvent("drink", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/cheer" then
		CancelEvent()
		TriggerClientEvent("cheer", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/camera" then
		CancelEvent()
		TriggerClientEvent("camera", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/standfire" then
		CancelEvent()
		TriggerClientEvent("standfire", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/impatient" then
		CancelEvent()
		TriggerClientEvent("impatient", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/walleat" then
		CancelEvent()
		TriggerClientEvent("walleat", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/walltablet" then
		CancelEvent()
		TriggerClientEvent("walltablet", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/cower" then
		CancelEvent()
		TriggerClientEvent("cower", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/chair" then
		CancelEvent()
		TriggerClientEvent("chair", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/bench" then
		CancelEvent()
		TriggerClientEvent("bench", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/windowshop" then
		CancelEvent()
		TriggerClientEvent("windowshop", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/deal" then
		CancelEvent()
		TriggerClientEvent("deal", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/dealhard" then
		CancelEvent()
		TriggerClientEvent("dealhard", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/coffee" then
		CancelEvent()
		TriggerClientEvent("coffee", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/lean" then
		CancelEvent()
		TriggerClientEvent("lean", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/sit" then
		CancelEvent()
		TriggerClientEvent("sit", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/investigate" then
		CancelEvent()
		TriggerClientEvent("investigate", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/crowd" then
		CancelEvent()
		TriggerClientEvent("crowd", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/binos" then
		CancelEvent()
		TriggerClientEvent("binos", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/drill" then
		CancelEvent()
		TriggerClientEvent("drill", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/stupor" then
		CancelEvent()
		TriggerClientEvent("stupor", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/bin" then
		CancelEvent()
		TriggerClientEvent("bin", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/sleep" then
		CancelEvent()
		TriggerClientEvent("sleep", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/bunnyeat" then
		CancelEvent()
		TriggerClientEvent("bunnyeat", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/impatient" then
		CancelEvent()
		TriggerClientEvent("impatient", source)
	end
end)




AddEventHandler("chatMessage", function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/clear") then
		CancelEvent()
		TriggerClientEvent('cleararea', source)	
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/engine") then
		CancelEvent()
		TriggerClientEvent('Engine', source)		
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/surrender") then
		CancelEvent()
		TriggerClientEvent('KneelHU', source)		
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/bbq") then
		CancelEvent()
		TriggerClientEvent('bbq', source)		
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/wash") then
		CancelEvent()
		TriggerClientEvent('wash', source)		
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/stripwatch") then
		CancelEvent()
		TriggerClientEvent('stripwatch', source)		
	end
end)

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/super") then
		CancelEvent()
		TriggerClientEvent('super', source)		
	end
end)



RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/copf" then
		CancelEvent()
		TriggerClientEvent("Copf", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/seatbelt" then
		CancelEvent()
		TriggerClientEvent("glg:seatbelt", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/test" then
		CancelEvent()
		TriggerClientEvent("Test", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/traffic" then
		CancelEvent()
		TriggerClientEvent("traffic", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/medic" then
		CancelEvent()
		TriggerClientEvent("medic", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/flashlight" then
		CancelEvent()
		TriggerClientEvent("flashlight", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/phone" then
		CancelEvent()
		TriggerClientEvent("phone", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/bark" then
		CancelEvent()
		TriggerClientEvent("bark", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/dogsit" then
		CancelEvent()
		TriggerClientEvent("dogsit", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/golf" then
		CancelEvent()
		TriggerClientEvent("golf", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/atm" then
		CancelEvent()
		TriggerClientEvent("atm", source)
	end
end)

RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/guard" then
		CancelEvent()
		TriggerClientEvent("guard", source)
	end
end)
