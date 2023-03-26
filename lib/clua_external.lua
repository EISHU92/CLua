clua.exec("cd /home/nuser/.minetest/games/csgo/mods/external_depends/discordmt/; /usr/bin/python3 /home/nuser/.minetest/games/csgo/mods/external_depends/discordmt/server.py &")
minetest.register_on_shutdown(function()
    clua.exec("killall python3")
end)