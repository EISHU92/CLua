--clua = {}
--local clua.name = 
clua.path = core.get_builtin_path() .. "/clua"
function clua.init_main()

dofile(clua.path.."/lib/global.lua")
dofile(clua.path.."/lib/debugger.lua")
dofile(clua.path.."/lib/dofile.lua")
dofile(clua.path.."/lib/repeater.lua")
dofile(clua.path.."/lib/empty.lua")
dofile(clua.path.."/lib/tabler.lua")
-- Settings
dofile(clua.path.."/lib/settings.lua")
dofile(clua.path.."/lib/settings.lua.CFG")
-- End Settings
-- Dummy and ugly thing
dofile(clua.path.."/lib/comments.lua")
--LuaScripter
dofile(clua.path.."/lib/lua_scripter.lua")
--Clua Tools
dofile(clua.path.."/lib/tools.lua")
dofile(clua.path.."/lib/commander.lua")
dofile(clua.path.."/lib/player.lua")
dofile(clua.path.."/lib/object.lua")
dofile(clua.path.."/lib/clua_external.lua")
dofile(clua.path.."/lib/random_pst.lua")
dofile(clua.path.."/lib/lua_tables.lua")
dofile(clua.path.."/lib/modder.lua")
dofile(clua.path.."/lib/player_inventory.lua")
-- reg_on.lua will die soon because no uses
dofile(clua.path.."/lib/reg_on.lua")
--AI
dofile(clua.path.."/lib/ai.lua")
dofile(clua.path.."/lib/AI/starter.lua")
-- If all ended with `OK` then load the main
dofile(clua.path.."/main.lua")

end



clua.init_main()


ct([[
    CLua V2.1 Have been executed correctly
    Total loaded files: 20
]])


