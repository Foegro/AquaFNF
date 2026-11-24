if (async_load[?"status"]) {
	switch (async_load[?"id"]) {
		case song_edit_id:
			var song = asset_get_index(async_load[?"result"])
			if (song != -1) {
				global.edit_song.song = song
				save()
			} else {
				show_message_async("Song doesn't exist")
			}
			break
		case player_voice_edit_id:
			var plr_voice = asset_get_index(async_load[?"result"])
			if (plr_voice != -1) {
				global.edit_song.player_voice = plr_voice
				save()
			} else {
				show_message_async("Song doesn't exist")
			}
			break
		case enemy_voice_edit_id:
			var enemy_voice = asset_get_index(async_load[?"result"])
			if (enemy_voice != -1) {
				global.edit_song.enemy_voice = enemy_voice
				save()
			} else {
				show_message_async("Song doesn't exist")
			}
			break
		case note_speed_edit_id:
			global.edit_song.note_speed = async_load[?"value"]
			save()
			break
	}
}