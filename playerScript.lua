-------------------------------------------------------------------------------
--	infinion/playerScript.lua
--
--	This script is attached to the player entity at log in and registers a
--  callback for when the player enters a sector.
--
-------------------------------------------------------------------------------


-- Include files
package.path = package.path .. ";data/scripts/mods/?.lua"
require ("infinion/config")

if not disableMod then

package.path = package.path .. ";data/scripts/lib/?.lua"
require("randomext")
require("defaultscripts")
Placer = require ("placer")
SectorGenerator = require ("SectorGenerator")

package.path = package.path .. ";data/scripts/?.lua"
SectorSpecifics = require ("sectorspecifics")


-- Local variables
local externalScripts = {}


-- Avorion default functions
function initialize()
	-- We want to know when a player enters a sector so we can check the sector
	-- and see if we should spawn a new station or not
	Player():registerCallback("onSectorEntered", "onSectorEntered")
end


-- Event handler functions
function onSectorEntered(playerIndex, x, y)
	if onServer() then
	
		local sector = Sector()
		
		-- We want to spawn a station but need to check if it's okay first
		local stationList = {Sector():getEntitiesByType(EntityType.Station)}
		if stationList then
		
			local stationCount = 0
			for _, station in pairs(stationList) do
				if string.match(station.title, "Infinion") then
					-- If we have already spawned a station in this system then we don't want to
					-- spawn another
					return
				end
				stationCount = stationCount + 1
			end
			
			-- Use the sector specifics script to see if the sector is regular and/or a faction home
			local secSpec = SectorSpecifics()
			local isRegular, _, _, isHome, _ = secSpec:determineContent(x, y, Server().seed)
			if isRegular and stationCount > 1 then
				-- This sector has other stations and we haven't spawned a station here yet
				-- so it is a valid candidate for spawning one of our stations.
				
				local spawnStation = false
				if isHome and alwaysInHomeSectors.infinion then
					-- Infinion Corporation is always represented in faction home systems!
					-- (if that's what the config file says)
					spawnStation = true
				else
					-- Use the faction name to make a seed for random so that other factions could use the
					-- same code but spawn in different sectors.
					math.randomseed(makeHash(infinion, x, y, sector.seed))
					if math.random(1, 100) > spawnChance.infinion then
						-- Use random and to reduce the number of sectors we spawn
						-- the station in, otherwise they will be too common.
						spawnStation = true
					end
				end
				
				if spawnStation then
					printlog("<Infinion> Spawning new station: %s in sector %i, %i", infinion .. " " .. outpost, x, y)
					--Server():broadcastChatMessage("Infinion", 0, "Spawning new station"%_t)
					
					local generator = SectorGenerator(x, y)
					local faction = Galaxy():getControllingFaction(x, y)
					local station = generator:createStation(faction, scriptOutpost, 0.1)
					local position = generator:getPositionInSector(5000)
					
					station.title = infinion .. " " .. outpost
					station.position = position or Matrix()
					
					for _, script in pairs(externalScripts) do
						station:addScriptOnce(script)
						printlog("<Infinion> Added script: %s to station", script)
					end

					Placer.resolveIntersections()
				end
			end
		end
	end		
end

-- API functions (Can be called from other mods etc)

-- A function to make it easier for other mods to attach scripts to our custom stations
-- @param script The name of the script file to attach to the station
function registerExternalStationScript(script)
	if script then
		table.insert(externalScripts, script)
	end
end

else 
	-- disableMod is true
function initialize() terminate() end
end