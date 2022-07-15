// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_getEvent(eventIndex) {
	return obj_controller.events[eventIndex];
}

function scr_getEventName(eventIndex) {
	return obj_controller.events[eventIndex].name;	
}

function scr_getEventAction1(eventIndex) {
	return obj_controller.events[eventIndex].action1;
}

function scr_getEventAction2(eventIndex) {
	return obj_controller.events[eventIndex].action2;
}