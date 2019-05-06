ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('NB:getUsergroup', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local group = xPlayer.getGroup()
  cb(group)
end)

function getMaximumGrade(jobname)
    local result = MySQL.Sync.fetchAll("SELECT * FROM job_grades WHERE job_name=@jobname  ORDER BY `grade` DESC ;", {
        ['@jobname'] = jobname
    })
    if result[1] ~= nil then
        return result[1].grade
    end
    return nil
end

-------------------------------------------------------------------------------Admin Menu

RegisterServerEvent("AdminMenu:giveCash")
AddEventHandler("AdminMenu:giveCash", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addMoney((total))
	local item = ' $  money !'
	local message = 'You give '
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

RegisterServerEvent("AdminMenu:giveBank")
AddEventHandler("AdminMenu:giveBank", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addAccountMoney('bank', total)
	local item = ' $ to bank.'
	local message = 'Sent '
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

RegisterServerEvent("AdminMenu:giveDirtyMoney")
AddEventHandler("AdminMenu:giveDirtyMoney", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addAccountMoney('black_money', total)
	local item = ' $ dirty cash.'
	local message = 'Gave '
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

-------------------------------------------------------------------------------Grade Menu
RegisterServerEvent('NB:promouvoirplayer')
AddEventHandler('NB:promouvoirplayer', function(target)

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local maximumgrade = tonumber(getMaximumGrade(sourceXPlayer.job.name)) -1 

	if(targetXPlayer.job.grade == maximumgrade)then
		TriggerClientEvent('esx:showNotification', _source, "You must ask permission from the ~r~Governement~w~.")
	else
		if(sourceXPlayer.job.name == targetXPlayer.job.name)then

			local grade = tonumber(targetXPlayer.job.grade) + 1 
			local job = targetXPlayer.job.name

			targetXPlayer.setJob(job, grade)

			TriggerClientEvent('esx:showNotification', _source, "You have been ~g~promoted "..targetXPlayer.name.."~w~.")
			TriggerClientEvent('esx:showNotification', target,  "You were promoted by ".. sourceXPlayer.name.."~w~.")		

		else
			TriggerClientEvent('esx:showNotification', _source, "That is above your pay grade.")

		end

	end 
		
end)

RegisterServerEvent('NB:destituerplayer')
AddEventHandler('NB:destituerplayer', function(target)

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if(targetXPlayer.job.grade == 0)then
		TriggerClientEvent('esx:showNotification', _source, "They have been demoted as low as it goes.")
	else
		if(sourceXPlayer.job.name == targetXPlayer.job.name)then

			local grade = tonumber(targetXPlayer.job.grade) - 1 
			local job = targetXPlayer.job.name

			targetXPlayer.setJob(job, grade)

			TriggerClientEvent('esx:showNotification', _source, "You have been demoted "..targetXPlayer.name.."~w~.")
			TriggerClientEvent('esx:showNotification', target,  "You were demoted by ".. sourceXPlayer.name.."~w~.")		

		else
			TriggerClientEvent('esx:showNotification', _source, "That is above your pay grade.")

		end

	end 
		
end)

RegisterServerEvent('NB:recruterplayer')
AddEventHandler('NB:recruterplayer', function(target, job, grade)

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	
		targetXPlayer.setJob(job, grade)

		TriggerClientEvent('esx:showNotification', _source, "You have hired "..targetXPlayer.name.."~w~.")
		TriggerClientEvent('esx:showNotification', target,  "You were hired by ".. sourceXPlayer.name.."~w~.")		

end)

RegisterServerEvent('NB:virerplayer')
AddEventHandler('NB:virerplayer', function(target)

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local job = "unemployed"
	local grade = "0"

	if(sourceXPlayer.job.name == targetXPlayer.job.name)then
		targetXPlayer.setJob(job, grade)

		TriggerClientEvent('esx:showNotification', _source, "You have terminated "..targetXPlayer.name.."~w~.")
		TriggerClientEvent('esx:showNotification', target,  "You have been terminated by ".. sourceXPlayer.name.."~w~.")	
	else

		TriggerClientEvent('esx:showNotification', _source, "That is above your pay grade.")

	end

end)