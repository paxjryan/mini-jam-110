// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_charButtonSelected(button) {
	if (obj_controller.buttonSelected == "") {
		obj_controller.buttonSelected = button;
		obj_controller.currentChar = button.buttonId;
	} else if (obj_controller.buttonSelected == button) {
		obj_controller.buttonSelected = "";
		room_goto(rm_character);
	} else {
		obj_controller.buttonSelected = "";
		
		temp = obj_controller.buttonSelected.buttonId;
		obj_controller.buttonSelected.buttonId = button.buttonId;
		button.buttonId = temp;
}