/// @description Insert description here
// You can write your code in this editor

// Parse rooms.json
if (file_exists("events.json")) {
	var eventsString = "";
	var _file = file_text_open_read("events.json");
	
	while(file_text_eof(_file) == false) {
		eventsString += file_text_readln(_file);
	}

	file_text_close(_file);
	events = json_parse(eventsString);
} 


// Parse characters.json
if (file_exists("characters.json")) {
	var charsString = "";
	var _file = file_text_open_read("characters.json");
	
	while(file_text_eof(_file) == false) {
		charsString += file_text_readln(_file);
	}

	file_text_close(_file);
	chars = json_parse(charsString);
} 

// Initialize event and char
currentEvent = 0;
currentChar = 0;

// Initialize party to hold only main character
party = [];
array_push(party, scr_createCharObj(0));
array_push(party, scr_createCharObj(1));
array_push(party, scr_createCharObj(2));
//array_push(party, scr_createCharObj(3));