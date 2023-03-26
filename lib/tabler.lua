--[[
	CLua Table Manager
--]]

clua.tables = {}
--[[
	Clua register_table()
	
	Makes a table with clua. moar complex but Ok :D
	
	Usage: **Example**
	
	clua.register_table("foo", {

		copy_pasta = true, -- Here where the table save
		hellomsg = "hi ohioan guy", -- Dont put me into the furnace to burn me! - Eishu 2023
	})
	
	This is used by clua.get_table_value()
	
--]]
function clua.register_table(name, table)
	assert(clua.tables, "clua.tables service is not working, Missing table?")
	assert(name, "No name have been specified! clua.register_table()")
	assert(type(table) == "table", "table value specified badly or no exists")
	clua.tables[name] = {}
	clua.tables[name] = table
	if clua.tables[name].clua_loaded ~= true then
		clua.tables[name].clua_loaded = true
	end
end
--[[
	Clua get_table_value()
	
	Returns a table of a registered table or nil. See register_table()
	
	Usage: clua.get_table_value(`name of the table`)
--]]
function clua.get_table_value(name)
	assert(name, "name value is nil. clua.get_table_value()")
	assert(clua.tables, "clua.tables service is not working, Missing table?")
	assert(clua.tables[name], "No table found for "..name)
	return clua.tables[name] or nil
end