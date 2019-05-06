local function golfBlip()
  local GolfCoords = AddBlipForCoord(-1371.05, 56.0996, 51.700)
  SetBlipSprite(GolfCoords, 109)
  SetBlipAsShortRange(GolfCoords, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Golf")
  EndTextCommandSetBlipName(GolfCoords)
end


local function ShowGolfMarker()
  DrawMarker(1, -1371.05, 56.0996, 51.700, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 0, 115, 255, 200, 0, true, 2, 0, 0, 0, false)
end

local function CreateGolfCar()
  RequestModel(GetHashKey("caddy"))
  while not HasModelLoaded(GetHashKey("caddy")) do
   Wait(0)
  end

   golfVehicle = CreateVehicle(GetHashKey("caddy"), -1329.006, 57.752, 53.548, 286.120-1.0001, true, false)
end

Citizen.CreateThread(function()
golfBlip()
  while true do
    Wait(0)

    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed, true)
    -- Check if the player is near the golf course entrance
    if Vdist2(playerCoords, -1371.05, 56.0996, 51.700) < 30.0 then
      ShowGolfMarker()
      TriggerEvent("fs_core:displayHelp", "Press ~INPUT_CONTEXT~ to play golf")
      if IsControlJustPressed(0, 38) then
        if not IsIplActive("GolfFlags") then
          -- Load the required IPL
          RequestIpl("GolfFlags")
          RequestAnimSet("move_m@golfer@")
          while not HasAnimSetLoaded("move_m@golfer@") do
            Wait(0)
          end

          SetEntityCoords(playerPed, -1326.967, 62.4055, 52.5295)
          SetEntityHeading(playerPed, 170.3523)
          --SetPedMovementClipset(playerPed, "move_m@golfer@", "walk", 1.0)

          CreateGolfCar()
          TaskEnterVehicle(playerPed, golfVehicle, -1, -1, 1.0, 1, 0)
        end
      end
    end

  end
end)
