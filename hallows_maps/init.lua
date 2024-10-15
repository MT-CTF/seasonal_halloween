if (os.date("%m") ~= "10" or tonumber(os.date("%d")) < 17) and os.date("%m") ~= "11" then return end

ctf_map.register_maps_dir(minetest.get_modpath(minetest.get_current_modname()).."/maps/")