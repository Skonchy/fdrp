-- Huge server file.

local interiors = {
	[1] = { ["xe"] = 456.877, ["ye"] = -1104.36, ["ze"] = 29.2022, ["he"] = 321.7075, ["xo"] = 457.18, ["yo"] = -1080.87, ["zo"] = 36.6287, ["ho"] = 234.62, ["name"] = 'State HQ'},
	[2] = { ["xe"] = 462.293, ["ye"] = -1009.5901, ["ze"] = 24.98427, ["he"] = 321.7075, ["xo"] = 399.874, ["yo"] = -999.371, ["zo"] = -99.004, ["ho"] = 234.62, ["name"] = 'Lineup'},
	[3] = { ["xe"] = 1712.17, ["ye"] = 2565.77, ["ze"] = 45.5649, ["he"] = 321.7075, ["xo"] = 1800.4, ["yo"] = 2482.96, ["zo"] = -122.69, ["ho"] = 234.62, ["name"] = 'CellBlock C32'},
	[4] = { ["xe"] = 1705.98, ["ye"] = 2581.3, ["ze"] = -69.4211, ["he"] = 321.7075, ["xo"] = 1845.88, ["yo"] = 2585.78, ["zo"] = 45.672, ["ho"] = 234.62, ["name"] = 'Visitation'},
	[5] = { ["xe"] = 1699.71, ["ye"] = 2575.25, ["ze"] = -69.4064, ["he"] = 321.7075, ["xo"] = 1775.2, ["yo"] = 2551.86, ["zo"] = 45.565, ["ho"] = 234.62, ["name"] = 'Visitation-prisoner'},
	[6] = { ["xe"] = 446.641, ["ye"] = -985.331, ["ze"] = 26.6742, ["he"] = 321.7075, ["xo"] = 392.766, ["yo"] = -950.236, ["zo"] = -63.4941, ["ho"] = 234.62, ["name"] = 'Dispatch'},
	--[] = { ["xe"] = 1854.30, ["ye"] = 3701.00, ["ze"] = 33.2660, ["he"] = 24.2292, ["xo"] = 1844.0, ["yo"] = 3660.034, ["zo"] = -116.789, ["ho"] = 300, ["name"] = 'SandyShores Interior'},
	[7] = { ["xe"] = -99.5888, ["ye"] = 6461.3588, ["ze"] = 31.6267, ["he"] = 45.9471, ["xo"] = -95.8629, ["yo"] = 6473.9736, ["zo"] = 31.4362, ["ho"] = 311.88, ["name"] = 'PaletoBank BackDoor'},
	[8] = { ["xe"] = 255.3645, ["ye"] = 228.9656, ["ze"] = 106.286, ["he"] = 159.488, ["xo"] = 278.005, ["yo"] = 266.4255, ["zo"] = 105.637, ["ho"] = 339.99, ["name"] = 'Alta street bank BackDoor'},
	[9] = { ["xe"] = -776.5343, ["ye"] = 318.3661, ["ze"] = 85.66258, ["he"] = 181.025344, ["xo"] = -785.14001, ["yo"] = 323.680, ["zo"] = 211.997, ["ho"] = 272.164550, ["name"] = 'Apartment'},		
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)
