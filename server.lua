ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Chasse:depece')
AddEventHandler('Chasse:depece', function(animal)
    local xPlayer = ESX.GetPlayerFromId(source)

    if animal == 1462895032 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de chat' } )
        xPlayer.addInventoryItem('MeatCat', math.random(Config.MeatCat.nbParAnimalMin , Config.MeatCat.nbParAnimalMax))
    elseif animal == 351016938 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Grand Rottweiler' } )
        xPlayer.addInventoryItem('MeatLDog', math.random(Config.MeatLDog.nbParAnimalMin , Config.MeatLDog.nbParAnimalMax))
    elseif animal == -1384627013 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Grand Rottweiler' } )
        xPlayer.addInventoryItem('MeatWestie', math.random(Config.MeatWestie.nbParAnimalMin , Config.MeatWestie.nbParAnimalMax))
    elseif animal == 1125994524 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Caniche' } )
        xPlayer.addInventoryItem('MeatCaniche', math.random(Config.MeatCaniche.nbParAnimalMin , Config.MeatCaniche.nbParAnimalMax))
    elseif animal == 882848737 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Golden Retriever' } )
        xPlayer.addInventoryItem('MeatGR', math.random(Config.MeatGR.nbParAnimalMin , Config.MeatGR.nbParAnimalMax))
    elseif animal == -1788665315 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Rottweiler' } )
        xPlayer.addInventoryItem('MeatRott', math.random(Config.MeatRott.nbParAnimalMin , Config.MeatRott.nbParAnimalMax))
    elseif animal == 1126154828 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Shepherd' } )
        xPlayer.addInventoryItem('MeatShep', math.random(Config.MeatShep.nbParAnimalMin , Config.MeatShep.nbParAnimalMax))
    elseif animal == 1318032802 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Husky' } )
        xPlayer.addInventoryItem('MeatHusky', math.random(Config.MeatHusky.nbParAnimalMin , Config.MeatHusky.nbParAnimalMax))
    elseif animal == 1832265812 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Carlin' } )
        xPlayer.addInventoryItem('MeatCarlin', math.random(Config.MeatCarlin.nbParAnimalMin , Config.MeatCarlin.nbParAnimalMax))
    elseif animal == -832573324 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Border Collie' } )
        xPlayer.addInventoryItem('MeatBC', math.random(Config.MeatBC.nbParAnimalMin , Config.MeatBC.nbParAnimalMax))
    elseif animal == -50684386 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Vache' } )
        xPlayer.addInventoryItem('MeatCow', math.random(Config.MeatCow.nbParAnimalMin , Config.MeatCow.nbParAnimalMax))
    elseif animal == -541762431 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Lapin' } )
        xPlayer.addInventoryItem('MeatRabbit', math.random(Config.MeatRabbit.nbParAnimalMin , Config.MeatRabbit.nbParAnimalMax))
    elseif animal == 307287994 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Puma' } )
        xPlayer.addInventoryItem('MeatPuma', math.random(Config.MeatPuma.nbParAnimalMin , Config.MeatPuma.nbParAnimalMax))
    elseif animal == 1794449327 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Volaille' } )
        xPlayer.addInventoryItem('MeatChicken', math.random(Config.MeatChicken.nbParAnimalMin , Config.MeatChicken.nbParAnimalMax))
    elseif animal == -664053099 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as choppé de la viande de Cerf' } )
        xPlayer.addInventoryItem('MeatCerf', math.random(Config.MeatCerf.nbParAnimalMin , Config.MeatCerf.nbParAnimalMax))
    end
end)

