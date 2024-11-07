local function registerShop()
    for i = 1, #Config.Shops do
        exports.ox_inventory:RegisterShop(Config.Shops[i].type, Config.Shops[i])
    end
end

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
       registerShop()
   end
end)

