--Random position for CLua
--[[
	Made By EISHU 2023
--]]
function clua.random_position(pos, per, y)
	if per then
		if type(per) ~= "number" then
			clua.throw("Bad Argument to option `2`: Expected number, got "..type(per))
		end
	else
		clua.throw("Bad Argument to option `2`: Expected number, got NIL")
	end
	if pos then
		if type(pos) ~= "table" then
			clua.throw("Bad Argument to option `1`: Expected table, got "..type(pos))
		end
		
		newtable = {}
		newtable.x = math.random(1, per) + pos.x
		if y then
			newtable.y = math.random(1, per) + pos.y
		else
			newtable.y = pos.y
		end
		newtable.z = math.random(1, per) + pos.z
		return newtable
	else
		clua.throw("Bad Argument to option `1`: Expected table, got NIL")
	end
end