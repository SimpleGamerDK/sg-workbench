ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sg-workbench:deleteWorkBench', function(netId)
    TriggerClientEvent("sg-workbench:deleteWorkBench", -1, netId)
end)

RegisterServerEvent('sg-workbench:getItemForWorkBench',function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count = xPlayer.getInventoryItem(item).count

	if count < 1 then 
		xPlayer.addInventoryItem(item,1)
	end
end)

ESX.RegisterUsableItem(Config.Item,function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(Config.Item,1)
	TriggerClientEvent('sg-workbench:useWorkBench',source)
end)