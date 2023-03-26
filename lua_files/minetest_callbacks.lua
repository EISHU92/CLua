clua.mtc = {
    registered_onkill = {},
}
function core.register_onkill(func)
	table.insert(clua.mtc.registered_onkill, func)
end

minetest.register_on_punchplayer(function(victim, killer, _, __, ___, damage)

	if (victim:get_hp() > 0 and victim:get_hp() - damage <= 0 and killer) then
		for i = 1, #clua.mtc.registered_onkill do
			clua.mtc.registered_onkill[i](victim, killer) -- Return as an ObjectRef
		end
		--core.debug("")
	end

end)