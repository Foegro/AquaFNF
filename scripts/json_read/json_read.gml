function json_read(json){
	var file = file_text_open_read(json)
	var str = ""
	while (!file_text_eof(file)) {
		str += file_text_readln(file)
	}
	return json_parse(str)
}