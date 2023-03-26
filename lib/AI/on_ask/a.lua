--A: On Hi and other events.
on_hi = {"Hii", "helloo", "wb", "hi", "Oh hi", "weelcome back", "Hello", "Greetings"}
deco = {"!", " ", "!!", "!!!"}
minetest.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    local ai1 = clua.aif("Select random", on_hi)
    local ai2 = clua.aif("Select random", deco)
    local message = ai1.." "..name..ai2
    local cmessage = core.colorize("#FF6100", "<CLua> ")
    --format = core.format_chat_message(cmessage, message)
    core.chat_send_all(cmessage..message)
    if type(discord) == "table" then
    	discord.send(cmessage..message)
    end
    return true, "sus"
end)