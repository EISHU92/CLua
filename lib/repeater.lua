-- Make repeater be in minetest core too...
function core.repeat_func(times, delay, func)
	-- Checker
	assert(tonumber(times), "times variable are incorrect or not a number, times = "..times)
	assert(tonumber(delay), "delay variable are incorrect or not a number, delay = "..delay)
	assert(type(func) == "function", "function are invalid or not a function, DEBUG: func = "..type(func))
	core.debug("times:"..times..", delay:"..delay..", func:cant put a function on a printed debug.")
	--Commence
	for i = 1, times do
		core.after(delay, func)
	end
end