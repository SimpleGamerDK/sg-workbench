ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

function HasWorkBench()
    local hasWorkBench = true
    CreateThread(function()
        while hasWorkBench do
            Wait(0)
            -- If they press E drop the fucking bag
            if IsControlJustReleased(0,38) then
                hasWorkBench = false
                dropWorkBench()
                Citizen.Wait(1000)
            end
        end
    end)
end

function dropWorkBench()
    DetachEntity(workBench)
    PlaceObjectOnGroundProperly(workBench)
end

Citizen.CreateThread(function()
    local suitcase = {Config.Prop}

        exports['qtarget']:AddTargetModel(suitcase, {
            options = {
                {
                    event = "sg-workbench:pickUpWorkBench", 
                    icon = "fas fa-hand-paper",
                    label = Config.PickupBTN,
                },
                {
                    event = "sg-workbench:workBench",
                    icon = "fas fa-hand-paper",
                    label = Config.OpenBTN,
                },  
            },
            distance = 1.5
        })		
end)

RegisterNetEvent('sg-workbench:pickUpWorkBench',function()
    local pedCoords = GetEntityCoords(PlayerPedId())
    local closestObject = GetClosestObjectOfType(pedCoords, 3.0, GetHashKey(Config.Prop), false)
    local objCoords = GetEntityCoords(closestObject)
    DeleteEntity(closestObject)
	TriggerServerEvent('sg-workbench:getItemForWorkBench', Config.Item)
    TriggerServerEvent("sg-workbench:deleteWorkBench", ObjToNet(closestObject))
end)

RegisterNetEvent('sg-workbench:deleteWorkBench', function(netId)
    if DoesEntityExist(NetToObj(netId)) then
        DeleteObject(NetToObj(netId))
    end   
end)

RegisterNetEvent('sg-workbench:useWorkBench',function()
    local hash = GetHashKey(Config.Prop)
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,3.0,0.5))
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(0) end
    workBench = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(workBench, ped, GetPedBoneIndex(ped, 57005), 0.42, 0, -0.05, 0.10, 270.0, 60.0, true, true, false, true, 1, true)
    iHasDaBag()
end)

RegisterNetEvent('sg-workbench:workBench')
AddEventHandler('sg-workbench:workBench',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    TriggerEvent("inventory:openCrafting", Config.WorkbenchBTN, Config.Workbench.items)
end)