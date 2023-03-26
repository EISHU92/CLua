--[[
function core.execute_global_func(func, ...) -- For commands, for everything...
assert(func, "ERROR: core.execute_global_func() has an error, function does not exist")
func()
end

minetest.register_chatcommand("execute", {
	params = "<function>",
	description = "Executes a global function, like cs_core.log, without the ()",
	privs = {server = true},
	func = function(name, param)
	--local __, param1, param2, param3, param4, param5 = unpack(params:split(" "))
	if name and param then
	core.execute_global_func(param)
	end
	end
})
--]]

