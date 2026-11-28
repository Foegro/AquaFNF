scroll = lerp(scroll,scroll_goal,0.1)
if (scroll_goal < 0) scroll_goal = lerp(scroll_goal,0,0.1)
if (playing) {
	var pos = -1
	if (song) pos = audio_sound_get_track_position(song)
	else if (player_voice) audio_sound_get_track_position(player_voice)
	else audio_sound_get_track_position(enemy_voice)
	scroll = pos*global.edit_song.note_speed
	scroll_goal = scroll
}