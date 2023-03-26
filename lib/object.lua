-- CLua Objects Manager
function clua.is_punchable_obj(obj)
    if obj then
        armor = obj:get_armor_groups()
        if armor.immortal == nil or armor.immortal == 0 or armor.immortal == false or armor.immortal == " " then
            return true
        else
            return false
        end
    end
end