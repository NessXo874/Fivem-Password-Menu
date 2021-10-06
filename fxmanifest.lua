---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- created at [24/05/2021 10:02]
---

fx_version 'cerulean'

games { 'gta5' };


shared_scripts {
    '@es_extended/locale.lua'
}

client_scripts {
	"src/RageUI.lua",
	"src/Menu.lua",
	"src/MenuController.lua",
	"src/components/*.lua",
	"src/elements/*.lua",
	"src/items/*.lua",
	"src/panels/*.lua",
	"src/windows/*.lua",
	'@es_extended/locale.lua',
	"cl.lua"
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua'
}

dependencies {
    'es_extended'
}




