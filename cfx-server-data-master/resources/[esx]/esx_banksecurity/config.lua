Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 300
Config.Locale       = 'en'

Config.Trucks = {
	"stockade",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -1132.3878173828, y = -839.13195800781, z = 12.810056686401},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -1146.4929199219, y = -846.5400390625, z = 12.393614768982},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -1138.9125976563, y = -851.49285888672, z = 12.822299957275},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- fleeca
	Delivery1LS = {
			Pos   = {x = 152.41914367676, y = -1034.7471923828, z = 28.333967208862},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 40
		},
	-- fleeca2
	Delivery2LS = {
			Pos   = {x = -2973.0681152344, y = 481.41714477539, z = 14.25815486908},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	-- blainecounty
	Delivery3LS = {
			Pos   = {x = -115.31275177002, y = 6454.8017578125, z = 30.432558059692},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 40
		},
	-- PrincipalBank
	Delivery4LS = {
			Pos   = {x = 225.96255493164, y = 227.09648132324, z = 104.55316925049},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 60
		},
	-- route68e
	Delivery5LS = {
			Pos   = {x = 1175.1614990234, y = 2698.154296875, z = 36.991249084473},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 50
		},
	--littleseoul
	Delivery6LS = {
			Pos   = {x = -710.67095947266, y = -925.72772216797, z = 18.00968170166},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 20
		},
	--grovestreetgas
	Delivery7LS = {
			Pos   = {x = -54.223278045654, y = -1762.7810058594, z = 27.959566116333},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	--fleecacarpark
	Delivery8LS = {
			Pos   = {x = 135.49647521973, y = -1069.1541748047, z = 28.192060470581},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	--Mt Haan Dr Radio Tower
	Delivery9LS = {
			Pos   = {x = 739.69, y = 1292.34, z = 359.30},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 90
		},
	--Senora Way Fuel Depot
	Delivery10LS = {
			Pos   = {x = 2827.21, y = 1530.95, z = 22.57},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 20
		},
------------------------------------------- 2nd Patrol 
	-- Palomino Noose HQ
	Delivery1BC = {
			Pos   = {x = 2448.21, y = -398.78, z = 91.99},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	-- El Burro Oil plain
	Delivery2BC = {
			Pos   = {x = 1727.62, y = -1672.99, z = 111.59},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 60
		},
	-- Orchardville ave
	Delivery3BC = {
			Pos   = {x = 843.43, y = -2345.95, z = 29.33},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 20
		},
	-- Elysian Fields
	Delivery4BC = {
			Pos   = {x = 906.90, y = -2540.94, z = 27.31},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 60
		},
	-- Popular St
	Delivery5BC = {
			Pos   = {x = 734.85, y = -1949.37, z = 28.29},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 60
		},
	-- Carson Ave
	Delivery6BC = {
			Pos   = {x = 526.58, y = -1984.99, z = 23.79},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	-- Dutch London
	Delivery7BC = {
			Pos   = {x = 516.99, y = -2182.59, z = 4.99},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 30
		},
	-- Autopia Pkwy
	Delivery8BC = {
			Pos   = {x = 93.84, y = -2194.38, z = 5.04},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 20
		},
	-- Miriam Turner Overpass
	Delivery9BC = {
			Pos   = {x = -404.88, y = -2279.67, z = 6.61},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 40
		},
	-- Exceptionalist Way
	Delivery10BC = {
			Pos   = {x = -593.75, y = -2337.86, z = 12.83},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 10
		},
		
	RetourCamion = {
			Pos   = {x = -1116.6857910156, y = -855.294921875, z = 12.50327205658},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -1127.8812255859, y = -859.76025390625, z = 13.573114395142},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
