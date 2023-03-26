on_formspec = {}

function clua.register_on(name, table) -- typed: type of callback; can be formspec (only for now) 
	assert(table, "table is missing.")
	assert(name, "name is missing.")
	if type(table) == "table" then
		assert(type(table.on_formspec) == "function")
		assert(type(table.formname) == "string")
		on_formspec[name] = {}
		on_formspec[name].func = table.on_formspec
		on_formspec[name].form = table.formname
	end
end
minetest.register_on_player_receive_fields(function(player, form, field)
	for i, string in pairs(on_formspec) do
		if string then
		print(dump(string,''))
		if on_formspec[string] and on_formspec[string] then
			if type(on_formspec[string].func) == "function" then
				if type(on_formspec[string].form) == "string" then
					if on_formspec[string].form == form then
						local callback = on_formspec[string].func
						local ret = callback(player, field)
						core.debug("green", "On_Receive_Fields() return: "..ret)
					end
				end
			end
		end
		end
	end
end)