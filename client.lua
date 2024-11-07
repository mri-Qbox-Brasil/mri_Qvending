local emotePlaying = false

local function debugPrint(message)
    if Config.Debug then
        print("[DEBUG] " .. message)
    end
end

function playEmoteAndOpenInventory(emote, shopType, cancelEmote)
    emotePlaying = true
    exports.scully_emotemenu:playEmoteByCommand(emote, 0)
    Wait(1250)
    if cancelEmote then
        exports.scully_emotemenu:cancelEmote()
    end
    exports.ox_inventory:openInventory('shop', { type = shopType })
    Citizen.SetTimeout(2500, function()
        emotePlaying = false
    end)
end

function handleVendingMachine(machineType, emote, debugMessage)
    if not emotePlaying then
        playEmoteAndOpenInventory(emote, Config.VendingMachines[machineType].ShopType)
        debugPrint(debugMessage)
    end
end

local function addVendingMachineInteraction(machineType)
    local machineConfig = Config.VendingMachines[machineType]

    if machineConfig then
        debugPrint("Setting up interactions for: " .. machineType)
        for _, model in ipairs(machineConfig.Models) do
            local id = machineConfig.InteractionIDPrefix .. model
            local actionFunc = machineConfig.ActionFunction
            print(actionFunc[1], actionFunc[2])

            if Config.InteractOption == "ox" then
                exports.ox_target:addModel(model, {
                    {
                        name = id,
                        label = machineConfig.InteractionText,
                        icon = machineConfig.Icon,
                        onSelect = function() handleVendingMachine(actionFunc[1], actionFunc[2], "Using ox_target for model: " .. model) end,
                    }
                })
                debugPrint("Using ox_target for model: " .. model)
            elseif Config.InteractOption == "interact" then
                exports.interact:AddModelInteraction({
                    model = model,
                    name = 'vend_fridge_interaction',
                    id = id,
                    distance = 4.0,
                    interactDst = 2.0,
                    offset = machineConfig.Offset,
                    options = {
                        {
                            label = machineConfig.InteractionText,
                            action = function () handleVendingMachine(actionFunc[1], actionFunc[2], "Using interact for model: " .. model) end,
                        }
                    }
                })
                debugPrint("Using interact for model: " .. model)
            else
                debugPrint("Error: Invalid Config.InteractOption. Must be 'ox' or 'interaction'.")
            end
        end
    else
        debugPrint("Error: Vending machine type '" .. machineType .. "' not found.")
    end
end

local function startVendingMachines()
    for machineType, _ in pairs(Config.VendingMachines) do
        addVendingMachineInteraction(machineType)
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startVendingMachines()
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    startVendingMachines()
end)