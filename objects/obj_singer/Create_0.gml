sprite_index = sprite_set.idle
move_time = 0
move = function(dir) {
	move_time = 30
	switch (dir) {
		case dirs.left:
			sprite_index = (image_xscale < 0) ? sprite_set.right : sprite_set.left
			break
		case dirs.down:
			sprite_index = sprite_set.down
			break
		case dirs.up:
			sprite_index = sprite_set.up
			break
		case dirs.right:
			sprite_index = (image_xscale < 0) ? sprite_set.left : sprite_set.right
			break
	}
}