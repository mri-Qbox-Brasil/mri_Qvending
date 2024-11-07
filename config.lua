Config = {}

Config.Debug = false  -- Enable or disable debug mode

-- Use 'ox' for ox_target or 'interact' for darktrovx interact
Config.InteractOption = "ox"

Config.VendingMachines = {
    Drinks = {
        Models = {
            'prop_vend_soda_01',  -- Drink machine model 1
            'prop_vend_soda_02',  -- Drink machine model 2
        },
        InteractionText = "Comprar Bebidas",
        InteractionIDPrefix = "unique_interaction_id_soda_",
        Offset = vec3(0.0, 0.0, 0.0),
        ActionFunction = {'Drinks', 'dispenser'},
        Icon = 'fa-solid fa-money-bill',  -- Icon for 'ox_target'
        ShopType = "VendingMachineDrinks",  -- Shop type to open - ox_inventory/data/shops.lua
    },
    Water = {
        Models = {
            'prop_vend_water_01',  -- Drink machine model 1
        },
        InteractionText = "Comprar Água",
        InteractionIDPrefix = "unique_interaction_id_soda_",
        Offset = vec3(0.0, 0.0, 0.0),
        ActionFunction = {'Water', 'dispenser'},
        Icon = 'fa-solid fa-money-bill',  -- Icon for 'ox_target'
        ShopType = "VendingMachineWater",  -- Shop type to open - ox_inventory/data/shops.lua
    },
    Donuts = {
        Models = {
            'v_ret_247_donuts',  -- Donut machine model
        },
        InteractionText = "Comprar Doces",
        InteractionIDPrefix = "unique_interaction_id_donut_",
        Offset = vec3(0.0, 0.0, 0.25),
        ActionFunction = {'Donuts', 'think3'},
        Icon = 'fa-solid fa-cookie-bite',  -- Icon for 'ox_target'
        ShopType = "VendingMachineDonuts",  -- Shop type to open - ox_inventory/data/shops.lua
    },
    Coffee = {
        Models = {
            'prop_vend_coffe_01',  -- Donut machine model
        },
        InteractionText = "Comprar Café",
        InteractionIDPrefix = "unique_interaction_id_coffee_",
        Offset = vec3(0.0, 0.0, 0.25),
        ActionFunction = {'Coffee', 'think3'},
        Icon = 'fa-solid fa-coffee',  -- Icon for 'ox_target'
        ShopType = "VendingMachineCoffe",  -- Shop type to open - ox_inventory/data/shops.lua
    }
    -- Add more vending machines below if needed
}

Config.Shops = {
    {
        type = 'VendingMachineDrinks',
        name = 'Máquina de Bebidas',
        inventory = {
            { name = 'cola', price = 10 },
            { name = 'sprunk', price = 10 },
        },
    },
    {
        type = 'VendingMachineWater',
        name = 'Máquina de Água',
        inventory = {
            { name = 'water', price = 10 },
        },
    },
    {
        type = 'VendingMachineDonuts',
        name = 'Máquina de Donuts',
        inventory = {
            { name = 'chocolate', price = 10 },
            { name = 'donuts', price = 10 },
        },
    },
    {
        type = 'VendingMachineCoffe',
        name = 'Máquina de Café',
        inventory = {
            { name = 'coffee', price = 10 },
        },
    }

}