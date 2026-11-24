visual_hp = lerp(visual_hp,hp,0.1)
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
		var hit = false
		switch (arrow.dir) {
			case dirs.left:
				if (keyboard_check(vk_left) || keyboard_check(ord("A"))) hit = true
				break
			case dirs.down:
				if (keyboard_check(vk_down) || keyboard_check(ord("S"))) hit = true
				break
			case dirs.up:
				if (keyboard_check(vk_up) || keyboard_check(ord("W"))) hit = true
				break
			case dirs.right:
				if (keyboard_check(vk_right) || keyboard_check(ord("D"))) hit = true
				break
		}
		if ((arrow[$"hit"] ?? false) && !(arrow[$"missed"] ?? false) && arrow.distance > -(arrow[$"length"] ?? 0)) {
			if (hit) {
				current_score += 60/fps
				hp = min(100,hp+5/fps)
				player.move(arrow.dir)
			} else {
				arrow.missed = true
				hp -= 10
				combo = 0
				misses++
				array_push(hits,0)
			}
		}
		if (abs(arrow.distance) < 0.1) {
			hit = false
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
				if (struct_exists(arrow,"length")) {
					current_score += lerp(0,500+combo*10,abs(arrow.distance*arrow.distance)*100)
					array_push(hits,0.5+abs(arrow.distance)*5)
					combo++
					hp = min(100,hp+5)
					player.move(arrow.dir)
					arrow.hit = true
				} else {
					current_score += lerp(0,500+combo*10,abs(arrow.distance*arrow.distance)*100)
					array_push(hits,0.5+abs(arrow.distance)*5)
					combo++
					hp = min(100,hp+5)
					array_delete(arrows,i,1)
					player.move(arrow.dir)
					i--
				}
			}
		} else if (arrow.distance < -0.1 && !(arrow[$"missed"] ?? false) && !(arrow[$"hit"] ?? false)) {
			arrow.missed = true
			hp -= 10
			combo = 0
			misses++
			array_push(hits,0)
		}
		
		if (arrow.distance+(arrow[$"length"] ?? 0) < -1) {
			array_delete(arrows,i,1)
			i--
		}
	}
}