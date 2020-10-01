spooky_effects = {}

function spooky_effects.spawn_ghost(pos, vel, accel)
	minetest.add_particle({
		pos = pos,
		velocity = vel or {x=math.random(-0.5, 0.5), y=3, z=math.random(-0.5, 0.5)},
		acceleration = accel or {x=0, y=0.5, z=0},
		expirationtime = 1.5,
		size = 8,
		collisiondetection = false,
		collision_removal = false,
		object_collision = false,
		vertical = true,
		texture = "spooky_effects_ghost.png",
		glow = 8
	})
end

function spooky_effects.spawn_angry_ghost(pos, target, vel, accel)
	if not target then
		minetest.log("[ERROR] target for angry ghost not found!")
	end

	local dest = target:get_pos()
	dest.y = dest.y + 1.3

	minetest.add_particle({
		pos = pos,
		velocity = vector.multiply(vector.direction(pos, dest), vel or 8),
		acceleration = accel or {x=0, y=0, z=0},
		expirationtime = 1.5,
		size = 10,
		collisiondetection = false,
		collision_removal = true,
		object_collision = true,
		texture = "spooky_effects_ghost_angry.png",
		playername = target:get_player_name(),
		glow = 8
	})
end

ctf.register_on_killedplayer(function(victim, killer)
	spooky_effects.spawn_angry_ghost(minetest.get_player_by_name(victim):get_pos(), minetest.get_player_by_name(killer))
end)
