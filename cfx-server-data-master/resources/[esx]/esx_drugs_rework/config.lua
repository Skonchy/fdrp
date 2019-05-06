Config              = {}
Config.MarkerType   = -1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0}
--Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsWeed  = 1
Config.RequiredCopsOpium = 2

Config.TimeToFarm    = 10 * 1000
Config.TimeToProcess = 30 * 1000
Config.TimeToSell    = 5  * 1000

Config.Locale = 'en'

Config.Zones = {
	CokeField =			{x=-299.25958251953,  y=-2779.3576660156,  z=3.6500787734985},
	CokeProcessing =	{x=2328.8505859375,   y=2571.3657226563,   z=46.676956176758},
	CokeProcessing2 =	{x=111.4872,   y=-1304.1573,   z=28.5195}, -- Strip Club
	CokeDealer =		{x=-571.92596435547,  y=286.68148803711,   z=79.176666259766},
	MethField =			{x=646.34020996094,   y=-447.5758972168,   z=24.760646820068}, -- x=3559.83, y=3671.9, z=28.1219
	MethProcessing =	{x=2433.6403808594,   y=4968.7021484375,   z=42.347606658936},
	MethProcessing2 =	{x=1389.3856,   y=3604.56,   z=38.4419}, -- Chef Liquor Store
	MethDealer =		{x=29.005256652832,   y=3665.693359375,    z=40.440578460693},
	WeedField =			{x=2224.12, 		  y=5576.52,           z=52.8089},
	WeedProcessing =	{x=1452.83, 		  y=1135.77, 		   z=113.33}, 
	WeedProcessing2 =	{x=-10.0456, 		  y=-1439.356, 		   z=31.101}, -- Franklin's  House
	WeedDealer =		{x=-1172.29,          y=-1572.10,		    z=4.66},
	OpiumField =		{x=219.0329284668,	   y=6808.587890625,    z=23.24271774292},
	OpiumProcessing =	{x=3535.7395019531,  y=3663.4748535156,    z=28.121891021729},
	OpiumProcessing2 =	{x=-239.3014,  y=-1516.0911,    z=32.7812}, -- Community Center
	OpiumDealer =		{x=1015.6655883789,   y=-689.30969238281,  z=56.754295349121}
}