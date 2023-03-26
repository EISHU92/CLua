clua.ai = {}
--clua.ai.selections = {"Select", "Get"}
clua.ai.tell = {}
--clua.ai.tell.welcome = {"Hiii!", "Helloo!", "Welcome!", "haai!", "Heloo"}
--[[
clua.ai.activate_when = {"Wheres AI?", "clua.ai", "ai", "Wheres Clua"}
clua.ai.tell.when_activate = {"Hi sir!", "whats up",}
--]]
function clua.aif(conditionn, etable) -- Primary AI (Only had table parser with random and `IF`)
	condition = {}
	--conditionS.timedout = 2
	--condition.selected, condition.value, condition.value1, condition.value2, condition.value3 = unpack(conditionn:split(" "))
	condition.selected = unpack(conditionn:split(" "))
	for number, string in pairs(conditionn:split(" ")) do
	core.debug("action", "FOR: EXEC for CLuaAI")
	print(string, number)
		if string ~= "Select" then
			if condition.value == nil then
				if string then
					condition.value = string
					core.debug("green", "for <ustring> do: condition normal have been saved.", "CLuaAI")
					--print(condition.value)
				else
					core.debug("red", "CLua Cant handle some variables, err: string expected [got nil]", "CLuaAI")
					condition.value = "UNIT.FALSE"
				end
			else
				core.debug("green", "for <ustring> do: condition "..number.." have been saved.", "CLuaAI")
				condition["value"..number] = string
			end
			
		end
	end
	if condition.selected == "Select" and condition.value then
		if clua.check("required_missing.CheckClass", condition.value, "output.boolean", "number") then
			core.debug("green", "EXE: Select with number", "CLuaAI")
			if clua.check("required_missing.CheckClass", etable, "output.boolean", "table") then
				if etable[condition.value] then
					return etable[condition.value]
				end
			end
		elseif condition.value == "random" then
		core.debug("green", "EXE: Select with random", "CLuaAI")
			if clua.check("required_missing.CheckClass", etable, "output.boolean", "table") then
				core.debug("green", "CLUA_CHECKER: table: accepted", "CLuaAI")
				if condition.value1 ~= nil then
					if clua.check("required_missing.CheckClass", condition.value1, "output.boolean", "number") then
						core.debug("green", "CLUA_CHECKER: value*NUMBER: accepted", "CLuaAI")
						tmprandom = math.random(condition.value1)
						if etable[condition.value1] then
							return etable[condition.value1]
						end
					end
				elseif condition.value1 == nil then
					core.debug("green", "LUA: Ivalue: accepted", "CLuaAI")
					number = 0
					for numberr, _ in pairs(etable) do
						number = numberr-- + 1
					end
					tmprandom = math.random(number)
					if etable[tmprandom] then
						return etable[tmprandom]
					end
				end
			end
		end
	end
end