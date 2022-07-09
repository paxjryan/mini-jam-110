// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionSelected(action) {
	if (action == 1) {
		var roomGoto = obj_roomsController.currentRoom.action1;
	} else if (action == 2) {
		var roomGoto = obj_roomsController.currentRoom.action2;
	}
	
	scr_loadRoom(roomGoto);
}