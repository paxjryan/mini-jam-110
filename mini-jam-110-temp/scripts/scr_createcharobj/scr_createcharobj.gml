// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createCharObj(n) {
	var charObj = instance_create_layer(0, 0, "Instances", obj_char);
	
	charObj.name = scr_getCharName(n);
	charObj.description = scr_getCharDescription(n);
	charObj.quest = scr_getCharQuest(n);
	charObj.skillTree = scr_getCharSkills(n);
	
	charObj.exp = 0;
	charObj.quests = "";
	charObj.skills = "";
	charObj.partyPosition = array_length(obj_controller.party); // add to the end of party
	
	return charObj;
}