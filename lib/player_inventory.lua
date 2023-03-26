--This is a new library that makes CLua from v2.0 to v2.5
--[[
    This file has many functions for player inventory management.
]]

-- ItemStack finder. player: objectref, item: ItemStack
function clua.find_itemstack_from(player, item)
    if player and type(player) == "userdata" then
        if item then
            local inv = player:get_inventory()
            local list = inv:get_list("main")
            local str2 = ItemStack(item)
            --local units = #list
            for i, string in pairs(list) do
                if string:get_name() == str2:get_name() then
                    return true, "success_true"
                end
                
            end
            return false, "item_dont_exists"
        end
    end
end
-- ItemStack finder (with count/name matcher) player: objectref, item: itemstack, count: number
function clua.itemfind(player, item)
    if player and type(player) == "userdata" then
        if item then
            local inv = player:get_inventory()
            local list = inv:get_list("main")
            local str2 = ItemStack(item)
            --local units = #list
            for i, string in pairs(list) do
                if string:get_name() == str2:get_name() and string:get_count() == str2:get_count() then
                    return true, "success_true"
                end
                
            end
            return false, "item_dont_exists"
        end
    end
end
-- Inventory clearer player: objectref
function clua.reset_list(player)
    if player and type(player) == "userdata" then
        local inv = player:get_inventory()
        
        return inv:set_list("main", {})

    end
end
