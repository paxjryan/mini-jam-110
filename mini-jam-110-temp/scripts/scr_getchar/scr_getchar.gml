// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getChar(partyIndex){
	return obj_controller.party[partyIndex];
}

function scr_getCharName(partyIndex) {
	return obj_controller.party[partyIndex].name;	
}

function scr_getCharDescription(partyIndex) {
	return obj_controller.party[partyIndex].description;
}

function scr_getCharQuest(partyIndex) {
	return "quest: " + obj_controller.party[partyIndex].quest;
}

function scr_getCharSkills(partyIndex) {
	return obj_controller.party[partyIndex].skills;
}