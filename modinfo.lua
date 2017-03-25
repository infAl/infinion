-- Infinion Corporation Stations


-- Include files
package.path = package.path .. ";data/scripts/mods/?.lua"
local Config = require ("infinion/config")


local Mod = {}

-- Info for ModLoader
Mod.info = 
{
	name=Config.modName,
	version=Config.modVersion,
	description=Config.modDescription,
	author="infal",
	website="",
	icon=nil,
	dependency =
	{
		["Simple Mod Loader"]={ major=1, minor=2, revision=0 },
	},
	playerScript=Config.scriptPlayer,
	onInitialize=nil,
}

return Mod