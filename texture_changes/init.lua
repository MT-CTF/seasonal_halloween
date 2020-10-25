minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_nodes) do
		if def.tiles then
			for key, texture in ipairs(def.tiles) do
				if type(texture) == "string" then
					def.tiles[key] = "(" .. texture .. ")" .. get_color(texture)
				elseif type(texture) == "table" then
					if texture.image then
						def.tiles[key].image = "(" .. texture.image..")" .. get_color(texture.image)
					elseif texture.name then
						def.tiles[key].name = "(" .. texture.name..")" .. get_color(texture.name)
					end
				end
			end

			minetest.override_item(name, {def.tiles})
		elseif def.special_tiles then
			for key, texture in ipairs(def.special_tiles) do
				if type(texture) == "string" then
					def.special_tiles[key] = "(" .. texture .. ")" .. get_color(texture)
				elseif type(texture) == "table" then
					if texture.image then
						def.special_tiles[key].image = "(" .. texture.image..")" .. get_color(texture.image)
					elseif texture.name then
						def.special_tiles[key].name = "(" .. texture.name..")" .. get_color(texture.name)
					end
				end
			end

			minetest.override_item(name, {def.special_tiles})
		end
	end

	local tools = {"sword", "pick", "axe", "shovel"}
	for name, def in pairs(minetest.registered_tools) do
		for _, tool in ipairs(tools) do
			if name:find(tool) then
				local wield_image

				if tool == "shovel" then
					wield_image = def.wield_image.."^(overlay_shovel.png^[transformR90)"
				end

				minetest.override_item(name, {
					inventory_image = ("%s^overlay_%s.png"):format(def.inventory_image, tool),
					wield_image = wield_image,
				})

				break
			end
		end
	end

	minetest.override_item("default:water_source", {post_effect_color = {a = 150, r = 67, g = 13, b = 13}})
	minetest.override_item("default:water_flowing", {post_effect_color = {a = 150, r = 67, g = 13, b = 13}})
end)

function get_color(texture)
	if texture:find("tree") and not (texture:find("aspen") or texture:find("leaves")) then -- Change trees to a dark grey/brown
		return "^[colorize:#171716:111"
	elseif texture:find("sand") then -- Make sands a bit darker too
		return "^[colorize:#4c4238:100"
	else -- Color a little orange
		return "^[colorize:#9b6300:40"
	end
end
