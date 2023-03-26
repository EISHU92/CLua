clua.modder = {}
clua.modder.mods = {}
clua.modder.tmods = {}
clua.modder.mods.list = {}
clua.modder.tmods.list = {}--[[
if TECHMODNAME and MODNAME then
	table.insert(clua.modder.mods.list, MODNAME)
	table.insert(clua.modder.tmods.list, TECHMODNAME)
end--]]
function clua.registermod(mod)
	TECHMODNAME = mod
	MODNAME = clua[mod].name or mod
	table.insert(clua.modder.mods.list, MODNAME)
	table.insert(clua.modder.tmods.list, TECHMODNAME)
	TECHMODNAME = nil
	MODNAME = nil
end
function clua.get_loaded_tmods()
	return clua.modder.tmods.list or false
end
function clua.get_loaded_mods()
	return clua.modder.mods.list or false
end