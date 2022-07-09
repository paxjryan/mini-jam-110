// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionSelected(action) {
	if (action == 1) {
		obj_controller.currentEvent = scr_getEventAction1(obj_controller.currentEvent);
	} else if (action == 2) {
		obj_controller.currentEvent = scr_getEventAction2(obj_controller.currentEvent);
	}
}