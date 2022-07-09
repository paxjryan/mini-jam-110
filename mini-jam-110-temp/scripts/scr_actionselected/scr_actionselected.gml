// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionSelected(action) {
	if (action == 1) {
		scr_setCurrentEvent(scr_getCurrentEvent().action1);
	} else if (action == 2) {
		scr_setCurrentEvent(scr_getCurrentEvent().action2);
	}
}