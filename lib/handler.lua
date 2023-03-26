--CLUA handle
core.after(1.3, function()
    if clua.modder.tmods["clua_discord_relay"] then
        print([[clua_discord_relay found.]])
        function clua.handle_error(ntype, ctype, inf, details)
            local null, number_type = unpack(ntype:split(":"))
            local null, com_type = unpack(ctype:split(":"))
            assert(inf, "info of handle_error() is missing.")
            if number_type == 1 then
                number = "ubold"
            elseif number_type == 2 then
                number = "bold"
            elseif number_type == 3 then
                number = "bold_italic"
            elseif number_type == false or number_type == nil or number_type == " " or number_type == "" then
                number = clua.aif("Select random", {"bold", "italic"})
            end
            clua.send_text(inf, number, "ERROR")
        end
    else
        function clua.handle_error(...) -- only prints
            print(...)
            core.debug("warn", "clua.handle_error is currently unavailable because the plugin `clua_discord_relay` doesnt exist")
        end
    end
end)