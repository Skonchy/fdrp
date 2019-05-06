ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersTransformingCoke2 = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersTransformingMeth2 = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersTransformingWeed2 = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersTransformingOpium2= {}
local PlayersSellingOpium      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local kiloQuantity = xPlayer.getInventoryItem('coke_kilo').count

			if kiloQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_kilos'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_kilo', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function TransformCoke2(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke2[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('coke_kilo').count
			local bagQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if kiloQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_coke_cut'))
			elseif bagQuantity < 179 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			else
				xPlayer.removeInventoryItem('coke_kilo', 1)
				xPlayer.addInventoryItem('coke_pooch', 5)
			
				TransformCoke2(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke2')
AddEventHandler('esx_drugs:startTransformCoke2', function()

	local _source = source

	PlayersTransformingCoke2[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke2')
AddEventHandler('esx_drugs:stopTransformCoke2', function()

	local _source = source

	PlayersTransformingCoke2[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('coke_kilo').count

			if kiloQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_kilos_sale'))
			else
				xPlayer.removeInventoryItem('coke_kilo', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 275)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 575)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local kiloQuantity = xPlayer.getInventoryItem('meth_kilo').count

			if kiloQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_kilos'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_kilo', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)
local function TransformMeth2(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth2[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('meth_kilo').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 179 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif kiloQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth_cut'))
			else
				xPlayer.removeInventoryItem('meth_kilo', 1)
				xPlayer.addInventoryItem('meth_pooch', 5)
				
				TransformMeth2(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth2')
AddEventHandler('esx_drugs:startTransformMeth2', function()

	local _source = source

	PlayersTransformingMeth2[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth2(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth2')
AddEventHandler('esx_drugs:stopTransformMeth2', function()

	local _source = source

	PlayersTransformingMeth2[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('meth_kilo').count

			if kiloQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_kilos_sale'))
			else
				xPlayer.removeInventoryItem('meth_kilo', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 375)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 525)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('black_money', 675)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected >= 6 then
					xPlayer.addAccountMoney('black_money', 750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local kiloQuantity = xPlayer.getInventoryItem('weed_kilo').count

			if kiloQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_kilos'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_kilo', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)
local function TransformWeed2(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed2[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local kiloQuantity = xPlayer.getInventoryItem('weed_kilo').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 179 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif kiloQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed_cut'))
			else
				xPlayer.removeInventoryItem('weed_kilo', 1)
				xPlayer.addInventoryItem('weed_pooch', 5)
				
				TransformWeed2(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed2')
AddEventHandler('esx_drugs:startTransformWeed2', function()

	local _source = source

	PlayersTransformingWeed2[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed2(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed2')
AddEventHandler('esx_drugs:stopTransformWeed2', function()

	local _source = source

	PlayersTransformingWeed2[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('weed_kilo').count

			if kiloQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_kilos_sale'))
			else
				xPlayer.removeInventoryItem('weed_kilo', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 150)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local kiloQuantity = xPlayer.getInventoryItem('opium_kilo').count

			if kiloQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_kilos'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_kilo', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)local function TransformOpium2(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('opium_kilo').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 179 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif kiloQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_kilos'))
			else
				xPlayer.removeInventoryItem('opium_kilo', 1)
				xPlayer.addInventoryItem('opium_pooch', 5)
			
				TransformOpium2(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium2')
AddEventHandler('esx_drugs:startTransformOpium2', function()

	local _source = source

	PlayersTransformingOpium2[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpium2')
AddEventHandler('esx_drugs:stopTransformOpium2', function()

	local _source = source

	PlayersTransformingOpium2[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local kiloQuantity = xPlayer.getInventoryItem('opium_kilo').count

			if kiloQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_kilos_sale'))
			else
				xPlayer.removeInventoryItem('opium_kilo', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 375)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 525)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 675)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_kilo').count,
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_kilo').count,
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_kilo').count,
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_kilo').count,
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
	)
end)

ESX.RegisterUsableItem('weed', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)
