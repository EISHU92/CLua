function asussy(name, message)
	tea = message:split(" ")
	if message and type(tea) == "table" then
		if tea[1] == "CLUA" and tea[2] == "math" and tonumber(tea[3]) and tea[4] == "+" and tonumber(tea[5]) then
			local final_result = tea[3] + tea[5]
			local rd = clua.aif("Select random", {"its ", "is ", "math result: "})
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ")..rd..final_result)
			if type(discord) == "table" then
				discord.send("<CLua> "..rd..final_result)
			end
		end
		if tea[1] == "CLUA" and tea[2] == "math" and tonumber(tea[3]) and tea[4] == "-" and tonumber(tea[5]) then
			local final_result = tea[3] - tea[5]
			local rd = clua.aif("Select random", {"its ", "is ", "math result: "})
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ")..rd..final_result)
			if type(discord) == "table" then
				discord.send("<CLua> "..rd..final_result)
			end
		end
		if tea[1] == "CLUA" and tea[2] == "math" and tonumber(tea[3]) and (tea[4] == "/" or tea[4] == "d") and tonumber(tea[5]) then
			local final_result = tea[3] / tea[5]
			local rd = clua.aif("Select random", {"its ", "is ", "math result: "})
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ")..rd..final_result)
			if type(discord) == "table" then
				discord.send("<CLua> "..rd..final_result)
			end
		end
		if tea[1] == "CLUA" and tea[2] == "math" and tonumber(tea[3]) and (tea[4] == "*" or tea[4] == "m") and tonumber(tea[5]) then
			local final_result = tea[3] * tea[5]
			local rd = clua.aif("Select random", {"its ", "is ", "math result: "})
			core.chat_send_all(minetest.colorize("#D80000", "<CLua> ")..rd..final_result)
			if type(discord) == "table" then
				discord.send("<CLua> "..rd..final_result)
			end
		end
	end
end
core.register_on_chat_message(function(...)
	core.after(0.5, function(...)
		asussy(...)
	end, ...)
end)