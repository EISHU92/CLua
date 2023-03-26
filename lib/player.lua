--Player info reporter.
function clua.get_player_inf(player)
    if player:is_player() then
        local def = {}
        def.name = player:get_player_name()
        def.pos = player:get_pos()
        def.inv = player:get_inventory()
        def.meta = player:get_meta()
        def.player = player
        def.hp = player:get_hp()
        return def, player:is_player()
    end
end

function clua.pname(player)
    typed = type(player)
        if typed == "userdata" then
            return player:get_player_name()
        elseif typed == "string" then
            return player
        elseif typed ~= "string" and typed ~= "userdata" then
            return false
        end
end
function clua.player(player)
    typed = type(player)
        if typed == "userdata" then
            return player
        elseif typed == "string" then
            return core.get_player_by_name(player)
        elseif typed ~= "string" and typed ~= "userdata" then
            return false
        end
end