-- Bedrock mod by ShadowNinja

local modpath = minetest.get_modpath("bedrock")

dofile(modpath.."/bar.lua")

if minetest.setting_getbool("generate_bedrock") then
	dofile(modpath.."/mapgen.lua")
end

minetest.register_node("bedrock:bedrock", {
	description = "Коренная порода",
	inventory_image = minetest.inventorycube("bedrock_bedrock.png"),
	tiles = {"bedrock_bedrock.png"},
	groups = {unbreakable=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("bedrock:concrete", {
	description = "Неломающийся бетон",
	inventory_image = minetest.inventorycube("bedrock_concrete.png"),
	tiles = {"bedrock_concrete.png"},
	groups = {unbreakable=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("bedrock:glass", {
	description = "Небьющееся стекло",
	drawtype = "glasslike",
	sunlight_propagates = true,
	inventory_image = minetest.inventorycube("default_glass.png"),
	paramtype = "light",
	tiles = {"default_glass.png"},
	groups = {unbreakable=1},
	sounds = default.node_sound_glass_defaults(),
})

stairs.register_stair_and_slab("bedrock", "bedrock:bedrock",
		{unbreakable=1},
		{"bedrock_bedrock.png"},
		"Ступенька из коренной породы",
		"Плита из коренной породы",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("unbreakable_concrete", "bedrock:concrete",
		{unbreakable=1},
		{"bedrock_concrete.png"},
		"Ступенька из неломающегося бетона",
		"Плита из неломающегося бетона",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("unbreakable_glass", "bedrock:glass",
		{unbreakable=1},
		{"default_glass.png"},
		"Ступенька из небьющегося стекла",
		"Плита из небьющегося стекла",
		default.node_sound_glass_defaults())

minetest.register_tool("bedrock:pick", {
	description = "Кирка из коренной породы",
	inventory_image = "bedrock_pick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			unbreakable={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3}
		}
	},
})

