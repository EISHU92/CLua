clua.toolset = {}
clua.ttabler = {}
clua.toolset = {
	required = { "missing"--[[ ,"boolean", "number"--]], }, -- i cant (**)
        --                                                                 ¯
	output = { "boolean", "human_readable", "number" }, --number: 1 = false/error 0 = true/no error 2 = cant calculate
	required_opts = { "CheckWorldPos", "FindMod", "CheckNumber", "IsCluaAlias", "CheckClass", },
}
--[[
CheckNumber warning = Must type with `"` the numbers for worker, like "1,98,2".
CheckClass numbers types:
1 = string
2 = table
3 = number
4 = boolean
5 = unknown
--]]
function clua.check(options, value, stdout, CheckClassOPT) -- stdout is optional, CheckClassOPT too
	assert(options, "clua.check(): options is missing!")
	assert(value, "clua.check(): string/boolean/number is missing!")
		if options:find("required_") then
			local _, type1 = unpack(options:split("_"))
			for _, word in pairs(clua.toolset.required) do
				if type1:find(word) then
					if word == "missing" then
						core.debug("green", "clua.check(): required_missing() executing", "CLua")
						local _, ropts = unpack(options:split("."))
						for _, word1 in pairs(clua.toolset.required_opts) do
							if ropts:find(word1) then
								if word1 == "CheckWorldPos" then
									local x, y, z = unpack(value:split(","))
									if tonumber(x) then
										if not (x > 30900) then
											core.debug("green", "CheckWorldPos: `x` checked", "CLua")
											numbersp = 1
										else
											core.debug("red", "CheckWorldPos: `x` is not a number or is more than 30900!", "CLua")
											if stdout then
												local std, valuee = unpack(stdout:split("."))
												for _, word2 in pairs(clua.toolset.output) do
													if valuee:find(word2) then
														if word2 == "boolean" then
															return false
														end
														if word2 == "human_readable" then
															return "`X` is more than 30900 or not a number"
														end
														if word2 == "number" then
															return 1
														end
													end
												end
											else
												core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
												return false
											end
										end
									end
									if tonumber(y) then
										if not (y > 30900) then
											core.debug("green", "CheckWorldPos: `y` checked", "CLua")
											numbersp = numbersp + 1
										else
											core.debug("red", "CheckWorldPos: `y` is not a number or is more than 30900!", "CLua")
											if stdout then
												local std, valuee = unpack(stdout:split("."))
												for _, word2 in pairs(clua.toolset.output) do
													if valuee:find(word2) then
														if word2 == "boolean" then
															return false
														end
														if word2 == "human_readable" then
															return "`y` is more than 30900 or not a number"
														end
														if word2 == "number" then
															return 1
														end
													end
												end
											else
												core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
												return false
											end
										end
									end
									if tonumber(z) then
										if not (z > 30900) then
											core.debug("green", "CheckWorldPos: `z` checked", "CLua")
											numbersp = numbersp + 1
											if numbersp == 3 then
												if stdout then
													local std, valuee = unpack(stdout:split("."))
													for _, word2 in pairs(clua.toolset.output) do
														if valuee:find(word2) then
															if word2 == "boolean" then
																return true
																end
															if word2 == "human_readable" then
																return "No errors, found."
															end
															if word2 == "number" then
																return 0
															end
														end
													end
												else
													core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
													return true
												end
											
											end
										else
											core.debug("red", "CheckWorldPos: `z` is not a number or is more than 30900!", "CLua")
											if stdout then
												local std, valuee = unpack(stdout:split("."))
												for _, word2 in pairs(clua.toolset.output) do
													if valuee:find(word2) then
														if word2 == "boolean" then
															return false
														end
														if word2 == "human_readable" then
															return "`z` is more than 30900 or not a number"
														end
														if word2 == "number" then
															return 1
														end
													end
												end
											else
												core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
												return false
											end
										end
									end
								end
								if word1 == "FindMod" then
									ModList = core.get_modnames() or false
									CluaTModList = clua.get_loaded_tmods() or false --Technical mod names
									CluaModList = clua.get_loaded_mods() or false -- Human Readable mod names
									if ModList ~= false or ModList ~= "" then
										for _, named in pairs(ModList) do
											if named:find(value) then
												if stdout then
													local std, valuee = unpack(stdout:split("."))
													for _, word2 in pairs(clua.toolset.output) do
														if valuee:find(word2) then
															if word2 == "boolean" then
																return true
															end
															if word2 == "human_readable" then
																return value.." have been found (OriginalMinetestEngineModList)"
															end
															if word2 == "number" then
																return 0
															end
														end
													end
												else
													core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
													return true
												end
											end
										end
									elseif (ModList == false or ModList == "") and CluaTModList then -- CLua mod list.
										core.debug("red", "Can't load mod list. Probably Minetest disabled core.get_modnames() function\nRetrying with CLua Mod List...", "Clua")
										for _, named in pairs(CluaTModList) do
											if named:find(value) then
												if stdout then
													local std, valuee = unpack(stdout:split("."))
													for _, word2 in pairs(clua.toolset.output) do
														if valuee:find(word2) then
															if word2 == "boolean" then
																return true
															end
															if word2 == "human_readable" then
																return value.." have been found (EISHU CLua ModList.)"
															end
															if word2 == "number" then
																return 0
															end
														end
													end
												else
													core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
													return true
												end
											end
										end
									elseif (CluaTModList == false or CluaTModList == "") and CluaModList then -- CLua mod list.
										core.debug("red", "Can't load mod list. Probably Minetest disabled core.get_modnames() function\nRetrying with CLua Mod List...", "Clua")
										for _, named in pairs(CluaModList) do
											if named:find(value) then
												if stdout then
													local std, valuee = unpack(stdout:split("."))
													for _, word2 in pairs(clua.toolset.output) do
														if valuee:find(word2) then
															if word2 == "boolean" then
																return true
															end
															if word2 == "human_readable" then
																return value.." have been found (EISHU CLua ModList.)"
															end
															if word2 == "number" then
																return 0
															end
														end
													end
												else
													core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
													return true
												end
											end
										end
									end
								end
								if word1 == "CheckNumber" then --USE ONLY IF "0,5,1,4" not only 1 number!
									if tonumber(value) then
										core.empty()
									end
									tmp = {}
									tocompare = 0
									tocompared = 0
									for i, numbers in unpack(value:split(",")) do
										tmp[i] = numbers
										tocompare = tocompare + 1
									end
									for _, numbers in pairs(tmp) do
										local res = tonumber(tmp[numbers])
										if res then
											tocompared = tocompared + 1
										end
										if tocompared == tocompare then
											if stdout then
													local std, valuee = unpack(stdout:split("."))
													for _, word2 in pairs(clua.toolset.output) do
														if valuee:find(word2) then
															if word2 == "boolean" then
																return true
															end
															if word2 == "human_readable" then
																return value.." have been checked (CheckNumber)"
															end
															if word2 == "number" then
																return 0
															end
														end
													end
											else
													core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
													return true
											end
										end
									end
								end
								if word1 == "IsCluaAlias" then
								assert(value, "value not found.")
									if clua[value] then
										if stdout then
											local std, valuee = unpack(stdout:split("."))
											for _, word2 in pairs(clua.toolset.output) do
												if valuee:find(word2) then
													if word2 == "boolean" then
														return true
													end
													if word2 == "human_readable" then
														return "The Mod/Function ("..value..") is a alias of CLua"
													end
													if word2 == "number" then
														return 0
													end
												end
											end
										else
											core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
											return true
										end
									end
								end
								if word1 == "CheckClass" then
									if CheckClassOPT then -- this must include a value, like string or boolean or number, *things that need to match with type()*
										Returned = type(value)
										if CheckClassOPT == Returned then
											if stdout then
												local std, valuee = unpack(stdout:split("."))
												for _, word2 in pairs(clua.toolset.output) do
													if valuee:find(word2) then
														if word2 == "boolean" then
															return true
														end
														if word2 == "human_readable" then
															return "The value of ("..value..") is the same type as "..CheckClassOPT
														end
														if word2 == "number" then
															return 0
														end
													end
												end
											else
												core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
												return true
											end
										end
									else
										if stdout then
											local std, valuee = unpack(stdout:split("."))
											for _, word2 in pairs(clua.toolset.output) do
												if valuee:find(word2) then
													if word2 == "boolean" then
														core.debug("red", "Can't return boolean!")
														return nil
													end
													if word2 == "human_readable" then
														if type(value) == "string" then
															checked = true
															return value.." type is string"
															
														end
														if type(value) == "table" then
															checked = true
															return value.." is a table data"
														end
														if type(value) == "number" then
															checked = true
															return value.." is a number data"
														end
														if type(value) == "boolean" then
															checked = true
															return value.." is a boolean data"
															
														end
														if not checked then
														
															return value.." is unknown value."
														end
													end
													if word2 == "number" then
														if type(value) == "string" then
															checked = true
															return 1
															
														end
														if type(value) == "table" then
															checked = true
															return 2
														end
														if type(value) == "number" then
															checked = true
															return 3
														end
														if type(value) == "boolean" then
															checked = true
															return 4
															
														end
														if not checked then
														
															return 5
														end
													end
												end
											end
										else
											core.debug("warn", "clua.checker(): no std out option found, returning into booleans.")
											return true
										end
									end
								end
							end
						end
					end
				end
			end
		end
end




function core.find_mod(mod, rmod)
	assert(mod, "Mod name is missing, core.find_mod()")
	assert(rmod, "Mod RawName is missing, core.find_mod()")
	if clua.check("required_missing.FindMod", rmod) or clua.check("required_missing.IsCluaAlias", rmod) then
		returned = true
	end
	if returned == nil then
		if clua.check("required_missing.FindMod", mod) then
			returned = true
		end
	end
	return returned or false
end
--[[
function core.register_cluafunc(name, table)
	assert(clua.check("required_missing.CheckClass", table, "output.boolean", "table"), "By CLUA.CHECKER() expected table, not nil or string.")
	assert(name, "name is missing, core.register_cluafunc()")
	clua.







end

--]]





function core.is_online(player)
	if player then
		for _, thing in pairs(core.get_connected_players) do
			if thing:find(player) or thing:match(player) then
				returnedb = false
				return true
			else
				thingg = thing:get_player_name()
				if thingg:find(player) or thingg:match(player) or thingg == player then	
					returnedb = false
					return true
				else
					returnedb = true
				end
			end
		end
		if returnedb == true then
			return false
		end
	end
end






























