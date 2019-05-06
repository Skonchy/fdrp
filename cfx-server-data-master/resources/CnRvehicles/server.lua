ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local prices = {
{id = 0, price = 360}, --compacts
{id = 1, price = 400}, --sedans
{id = 2, price = 520}, --SUV's
{id = 3, price = 640}, --coupes
{id = 4, price = 500}, --muscle
{id = 5, price = 650}, --sport classic
{id = 6, price = 720}, --sport
{id = 7, price = 1100}, --super
{id = 8, price = 220}, --motorcycle
{id = 9, price = 380}, --offroad
{id = 10, price = 400}, --industrial
{id = 11, price = 340}, --utility
{id = 12, price = 340}, --vans
{id = 13, price = 40}, --bicycles
{id = 14, price = 200}, --boats
{id = 15, price = 820}, --helicopter
{id = 16, price = 900}, --plane
{id = 17, price = 290}, --service
{id = 18, price = 500}, --emergency
{id = 19, price = 620}, --military
{id = 20, price = 340} --commercial
}

RegisterServerEvent("getVehPrice")
AddEventHandler("getVehPrice", function(class)
	for k, price in pairs(prices) do
		if class == price.id then
			vehPrice = price.price
			TriggerClientEvent("setVehPrice", -1, vehPrice)
		end
	end
end)

RegisterServerEvent("sellVehicle")
AddEventHandler("sellVehicle", function(vehPrice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addAccountMoney('black_money', vehPrice)
	CancelEvent()
end)

-- RegisterServerEvent("sellVehicle")
-- AddEventHandler("sellVehicle", function(vehPrice)
	-- TriggerEvent("es:getPlayerFromId", source, function(user)
		-- user.addMoney(vehPrice)
		-- CancelEvent()
	-- end)
-- end)

RegisterServerEvent("resetMoney")
AddEventHandler("resetMoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.setMoney(0)
	end)
end)

RegisterServerEvent("turnoffengine")
AddEventHandler("turnoffengine", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
	SetVehicleEngineOn(xPlayer, false, true, false)
	-- body
end)
