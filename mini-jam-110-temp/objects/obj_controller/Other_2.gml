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

// Parse enemies.json
if (file_exists("enemies.json")) {
	var enemiesString = "";
	var _file = file_text_open_read("enemies.json");
	
	while(file_text_eof(_file) == false) {
		enemiesString += file_text_readln(_file);
	}

	file_text_close(_file);
	enemies = json_parse(enemiesString);
} 

// Parse fights.json
if (file_exists("fights.json")) {
	var fightsString = "";
	var _file = file_text_open_read("fights.json");
	
	while(file_text_eof(_file) == false) {
		fightsString += file_text_readln(_file);
	}

	file_text_close(_file);
	fights = json_parse(fightsString);
} 

// Initialize event and char
currentEvent = 0;
currentChar = 0;

// Initialize party to hold only main character
party = [];
array_push(party, scr_createCharObj(0));
array_push(party, scr_createCharObj(1));
array_push(party, scr_createCharObj(2));
array_push(party, scr_createCharObj(3));

show_message(spr_healthBox);