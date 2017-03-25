-------------------------------------------------------------------------------
--	This file contains all of the strings and configurable values for the mod
--	and could be edited for language localisation
--
-------------------------------------------------------------------------------

local t = {} 


-- Use disableMod if you want to uninstall.
-- At the moment, if the game engine can't find a script that is attached to an
-- object it doesn't work well.
-- Entities like ships seem to be deleted, players seem to be respawned as a different
-- faction and not 'own' any of their existing ships and stations.
-- Set disableMod to true and leave all the files in place. They will simply
-- load and then terminate
t.disableMod = false -- [true/false]


-- Modinfo Stuff
t.modName = "Infinion Corporation"
t.modVersion = { major=1, minor=0, revision=2 }
t.modDescription = "Randomly adds Infinion Coroporation Outpost stations to sectors."


-- Scripts
t.scriptPlayer = "mods/infinion/playerScript.lua"
t.scriptOutpost = "mods/infinion/infinionOutpost.lua"


-- Corporation names
t.infinion = "Infinion Corporation"

-- Spawn Chance is a value 1 - 100. The script will generate a random number and if
-- the Spawn Chance value is higher than the random value, the station will spawn.
-- The stations will only spawn in regular sectors where there are at least 2 other stations.
t.spawnChance = 
{
	infinion = 27
}

-- Should the corporation always have a station in the home sector of other factions
t.alwaysInHomeSector = 
{
	infinion = true
}


t.dialogGreeting = "Infinion Corporation Welcomes you.\nYou are speaking with the AI module for this automated outpost. How may I be of assistance?"

t.outpost = "Outpost"

return t
