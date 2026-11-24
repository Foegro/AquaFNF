if (async_load[?"id"] == get_string_id && async_load[?"status"]) {
	if (!file_exists($"songs/{async_load[?"result"]}.json")) file_copy("song_template.json",$"songs/{async_load[?"result"]}.json")
	global.edit_song_file = $"songs/{async_load[?"result"]}.json"
	global.edit_song = json_read(global.edit_song_file)
	room_goto(rm_song_editor)
}