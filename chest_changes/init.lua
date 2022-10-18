if os.date("%m") ~= "10" or tonumber(os.date("%d")) < 17 then return end

local def = table.copy(minetest.registered_nodes["ctf_map:chest"])

minetest.override_item("ctf_map:chest", {
	on_rightclick = function(pos, ...)
		spooky_effects.spawn_ghost(pos)

		return def.on_rightclick(pos, ...)
	end,
})

minetest.override_item("ctf_map:chest_opened", {
	on_metadata_inventory_take = function(pos, listname, index, stack, player, ...)
		if math.random(1, 4) == 1 then
			spooky_effects.spawn_angry_ghost(pos, player)
		end

		return def.on_metadata_inventory_take(pos, listname, index, stack, player, ...)
	end,
})
