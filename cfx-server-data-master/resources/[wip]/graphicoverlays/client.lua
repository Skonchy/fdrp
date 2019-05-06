TriggerEvent('glrp_overlays:failrp', true, target)
TriggerEvent('glrp_overlays:help', true)

RegisterNetEvent('glrp_overlays:failrp')
AddEventHandler('glrp_overlays:failrp', function(value, target)
	SendNUIMessage({
		type = "failrp",
		display = value
	})
end)

RegisterNetEvent('glrp_overlays:help')
AddEventHandler('glrp_overlays:help', function(value)
	SendNUIMessage({
		type = "help",
		display = value
	})
end)

Citizen.CreateThread(function()
	if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('disclaimer:display', false)
    end
end)