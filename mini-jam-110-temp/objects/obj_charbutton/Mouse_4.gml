/// @description Insert description here
// You can write your code in this editor

//for (var i = 0; i < array_length(obj_controller.party); i++) {
	

if (selected == false) {
	selected = true;
	obj_controller.currentChar = buttonId;
	image_index = 2*buttonId + 1;
} else {
	selected = false;
	room_goto(rm_character);
}