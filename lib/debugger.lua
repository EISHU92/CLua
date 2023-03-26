function core.debug(act, message, mod)
	if act and message then
	assert(message, "Debugger Error: Can't print debugger text, that exists？")
		local textd = true
			if (act == "warn") then
			print("\27[01;33m(MCM_WARNING)\27[0m\27[01;33m " .. message .. "\27[0m")
			end
			
			if (act == "action") then
			print("\27[01;32m(MCM_ACT)\27[0m\27[32m " .. message .. "\27[0m")
			end
			
			if (act == "error" or act == "red") then
			if act == "error" then
			print("\27[31m(CentralSysError) " .. message .. "\27[0m")
			elseif act == "red" and mod then
			print("\27[31m("..mod..") " .. message .. "\27[0m")
			end
			end
			
			if (act == "green" or act == "action") then
			if act == "good" then
			print("\27[32m(MCM_ACT) " .. message .. "\27[0m")
			elseif act == "green" and mod then
			print("\27[01;32m("..mod..")\27[0m\27[32m " .. message .. "\27[0m")
			end
			end
			
			if (act == "ferror") then
			error("[MCM_E]: " .. message)
			end
	end
	
end
