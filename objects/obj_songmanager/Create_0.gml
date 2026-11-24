arrow_colors = [
	make_colour_rgb(93,36,200),
	make_colour_rgb(70,83,245),
	make_colour_rgb(50,160,222),
	make_colour_rgb(147,60,188),
]

pixels_per_second = 64*3
hp = 50
visual_hp = 50
current_score = 0
combo = 0
misses = 0
hits = []
accuracy = function() {
	if (array_length(hits) == 0) return 1
	return array_reduce(hits,function(p,c,i) {
		return p+c
	},0)/array_length(hits)
}

if (global.right_side) {
	enemy = instance_create_depth(640/4,240,0,obj_singer,{right_side:false,sprite_set:global.sprite_sets.enemy})
	player = instance_create_depth(640*3/4,240,0,obj_singer,{right_side:true,image_xscale:-1,sprite_set:global.sprite_sets.player})
} else {
	player = instance_create_depth(640/4,240,0,obj_singer,{right_side:false,sprite_set:global.sprite_sets.player})
	enemy = instance_create_depth(640*3/4,240,0,obj_singer,{right_side:true,image_xscale:-1,sprite_set:global.sprite_sets.enemy})
}

enum sides {
	player,
	enemy
}
enum dirs {
	left,
	down,
	up,
	right
}

arrows = [
	{
		side: sides.enemy,
		dir: dirs.left,
		distance: 5
	},
	{
		side: sides.enemy,
		dir: dirs.down,
		distance: 6
	},
	{
		side: sides.enemy,
		dir: dirs.up,
		distance: 7
	},
	{
		side: sides.enemy,
		dir: dirs.right,
		distance: 8
	},
	{
		side: sides.player,
		dir: dirs.left,
		distance: 9
	},
	{
		side: sides.player,
		dir: dirs.down,
		distance: 10
	},
	{
		side: sides.player,
		dir: dirs.up,
		distance: 11
	},
	{
		side: sides.player,
		dir: dirs.right,
		distance: 12
	},
]