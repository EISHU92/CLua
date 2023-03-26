for _, ar in pairs(core.get_dir_list(core.get_builtin_path() .. "/clua/lib/AI", true, "clua")) do
	for _, ae in pairs(core.get_dir_list(core.get_builtin_path() .. "/clua/lib/AI/"..ar, false, "clua")) do
		dofile(core.get_builtin_path() .. "/clua/lib/AI/"..ar.."/"..ae)
	end
end
--[[

	
	
	
	
	
	
	

























]]