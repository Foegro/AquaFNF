scroll = 0
scroll_goal = 0
playing = false
song = noone
player_voice = noone
enemy_voice = noone
enum note_modes {
	place,
	extend
}
note_mode = note_modes.place

song_edit_id = ""
player_voice_edit_id = ""
enemy_voice_edit_id = ""
note_speed_edit_id = ""
save = function() {
	var f = file_text_open_write(global.edit_song_file)
	file_text_write_string(f,json_stringify(global.edit_song,true))
	file_text_close(f)
}
note_editor = false