RegisterNetEvent("Vente:Chat")
AddEventHandler("Vente:Chat", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatCat').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatCat').count > 0 then
                xPlayer.removeInventoryItem('MeatCat', item)              
                xPlayer.addMoney(math.random(Config.MeatCat.PrixMin, Config.MeatCat.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatCat').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:GR")
AddEventHandler("Vente:GR", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatLDog').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatLDog').count > 0 then
                xPlayer.removeInventoryItem('MeatLDog', item)              
                xPlayer.addMoney(math.random(Config.MeatLDog.PrixMin, Config.MeatLDog.PrixMax), count)  
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatLDog').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Westie")
AddEventHandler("Vente:Westie", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatWestie').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatWestie').count > 0 then
                xPlayer.removeInventoryItem('MeatWestie', item)              
                xPlayer.addMoney(math.random(Config.MeatWestie.PrixMin, Config.MeatWestie.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatWestie').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Caniche")
AddEventHandler("Vente:Caniche", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatCaniche').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatCaniche').count > 0 then
                xPlayer.removeInventoryItem('MeatCaniche', item)              
                xPlayer.addMoney(math.random(Config.MeatCaniche.PrixMin, Config.MeatCaniche.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatCaniche').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Golden")
AddEventHandler("Vente:Golden", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatGR').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatGR').count > 0 then
                xPlayer.removeInventoryItem('MeatGR', item)              
                xPlayer.addMoney(math.random(Config.MeatGR.PrixMin, Config.MeatGR.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatGR').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Rott")
AddEventHandler("Vente:Rott", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatRott').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatRott').count > 0 then
                xPlayer.removeInventoryItem('MeatRott', item)              
                xPlayer.addMoney(math.random(Config.MeatRott.PrixMin, Config.MeatRott.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatRott').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Shepherd")
AddEventHandler("Vente:Shepherd", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatShep').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatShep').count > 0 then
                xPlayer.removeInventoryItem('MeatShep', item)              
                xPlayer.addMoney(math.random(Config.MeatShep.PrixMin, Config.MeatShep.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatShep').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Husky")
AddEventHandler("Vente:Husky", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatHusky').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatHusky').count > 0 then
                xPlayer.removeInventoryItem('MeatHusky', item)              
                xPlayer.addMoney(math.random(Config.MeatHusky.PrixMin, Config.MeatHusky.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatHusky').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Cerf")
AddEventHandler("Vente:Cerf", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatCerf').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatCerf').count > 0 then
                xPlayer.removeInventoryItem('MeatCerf', item)              
                xPlayer.addMoney(math.random(Config.MeatCerf.PrixMin, Config.MeatCerf.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatCerf').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Carlin")
AddEventHandler("Vente:Carlin", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatCarlin').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatCarlin').count > 0 then
                xPlayer.removeInventoryItem('MeatCarlin', item)              
                xPlayer.addMoney(math.random(Config.MeatCarlin.PrixMin, Config.MeatCarlin.PrixMax), count)  
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatCarlin').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Border")
AddEventHandler("Vente:Border", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatBC').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatBC').count > 0 then
                xPlayer.removeInventoryItem('MeatBC', item)              
                xPlayer.addMoney(math.random(Config.MeatBC.PrixMin, Config.MeatBC.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatBC').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Vache")
AddEventHandler("Vente:Vache", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatCow').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatCow').count > 0 then
                xPlayer.removeInventoryItem('MeatCow', item)              
                xPlayer.addMoney(math.random(Config.MeatCow.PrixMin, Config.MeatCow.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatCow').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Lapin")
AddEventHandler("Vente:Lapin", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatRabbit').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatRabbit').count > 0 then
                xPlayer.removeInventoryItem('MeatRabbit', item)              
                xPlayer.addMoney(math.random(Config.MeatRabbit.PrixMin, Config.MeatRabbit.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatRabbit').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Puma")
AddEventHandler("Vente:Puma", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatPuma').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatPuma').count > 0 then
                xPlayer.removeInventoryItem('MeatPuma', item)              
                xPlayer.addMoney(math.random(Config.MeatPuma.PrixMin, Config.MeatPuma.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatPuma').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)
RegisterNetEvent("Vente:Volaille")
AddEventHandler("Vente:Volaille", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('MeatChicken').count 
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('MeatChicken').count > 0 then
                xPlayer.removeInventoryItem('MeatChicken', item)              
                xPlayer.addMoney(math.random(Config.MeatChicken.PrixMin, Config.MeatChicken.PrixMax), count) 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Tu as vendu toute la viande' } )
            elseif xPlayer.getInventoryItem('MeatChicken').count < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Tu n\'as plus de viande' } )
            end
        end
    end)

