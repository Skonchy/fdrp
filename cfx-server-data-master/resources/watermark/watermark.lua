servername = "Facedesk Roleplay Dev Branch"
offset = {x = 0.005, y = 0.001}
rgb = {r = 0, g = 255, b = 100}
alpha = 175
scale = 0.5

Citizen.CreateThread(function()
	while true do
		Wait(1)

		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
        SetTextDropShadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(coord.x, coord.y)
		drawLevel

	end
end)
