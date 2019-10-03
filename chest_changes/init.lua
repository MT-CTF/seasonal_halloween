minetest.override_item("tsm_chests:chest", {
	on_rightclick = function(pos)
		spooky_effects.spawn_ghost(pos)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from chest at " .. minetest.pos_to_string(pos))
		local inv = minetest.get_inventory({type = "node", pos=pos})
		if not inv or inv:is_empty("main") then
			minetest.set_node(pos, {name="air"})
			minetest.show_formspec(player:get_player_name(), "", player:get_inventory_formspec())

			spooky_effects.spawn_angry_ghost(pos, player)
		end
	end,
})
