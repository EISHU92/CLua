function clua.remove_data(table, data)
	if type(table) == "table" then
		if table[data] then
			newtable = {}
			for i, string in pairs(table) do
				core.debug("green", "making new table NUMBERS["..i.."].", "CLua")
				if string ~= data then
					table.insert(newtable, string)
				end
				return newtable
			end
		end
	end
end
function clua.search_boolean(table, data)
	if type(table) == "table" then
		for i, string in pairs(table) do
		core.debug("green", "Table.Search v1: searching "..data.." from table. NUMBERS["..i.."].", "CLua")
			if string == data then
				return true
			end
		end
	end
end
function clua.search_string(table, data) --version 2
	if type(table) == "table" then
		for i, string in pairs(table) do
		core.debug("green", "Table.Search v2: searching "..data.." from table. NUMBERS["..i.."].", "CLua")
		print(data)
		print(string)
			if string == data then
				
				core.debug("green", "Table.Search v2: searching "..data.." from table have been found. NUMBERS["..i.."].", "CLua")
				return string
			end
		end
	end
end