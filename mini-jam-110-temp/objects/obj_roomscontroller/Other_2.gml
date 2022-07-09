/// @description Insert description here
// You can write your code in this editor

var _string = "";

if (file_exists("rooms.json")) {
	
	
	var _file = file_text_open_read("rooms.json");
	
	while(file_text_eof(_file) == false) {
		_string += file_text_readln(_file);
	}

	file_text_close(_file);
} 

roomDescription = "";

rooms = json_parse( _string);

scr_loadRoom(0);