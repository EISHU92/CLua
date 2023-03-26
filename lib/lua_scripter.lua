-- Lua Scripter. Used on CALLBACKS.
--[[
	Clua *Mini* callbacks manager
	
	This manages files and distributes into multiple tables. Simply. if files had on_ or if_ its will be managed by this script
	How To Use:
	
	Master Example: clua.register(`Options: call, register`, `Typed for registering: oc (OnlyCallbacks), n/n (Normal Script. Ignored.)`, `Name of the Used mod`, `folder of the used mod`)
	
		To register a callback:
		
			clua.register("register", "oc or n/n", "exampel", "/usr/share/games/fOOO/meh/hi")
		
		To call a callback:
		
			clua.register("call", "fooFoO", "example", "/usr/share/games/fOOO/meh/hi")
--]]

function clua.register(option, typed, name, folder, ...) -- ...= everything else
	assert(option, "No option have been found! clua.register()")
	assert(typed, "No type of scripting are found! clua.register()")
	assert(name, "Mod name is missing. clua.register()")
	assert(folder, "Mod folder is missing. clua.register()")
	
	if option == "register" and typed == "oc" then
		for number, named in pairs(core.get_dir_list(mod_folder.."/clua/starters")) do
			for _, wname in pairs(clua.callbacks) do
				if named:find(wname) then
					table.insert(clua[name].loaded, named)
					clua[name].number = clua[name].number + 1
					core.debug("green", "Registered "..named.." stored to RAM. to be used on some mods/scripts", "CentralCLUA")
				end
			end
		end
		clua[name].had_callbacks = true
	end
	
	if option == "call" and typed and named and folder then
		for _, wname in pairs(clua.callbacks) do
			if typed:find(wname) then
				if typed:find("on_") and typed then
					if clua[name].loaded then
						if clua[name].loaded:find(typed) then
							local success = true
							
							if success == true then
								core.debug("green", "Success on calling a callback. DEBUG: OPT="..option..", TYPE="..typed..", NAME="..named, "CentralCLUA")
							elseif success == false then
								core.debug("red", "Error have been ocurred. Probably a table or variable is missing. See the CLUA Warnings.", "CentralCLUA")
							end
							
							return dofile(folder.."/clua/starters/on_"..typed..".lua") -- typed are sinc, not on_sinc
							
						else
							core.debug("warn", "Can't find "..typed.." in *REGISTERED* table. Its Missing.")
							local success = false
						end
					else
						core.debug("warn", "Table for "..typed.." its missing for "..name..".")
						local success = false
					end
				elseif typed:find("if_") and typed then
					if clua[name].loaded then
						if clua[name].loaded:find(typed) then
							local success = true
							
							if success == true then
								core.debug("green", "Success on calling a callback. DEBUG: OPT="..option..", TYPE="..typed..", NAME="..named, "CentralCLUA")
							elseif success == false then
								core.debug("red", "Error have been ocurred. Probably a table or variable is missing. See the CLUA Warnings.", "CentralCLUA")
							end
							
							return dofile(folder.."/clua/starters/if_"..typed..".lua") -- typed are sinc, not if_sinc
						else
							core.debug("warn", "Can't find "..typed.." in *REGISTERED* table. Its Missing.")
							local success = false
						end
					else
						core.debug("warn", "Table for "..typed.." its missing for "..name..".")
						local success = false
					end
				end
				
			end
		end
	end
end