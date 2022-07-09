// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_loadRoom(rm = 0) {
	obj_roomsController.currentRoom = obj_roomsController.rooms[rm];
	
	obj_roomsController.roomDescription = obj_roomsController.currentRoom.name;
}