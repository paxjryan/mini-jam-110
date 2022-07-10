// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getChar(n){
	return obj_controller.party[n];
}

function scr_getCharName(n) {
	return obj_controller.party[n].name;	
}

function scr_getCharDescription(n) {
	return obj_controller.party[n].description;
}

function scr_getCharQuest(n) {
	return "quest: " + obj_controller.party[n].quest;
}

function scr_getCharSkills(n) {
	return obj_controller.party[n].skills;
}