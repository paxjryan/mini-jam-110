// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_getEvent(n) {
	return obj_controller.events[n];
}

function scr_getEventName(n) {
	return obj_controller.events[n].name;	
}

function scr_getEventAction1(n) {
	return obj_controller.events[n].action1;
}

function scr_getEventAction2(n) {
	return obj_controller.events[n].action2;
}