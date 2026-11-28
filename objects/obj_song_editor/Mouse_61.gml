if (note_editor) {
	if (!playing && point_in_rectangle(mouse_x,mouse_y,640/4-32-64-32,96,640*3/4+32+64+32,480)) {
		scroll_goal += 16
	}
} else {
	if (point_in_rectangle(mouse_x,mouse_y,16,480*2/3-16-8,32,480*2/3-16+8)) {
		global.edit_song.note_speed--
		save()
	}
}