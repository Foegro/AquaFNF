if (note_editor) {
	if (point_in_rectangle(mouse_x,mouse_y,320-24,480/2-64-32-24,320+24,480/2-64-32+24)) {
		note_mode = note_modes.place
	}
	if (point_in_rectangle(mouse_x,mouse_y,320-24,480/2-64+32-24,320+24,480/2-64+32+24)) {
		note_mode = note_modes.extend
	}
	if (point_in_rectangle(mouse_x,mouse_y,320-24,480/2+32-24,320+24,480/2+32+24)) {
		if (playing) {
			playing = false
			if (global.edit_song.song != "") song = audio_stop_sound(global.edit_song.song)
			if (global.edit_song.player_voice != "") player_voice = audio_stop_sound(global.edit_song.player_voice)
			if (global.edit_song.enemy_voice != "") enemy_voice = audio_stop_sound(global.edit_song.enemy_voice)
		} else {
			playing = true
			var start_time = scroll/global.edit_song.note_speed
			if (global.edit_song.song != "") song = audio_play_sound(global.edit_song.song,0,false,1,start_time)
			if (global.edit_song.player_voice != "") player_voice = audio_play_sound(global.edit_song.player_voice,0,false,1,start_time)
			if (global.edit_song.enemy_voice != "") enemy_voice = audio_play_sound(global.edit_song.enemy_voice,0,false,1,start_time)
			if (song == noone && player_voice == noone && enemy_voice == noone) playing = false
		}
	}
	if (point_in_rectangle(mouse_x,mouse_y,640/4-32-64-32,96,640/4-32-64-32+64*4,480)) {
		
	}
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