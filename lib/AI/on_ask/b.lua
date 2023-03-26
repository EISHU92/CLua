-- Hacker detector.
--[[for _, word in pairs(words) do
        if message:find(word) then
            local t1 = clua.aif("Select random", {"who hacking", "who", "name of da hacker?"})
            local cmessage = core.colorize("EISHU_CLuaAI", "#FF6100")
            format = core.format_chat_message(cmessage, t1)
            core.chat_send_all(format)
            waitingformat = true
        end
    end
    if waitingformat == true then
        local t2 = clua.ai("Select random", {"Ok lets see", "oki", "ok"})
        local list = {}
        for _, ppl in pairs(core.get_connected_players()) do
            if message:find("is") or message:find("its") or message:find("ITS") or message:find("IS") then
                hi()
            end
        end
    end]]

--#D80000
--words = {"HACK", "hack", "cheat", "CHEAT", "HCK", "hck"}
function usussy(name, message)
	table1 = message:split(" ")
	--print(dump(table1))
	local ahe = clua.player(table1[3])
	if not ahe then
		return
	end
	if table1[1] == "CLUA" and table1[2] == "scan" and ahe:is_player() then
		core.chat_send_all(minetest.colorize("#D80000", "<CLua> ").." Scanning "..table1[3].."....")
		for _, pp in pairs(clua.get_table("black_list_of_players", clua.get_table_value("central_csgo"))) do
			if table1[3]:match(pp) then
				returnto = true
			end
		end
		if returnto then
			core.chat_send_player(name, minetest.colorize("#D80000", "<CLua> ").." Using "..minetest.colorize("#D80000", "CLua").." as an option for fun/rage is not good!. Dont try to kick to an BlackList player.")
			return true
		end
		local player = clua.player(table1[3])
		local pos = player:get_pos()
		local pos2 = table.copy(pos)
		local pos3 = table.copy(pos)
		pos2.y = pos2.y + 1
		pos3.y = pos3.y - 1
		local verified1 = minetest.get_node(pos)
		local verified2 = minetest.get_node(pos2)
		local verified3 = minetest.get_node(pos3)
		if verified1.name == "air" then
			sus = true
		end
		if verified2.name == "air" then
			asus = true
		end
		-- fly hack can be this:
		if verified3.name == "air" then
			esus = true
		end
		if sus and asus and esus then
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ").."Scanning complete, results: Flying.")
			if type(discord) == "table" then
				discord.send("<CLua> Scanning complete, results: Flying.")
			end
			core.kick_player(table1[3], "Using hacks.")
		elseif (verified3.name ~= "air" and verified2.name ~= "air") or (verified2.name ~= "air") then
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ").."Scanning complete, results: Noclipping.")
			if type(discord) == "table" then
				discord.send("<CLua> Scanning complete, results: Noclipping.")
			end
			core.kick_player(table1[3], "Using hacks (noclip).")
		end
		
		
	end
end
core.register_on_chat_message(function(...)
	core.after(0.5, function(...)
		usussy(...)
	end, ...)
end)
--error("wut")