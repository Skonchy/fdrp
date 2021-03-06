require "resources/essentialmode/lib/MySQL"
--MySQL:open("IP", "databasname", "user", "password") 

allZone = {}
ceiledAllTables = {}

AddEventHandler("onResourceStart", function(resource)
	if resource == "iZone" then
		local exec = MySQL:executeQuery("SELECT * FROM zone")
		local results = MySQL:getResults(exec, {'nom', 'coords', 'gravityCenter', 'longestDistance'})
		if results[1] ~= nil then
				for i = 1, #results do
					table.insert(allZone,
						{nom = results[i].nom, 
						coords = json.decode(results[i].coords),
						gravityCenter = json.decode(results[i].gravityCenter), 
						longestDistance = results[i].longestDistance}
					)
				end
				TriggerClientEvent("izone:transfertzones", -1, allZone)
		end
	end

end)

AddEventHandler('es:playerLoaded', function(source) 
	TriggerClientEvent("izone:transfertzones", source, allZone)
end)

RegisterServerEvent("givemezone")
AddEventHandler('givemezone', function() 
	TriggerClientEvent("izone:transfertzones", source, allZone)
end)

TriggerEvent('es:addCommand', 'izone', function(source, args, user)


	if user.permission_level <= 3 then
		TriggerClientEvent("izone:notification", source, "Tu n'as pas la permision de faire cela", false)
		CancelEvent()
	else
		if args[2] ~= "start" and args[2] ~= "stop" then
			TriggerClientEvent("izone:notification", source, "Utilisation : /izone start ou /izone stop", false)
			CancelEvent()
		else
			if args[2] == "start" then
				TriggerClientEvent("izone:notification", source, "Tu peux ajouter des points avec la touche [L], /mazone stop pour finir", true)
				TriggerClientEvent("izone:okforpoint", source)
				user:setSessionVar("zone", {})
			end

			if args[2] == "stop" then
				points = user:getSessionVar("zone")
				if points == nil then
					TriggerClientEvent("izone:notification", source, "Tu as stoppé l'ajout de point mais tu n'avais pas enregistré de points ou initialisé avec /mazone start", false)
					user:setSessionVar("zone", nil)
				else
					TriggerClientEvent("izone:notification", source, "Ton/Tes points sont sauvegardé avec le nom que tu vas entrer.", true)
					TriggerClientEvent("izone:askforname", source)
				end
			end
		end
	end

end)

TriggerEvent('es:addCommand', 'tptc', function(source, args, user)
	if user.permission_level <= 3 then
		TriggerClientEvent("izone:notification", source, "Tu n'as pas la permision de faire cela", false)
		CancelEvent()
	else
		if #args == 4 then
			TriggerClientEvent("izone:notification", source, "TP ok", true)
			TriggerClientEvent("izone:tptc", source, tonumber(args[2]), tonumber(args[3]), tonumber(args[4]))
		else
			TriggerClientEvent("izone:notification", source, "3 arguments necessaires", false)
		end

	end
end)

RegisterServerEvent("izone:addpoint")
AddEventHandler("izone:addpoint", function(xs, ys, zs)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local zone = {x = xs, y = ys, z = zs}
		local actualUserZone = user:getSessionVar("zone")
		table.insert(actualUserZone, zone)
		user:setSessionVar("zone", actualUserZone)
	end)
end)

RegisterServerEvent("izone:savedb")
AddEventHandler("izone:savedb", function(name)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local userPoints = user:getSessionVar("zone")
		---------------- PARTIE CENTRE DE GRAVITE -------------------------
		local xr, yr = CalculGravityCenter(userPoints)
		local resultArray = { x = math.ceil(xr*100)/100, y = math.ceil(yr*100)/100}
		local resultArrayEncoded = json.encode(resultArray)
		--------------------------------------------------------------------
		---------------- RECHERCHE DE LA PLUS LONGUE DISTANCE --------------
		local maxDist = CalculLongest(resultArray, userPoints)
		local maxDistCeiled = math.ceil((maxDist*100)/100) + 0.01
		--------------------------------------------------------------------
		local namet = name
		---------------- ADOUCISSEMENT DES VALEURS -------------------------
		local ceiledMaxDist = (math.ceil(maxDist*100)/100) + 0.01 -- +0.01 to prevent the almost InZone
		local ceiledUserPoints = TableCut(userPoints, 100)
		--------------------------------------------------------------------

		---------------- Json Encode pour le mettre dans la db--------------
		local encodedCeiledUserPoints = json.encode(ceiledUserPoints)
		--------------------------------------------------------------------
		MySQL:executeQuery("INSERT INTO zone (`nom`, `coords`, `gravityCenter`, `longestDistance`) VALUES ('@nom', '@coords', '@gravityCenter', '@longestDistance')",
                                            {['@nom'] = namet, ['@coords'] = encodedCeiledUserPoints, ['@gravityCenter'] = resultArrayEncoded, ['@longestDistance'] = maxDistCeiled})
	end)			
end)

RegisterServerEvent("izone:debug")
AddEventHandler("izone:debug", function()
	TriggerClientEvent("izone:senddebug", source, allZone)
end)
function PrintArray(table)
	for k,v in pairs(table) do print(k,v) end
end

function CalculGravityCenter(table)
	local allX = 0
	local allY = 0
	for i=1, #table do
		allX = allX + tonumber(table[i].x)
		allY = allY + tonumber(table[i].y)
	end
	local resultX = allX / #table
	local resultY = allY / #table
	return resultX, resultY
end

function CalculLongest(center, zone)
	local listDist = { }
	for i=1, #zone do
		table.insert(listDist, DistanceFrom(tonumber(center.x), tonumber(center.y), tonumber(zone[i].x), tonumber(zone[i].y)))
	end
	return MaximumNumber(listDist)
end

function MaximumNumber(table)
	local max = 0
	for i=1, #table do
		if table[i] > max then max = table[i] end
	end
	return max
end

function DistanceFrom(x1,y1,x2,y2) 
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2) 
end

function TableCut(tabler, precision) -- 100 precision will means 0.01 (1/100)
	local newTable = {}

	for i=1, #tabler do
	table.insert(newTable, {
				x = math.ceil(tonumber(tabler[i].x)*precision)/precision,
				y = math.ceil(tonumber(tabler[i].y)*precision)/precision,
				z = math.ceil(tonumber(tabler[i].z)*precision)/precision
				})
	end
	return newTable
end