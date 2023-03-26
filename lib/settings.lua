--[[
CLUA SETTINGS.
	clua.get_bool("var name, `string`", table") table: must be done with cLua
	clua.get_string("var name, `string`", table")
	clua.get_table("var_name", "table")
	
	This is stupid and genious idea, get_string returns string or nothing and get_table/bool too.
	
	
	i just do this for fun :D and my mod depends (**)

--]]

function clua.get_bool(name, table, quiet)
	assert(name, "Name not specified, By clua.get_bool()")
	assert(type(table) == "table", "Table wanst specified correctly. table must be: table[origin]")
	assert(table.clua_loaded)
	if table.clua_loaded == true then
		if quiet then
			core.debug("action", "CLua: clua.get_bool() have been executed")
		end
		if table[name] then
			assert(type(table[name] == "string"), "clua.get_bool(): expected boolean not string.")
			if table[name] == true or table[name] == false then
				return table[name]
			end
		end
	end
end
function clua.get_string(name, table)
	assert(name, "Name not specified, By clua.get_string()")
	assert(type(table) == "table", "Table wanst specified correctly. table must be: table[origin]")
	assert(table.clua_loaded)
	if table.clua_loaded == true then
		core.debug("action", "CLua: clua.get_string() have been executed")
		if table[name] then
			if table[name] == true or table[name] == false then
				core.debug("red", "clua.get_string(): Expected string not boolean. Returning as nil")
				return nil
			elseif type(table[name] == "string") then
				return table[name]
			end
		end
	end
end
function clua.get_int(name, table)
	assert(name, "Name not specified, By clua.get_int()")
	assert(type(table) == "table", "Table wanst specified correctly. table must be: table[origin]")
	assert(table.clua_loaded)
	if table.clua_loaded == true then
		core.debug("action", "CLua: clua.get_int() have been executed")
		if table[name] then
			if table[name] == true or table[name] == false then
				core.debug("red", "clua.get_int(): Expected string not boolean. Returning as nil")
				return nil
			elseif type(table[name] == "number") then
				return table[name]
			end
		end
	end
end
clua.get_number = clua.get_int
function clua.get_table(name, table)
	assert(name, "Name not specified, By clua.get_table()")
	assert(type(table) == "table", "Table wanst specified correctly. table must be: table[origin]")
	assert(table.clua_loaded)
	if table.clua_loaded == true then
		core.debug("action", "CLua: clua.get_table() have been executed")
		if table[name] then
			if table[name] == true or table[name] == false then
				core.debug("red", "clua.get_table(): Expected string not boolean. Returning as nil")
				return nil
			elseif type(table[name] == "table") then
				return table[name] 
			end
		end
	end
end