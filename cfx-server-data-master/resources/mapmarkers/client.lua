-----------blips--------------
Citizen.CreateThread(function()
                                                               
local sasp = AddBlipForCoord(820.92, -1321.17, 26.08)
	SetBlipSprite (sasp, 60)
	SetBlipDisplay(sasp, 4)
	SetBlipScale  (sasp, 1.2)
	SetBlipColour (sasp, 0)
	SetBlipAsShortRange(sasp, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("S.A.S.P")
	EndTextCommandSetBlipName(sasp)
end)

Citizen.CreateThread(function()
                                                               
local bcso = AddBlipForCoord(1854.511, 3686.7067, 43.26)
	SetBlipSprite (bcso, 60)
	SetBlipDisplay(bcso, 4)
	SetBlipScale  (bcso, 1.2)
	SetBlipColour (bcso, 5)
	SetBlipAsShortRange(bcso, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("B.C.S.O")
	EndTextCommandSetBlipName(bcso)
end)

Citizen.CreateThread(function()
                                                               
local paleto = AddBlipForCoord(-437.664, 6022.0068, 31.49)
	SetBlipSprite (paleto, 60)
	SetBlipDisplay(paleto, 4)
	SetBlipScale  (paleto, 1.2)
	SetBlipColour (paleto, 5)
	SetBlipAsShortRange(paleto, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("B.C.S.O")
	EndTextCommandSetBlipName(paleto)
end)