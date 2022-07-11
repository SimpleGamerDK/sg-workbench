fx_version 'cerulean'
game 'gta5'

author 'Simple - Owner of Simple Networks'
version '1.0.0'
description 'Suit case script Chezza Inventory'

dependencies {
    "PolyZone"
}

client_script {
    'client.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

}

server_script {
	'server.lua',
}

shared_script 'config.lua'