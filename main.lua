clua.callbacks = { "on_", "if_", }
clua.main_callbacks = { "ON_MAIN", "IF_MAIN", }
function clua.start_luat(mod_folder, mod_name)
	core.debug("green", "core.start_luat() executing...", "CLua")
	
	dofile(mod_folder.."/clua/init.lua")
	
	for _, string in pairs(clua.modder.tmods.list) do -- solved risky hole.
		if string:find(mod_name) then
			etrie = false
		end
	end
	if clua[mod_name].dofiles() and etrie ~= false then
	
	---clua[mod_name].loaded = {}
	---clua[mod_name].number = 0
	
		if clua[mod_name].scripter() then
			local returned = dofile(mod_folder.."/clua/starters/clua-scripter.lua")
			if returned == "only_callbacks" then
				clua[mod_name].returned = returned
				clua.scripter("register", "oc", mod_name, mod_folder)
			end
			if returned == "normal" then
				clua[mod_name].returned = returned
				clua.scripter("register", "n/n", mod_name, mod_folder)
			end
			if returned == nil then
				clua[mod_name].returned = nil
				core.debug("red", "clua.start_luat() have been executed but the `clua-scripter.lua` returns nil. not-used.")
			end
			if returned == true then -- Have been set as normal.
				clua[mod_name].returned = "normal"
				clua.scripter("register", "n/n", mod_name, mod_folder)
			end
			if returned == false then 
				clua[mod_name].returned = false
			end
		end
		
	
		tmptable = core.get_dir_list(mod_folder.."/clua/starters")
		tmptablee = {}
		for e1, file in pairs(tmptable) do
			if tmptable ~= tmptablee then
				dofile(mod_folder.."/clua/starters/"..file)
				table.insert(tmptablee, file)
			end
			
			
		end
		tmptable = nil
		
					clua.registermod(mod_name)

	end
end
function clua.init_plugin(folder, name)
	if folder and name then
		dlist = core.get_dir_list(folder.."/SRC")
		if not dlist then
			return false
		end
		dofile(folder.."/SRC/start.lua")
		def = dofile(folder.."/SRC/clua.cfg")
		if not def.name then
			return false
		else
			if not clua[name] then
				clua[name] = {}
			end
			clua[name].name = def.name
			clua.registermod(name)

			print("Starting "..def.name)
			print("--------------------")
			print("Addon: "..name)
			print("Type: "..def.typea)
			print(os.date())


		end
		if def.files_to_load then
			for _, thing in pairs(def.files_to_load) do
				CLUA_AP = clua.get_string("clua_prefix", clua.get_table_value("clua"))
				dofile(folder.."/SRC/lua/"..thing)
			end
		end
		return true
	end
end