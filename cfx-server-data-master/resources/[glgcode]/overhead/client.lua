local showPlayerBlips = false
local ignorePlayerNameDistance = false
local disPlayerNames = 12
local playerSource = 0
 
function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=SetDrawOrigin(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.1*scale, 0.30*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.40)
        SetTextColour(r, g, b, 175)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
		ClearDrawOrigin()
    end
end
 
Citizen.CreateThread(function()
    while true do
        for i=0,99 do
            N_0x31698aa80e0223f8(i)
        end
        for id = 0, 32 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped )
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
 
                if(ignorePlayerNameDistance) and HasEntityClearLosToEntity(GetPlayerPed(-1), GetPlayerPed(id), 17 ) then
                    if NetworkIsPlayerTalking( id ) then
                        DrawText3D(x2, y2, z2+1.5, GetPlayerServerId(id), 0,255,100)
						
					else
                        DrawText3D(x2, y2, z2+1.5, GetPlayerServerId(id), 0,100,255)
						
					end
                end
 
                if ((distance < disPlayerNames)) and HasEntityClearLosToEntity(GetPlayerPed(-1), GetPlayerPed(id), 17 )  then
                    if not (ignorePlayerNameDistance) then
					if NetworkIsPlayerTalking( id ) then
                        DrawText3D(x2, y2, z2+1.5, GetPlayerServerId(id), 0,255,100)
						
					else
                        DrawText3D(x2, y2, z2+1.5, GetPlayerServerId(id), 0,100,255)
						
					end
                    end
                end  
            end
        end
        Citizen.Wait(0)
		
    end
end)