RegisterServerEvent('taxi:success')
AddEventHandler('taxi:success', function()
	total = math.random(3000, 5000)
	
	TriggerEvent('es:getPlayerFromId', source, function(user)
		user.addMoney(total)
	end)
end)