fx_version 'cerulean'
game 'gta5'

description 'Vending Machine Creator'
version '1.0.0'

author 'mur4i'
credits 'ribeiro.gg'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'ox_inventory',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'