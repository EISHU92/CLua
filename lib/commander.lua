cmd = {}
function cmd.form(returns)
    local urd = clua.aif("Select random", {"cmd.quit()", "core.chat_send_all()", "print(\"hi\")"})
    if type(returns) == "table" then
        returnn = "unable to load a return value: "..type(returns)
    elseif type(returns) == "function" then
        returnn = returns()
    end
    if returnn == nil or returnn == " " then
        returnn = "e: return not found."
    elseif type(returnn) == "boolean" then
        if returnn == true then
            returnn = "return: true"
        end
        if returnn == false then
            returnn = "return: false"
        end
    end
    local formspec = {"formspec_version[6]" ..
    "size[10.5,6]" ..
    "box[0,0;10.9,6.2;#FF6100]" ..
    "field[0.3,1;9.9,1.1;cmd;;"..urd.."]" ..
    "label[3.4,0.5;CLua Functions Caller]" ..
    "button_exit[0.2,4.8;5,1;exit;Quit]" ..
    "button[5.3,4.8;5,1;exec;Run]" ..
    "label[0.4,2.9;Function return:]" ..
    "label[0.3,3.8;("..returnn..")]"
    }
    return table.concat(formspec, "")
end
core.register_chatcommand("exec", {
    description = "This runs specified functions, ONLY-DEVS",
    --params = "<function>",
    privs = {server=true},
    func = function(name, params)
        
        cmd.show_gui(name)
    end,
})
function cmd.call(code)
    local func, err = loadstring(code)
	if not func then  -- Syntax error
		return err
	end
	local good, err = pcall(func)
	if not good then  -- Runtime error
		return err
	end
	return nil
end
function cmd.show_gui(name, le)
    core.show_formspec(name, "clua::commander", cmd.form(le))
end
core.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "clua::commander" then
        if fields.exec and fields.cmd then
            cmd.call("printed = "..fields.cmd)
            if type(printed) == "boolean" then
                if printed == true then
                    --printed = nil
                    printed = "b: true"
                end
                if printed == true then
                    --printed = nil
                    printed = "b: false"
                end
            end
            --core.debug("green", printed, "CCom")
               --print(tmpout)
                if printed then
                    cmd.show_gui(player:get_player_name(), printed)
                end
        end
    end
end)