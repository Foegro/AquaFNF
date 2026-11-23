for (var i = 0; i < array_length(arrows); i++) {
	var arrow = arrows[i]
	arrow.distance -= delta_time/1000000
	if (arrow.side == sides.enemy) {
		if (arrow.distance <= 0) {
			array_delete(arrows,i,1)
			enemy.move(arrow.dir)
			i--
		}
	} else {
		if (abs(arrow.distance) < 0.1) {
			var hit = false
			switch (arrow.dir) {
				case dirs.left:
					if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) hit = true
					break
				case dirs.down:
					if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) hit = true
					break
				case dirs.up:
					if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) hit = true
					break
				case dirs.right:
					if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) hit = true
					break
			}
			if (hit) {
				array_delete(arrows,i,1)
				player.move(arrow.dir)
				i--
			}
		}
	}
}