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
		tempPartyPosition = obj_controller.party[obj_controller.buttonSelected.buttonId].partyPosition;
		obj_controller.party[obj_controller.buttonSelected.buttonId].partyPosition = 
			obj_controller.party[button.buttonId].partyPosition;
		obj_controller.party[button.buttonId].partyPosition = tempPartyPosition;
		
		tempId = obj_controller.buttonSelected.buttonId;
		obj_controller.buttonSelected.buttonId = button.buttonId;
		button.buttonId = tempId;
		
		obj_controller.buttonSelected = "";
	}
}