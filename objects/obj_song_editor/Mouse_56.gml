if (note_editor) {
	
} else {
	if (point_in_rectangle(mouse_x,mouse_y,16,480/3-32-8,32,480/3-32+8)) {
		song_edit_id = get_string_async("Song asset name","")
	}
	if (point_in_rectangle(mouse_x,mouse_y,16,480/3-8,32,480/3+8)) {
		player_voice_edit_id = get_string_async("Player voice asset name","")
	}
	if (point_in_rectangle(mouse_x,mouse_y,16,480/3+32-8,32,480/3+32+8)) {
		enemy_voice_edit_id = get_string_async("Enemy voice asset name","")
	}
	if (point_in_rectangle(mouse_x,mouse_y,16,480*2/3-16-8,32,480*2/3-16+8)) {
		note_speed_edit_id = get_integer_async("Note speed (pixels per second)",0)
	}
	if (point_in_rectangle(mouse_x,mouse_y,16,480*2/3+16-8,32,480*2/3+16+8)) {
		note_editor = true
	}
}