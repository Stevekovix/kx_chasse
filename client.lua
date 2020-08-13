ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    Blips()
    NPCs()
end)

function Blips()
    local blip = AddBlipForCoord(Config.Boucherie.Pos.x, Config.Boucherie.Pos.y, Config.Boucherie.Pos.z)
    SetBlipSprite(blip, 141)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Boucherie.BlipName)
    EndTextCommandSetBlipName(blip)
    if Config.Chinois.Blip then
        local blip = AddBlipForCoord(Config.Chinois.Pos.x, Config.Chinois.Pos.y, Config.Chinois.Pos.z)
        SetBlipSprite(blip, 141)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Chinois.BlipName)
        EndTextCommandSetBlipName(blip)
    end
end

function NPCs()
    RequestModel(GetHashKey(Config.Boucherie.NPCmodel))
    while not HasModelLoaded(GetHashKey(Config.Boucherie.NPCmodel)) do
        Citizen.Wait(10)
    end
    npc = CreatePed(5, Config.Boucherie.NPCmodel, Config.Boucherie.Pos.x, Config.Boucherie.Pos.y, Config.Boucherie.Pos.z, Config.Boucherie.Pos.h, false, false)
    SetPedFleeAttributes(npc, 0, 0)
    SetPedComponentVariation(npc, 11, 1, 1, 2)
    SetPedDropsWeaponsWhenDead(npc, false)
    SetPedDiesWhenInjured(npc, false)
    SetEntityInvincible(npc , true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    
    RequestModel(GetHashKey(Config.Chinois.NPCmodel))
    while not HasModelLoaded(GetHashKey(Config.Chinois.NPCmodel)) do
        Citizen.Wait(10)
    end
    npc = CreatePed(5, Config.Chinois.NPCmodel, Config.Chinois.Pos.x, Config.Chinois.Pos.y, Config.Chinois.Pos.z, Config.Chinois.Pos.h, false, false)
    SetPedFleeAttributes(npc, 0, 0)
    SetPedComponentVariation(npc, 11, 1, 1, 2)
    SetPedDropsWeaponsWhenDead(npc, false)
    SetPedDiesWhenInjured(npc, false)
    SetEntityInvincible(npc , true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end

Citizen.CreateThread(function()
    
    while true do
        Wait(1)
        local player = GetPlayerPed(-1)
        local pid = PlayerPedId()
        local playerloc = GetEntityCoords(player, 0)
        local handle, ped = FindFirstPed()
        local success
      
            local distance = GetDistanceBetweenCoords(Config.Boucherie.Pos.x, Config.Boucherie.Pos.y, Config.Boucherie.Pos.z , playerloc['x'], playerloc['y'], playerloc['z'], true)
                if distance <= 2.5 then
                    ESX.ShowHelpNotification("~INPUT_CONTEXT~ Vendre la viande")
                    if IsControlJustReleased(1, 51) then
                    Boucherie()
                    end
                end
            local distance = GetDistanceBetweenCoords(Config.Chinois.Pos.x, Config.Chinois.Pos.y, Config.Chinois.Pos.z , playerloc['x'], playerloc['y'], playerloc['z'], true)
                if distance <= 2.5 then
                    ESX.ShowHelpNotification("~INPUT_CONTEXT~ Vendre la viande")
                    if IsControlJustReleased(1, 51) then
                        Boucherie()
                        end
                end
                
------------------------------------------------------                
        repeat
            success, ped = FindNextPed(handle)
            local pos = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
                if DoesEntityExist(ped) and GetEntityHealth(ped) < 1 and IsPedInAnyVehicle(ped) == false then
                    local pedType = GetPedType(ped)
                    if  pedType == 28 and IsPedAPlayer(ped) == false then
                        if distance <= 1.5 and ped  ~= GetPlayerPed(-1) and ped ~= oldped and ped ~= oldped2 then
                            local valid, legal = IsAnimalLegal(ped)
                                ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour dépecer l'animal")
                                if IsControlJustPressed(1, 38) then --E
                                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_KNIFE") then
                                        oldped2 = oldped
                                        oldped = ped
                                        TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
                                        Citizen.Wait(8000)
                                        ClearPedTasksImmediately(GetPlayerPed(-1)) 
                                        print (GetEntityModel(ped))
                                        print(pedType)
                                        print(ped)
                                        local animal = GetEntityModel(ped)
                                        print (animal)
                                        TriggerServerEvent('Chasse:depece', animal)
                                    else
                                        ESX.ShowNotification("Il me faut un couteau pour récupérer la viande")
                                    end
                                end
                        end
                    end
                end
            end
        until not success
      

        EndFindPed(handle)
    end    
end)


function IsAnimalLegal(ped)
    if GetHashKey("a_c_cat_01") == GetEntityModel(ped) then
        animal = "a_c_cat_01"
    elseif GetHashKey("a_c_chop") == GetEntityModel(ped) then
        animal = "a_c_chop"
    elseif GetHashKey("a_c_westy") == GetEntityModel(ped) then
        animal = "a_c_westy"
    elseif GetHashKey("a_c_poodle") == GetEntityModel(ped) then
        animal = "a_c_poodle"
    elseif GetHashKey("a_c_retriever") == GetEntityModel(ped) then
        animal = "a_c_retriever"
    elseif GetHashKey("a_c_rottweiler") == GetEntityModel(ped) then
        animal = "a_c_rottweiler"
    elseif GetHashKey("a_c_shepherd") == GetEntityModel(ped) then
        animal = "a_c_shepherd"
    elseif GetHashKey("a_c_husky") == GetEntityModel(ped) then
        animal = "a_c_husky"
    elseif GetHashKey("a_c_pug") == GetEntityModel(ped) then
        animal = "a_c_pug"
    elseif GetHashKey("a_c_boar") == GetEntityModel(ped) then
        animal = "a_c_boar"
    elseif GetHashKey("a_c_cow") == GetEntityModel(ped) then
        animal = "a_c_cow"
    elseif GetHashKey("a_c_rabbit_01") == GetEntityModel(ped) then
        animal = "a_c_rabbit_01"
    elseif GetHashKey("a_c_mtlion") == GetEntityModel(ped) then
        animal = "a_c_mtlion"
    elseif GetHashKey("a_c_hen") == GetEntityModel(ped) then
        animal = "a_c_hen"
    elseif GetHashKey("a_c_deer") == GetEntityModel(ped) then
        animal = "a_c_deer"
    end
end


function Boucherie()
    local elements = {
        {label = 'Vente Viande de Chat ' ,   value = 'Chat'},
        {label = 'Vente Viande de Grand Rottweiler' ,      value = 'GR'},
        {label = 'Vente Viande de Westie' ,       value = 'Westie'},
        {label = 'Vente Viande de Caniche' ,       value = 'Caniche'},
        {label = 'Vente Viande de Golden Retriever' ,       value = 'Golden'},
        {label = 'Vente Viande de Rottweiler' ,      value = 'Rott'},
        {label = 'Vente Viande de Shepherd' ,       value = 'Shepherd'},
        {label = 'Vente Viande de Husky' ,       value = 'Husky'},
        {label = 'Vente Viande de Carlin' ,       value = 'Carlin'},
        {label = 'Vente Viande de Border Collie' ,      value = 'Border'},
        {label = 'Vente Viande de Vache' ,       value = 'Vache'},
        {label = 'Vente Viande de Lapin' ,       value = 'Lapin'},
        {label = 'Vente Viande de Puma' ,       value = 'Puma'},
        {label = 'Vente Viande de Volaille' ,      value = 'Volaille'},
        {label = 'Vente Viande de Cerf' ,       value = 'Cerf'},
        {label = 'Fermer' ,       value = 'close'},

    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Boucherie', {
        title    = ' Vente de viande ',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'Chat' then
            TriggerServerEvent("Vente:Chat")
            menu.close()
        elseif data.current.value == 'GR' then
            TriggerServerEvent("Vente:GR")
            menu.close()
        elseif data.current.value == 'Westie' then
            TriggerServerEvent("Vente:Westie")
            menu.close()
        elseif data.current.value == 'Caniche' then
            TriggerServerEvent("Vente:Caniche")
            menu.close()
        elseif data.current.value == 'Golden' then
            TriggerServerEvent("Vente:Golden")
            menu.close()
        elseif data.current.value == 'Rott' then
            TriggerServerEvent("Vente:Rott")
            menu.close()
        elseif data.current.value == 'Shepherd' then
            TriggerServerEvent("Vente:Shepherd")
            menu.close()
        elseif data.current.value == 'Husky' then
            TriggerServerEvent("Vente:Husky")
            menu.close()
        elseif data.current.value == 'Carlin' then
            TriggerServerEvent("Vente:Carlin")
            menu.close()
        elseif data.current.value == 'Border' then
            TriggerServerEvent("Vente:Border")
            menu.close()
        elseif data.current.value == 'Vache' then
            TriggerServerEvent("Vente:Vache")
            menu.close()
        elseif data.current.value == 'Lapin' then
            TriggerServerEvent("Vente:Lapin")
            menu.close()
        elseif data.current.value == 'Puma' then
            TriggerServerEvent("Vente:Puma")
            menu.close()
        elseif data.current.value == 'Volaille' then
            TriggerServerEvent("Vente:Volaille")
            menu.close()
        elseif data.current.value == 'Cerf' then
            TriggerServerEvent("Vente:Cerf")
            menu.close()
        elseif data.current.value == 'close' then
            menu.close()
        end
    end)
end