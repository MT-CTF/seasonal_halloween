unused_args = false

globals = {
	"minetest", "throwable_snow", "default", "ctf_teams", "hud_events",
	"spooky_effects", "ctf_api", "ctf_map", "ctf_modebase", "ctf_core",
}

read_globals = {
	string = {fields = {"split", "trim"}},
	table = {fields = {"copy", "getn", "indexof"}},

	"PlayerName",

	"dump", "DIR_DELIM",
	"sfinv", "creative",
	"VoxelArea", "ItemStack",
	"Settings",
	"prometheus", "hb",
	"awards",
	"vector",

	"VoxelArea",
	"VoxelManip",
	"PseudoRandom",


	-- Testing
	"describe",
	"it",
	"assert",
}
