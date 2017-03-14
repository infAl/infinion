-- Include files
package.path = package.path .. ";data/scripts/mods/?.lua"
require ("infinion/config")

if not disableMod then

package.path = package.path .. ";data/scripts/lib/?.lua"
Dialog = require ("dialogutility")


-- Avorion default functions
function initialize()
	-- The greeting text
	InteractionText(Entity().index).text = dialogGreeting
	
    if onClient() then 
		if EntityIcon().icon == "" then
			EntityIcon().icon = "data/textures/icons/pixel/sdblack.png"
		end
	end
end

else 
	-- disableMod is true
function initialize() terminate() end
end