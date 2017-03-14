
-- Use disableMod if you want to uninstall.
-- At the moment, if the game engine can't find a script that is attached to an
-- object it doesn't work well.
-- Entities like ships seem to be deleted, players seem to be respawned as a different
-- faction and not 'own' any of their existing ships and stations.
-- Set disableMod to true and leave all the files in place. They will simply
-- load and then terminate
disableMod = false -- [true/false]


-- Modinfo Stuff
modName = "Infinion Corporation"
modVersion = { major=1, minor=0, revision=0 }
modDescription = "Randomly adds Infinion Coroporation Outpost stations to sectors."


-- Scripts
scriptPlayer = "mods/infinion/playerScript.lua"
scriptOutpost = "mods/infinion/infinionOutpost.lua"


-- Corporation names
infinion = "Infinion Corporation"

-- Spawn Chance is a value 1 - 100. The script will generate a random number and if
-- the Spawn Chance value is higher than the random value, the station will spawn.
-- The stations will only spawn in regular sectors where there are at least 2 other stations.
spawnChance = 
{
	infinion = 27
}

-- Should the corporation always have a station in the home sector of other factions
alwaysInHomeSector = 
{
	infinion = true
}


dialogGreeting = "Infinion Corporation Welcomes you.\nYou are speaking with the AI module for this automated outpost. How may I be of assistance?"

outpost = "Outpost"
