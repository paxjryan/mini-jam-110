// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getChar(partyIndex){
	return obj_controller.party[partyIndex];
}

function scr_getCharName(partyIndex) {
	return scr_getChar(partyIndex).name;	
}

function scr_getCharDescription(partyIndex) {
	return scr_getChar(partyIndex).description;
}

function scr_getCharQuest(partyIndex) {
	return obj_controller.party[partyIndex].quest;
}

function scr_getCharSkills(partyIndex) {
	return obj_controller.party[partyIndex].skills;
}

function scr_getCharCombatSprite(partyIndex) {
	return obj_controller.party[partyIndex].combatSprite;
}
function scr_getCharMaxHealth(partyIndex) {
	return obj_controller.party[partyIndex].maxHealth;
}
function scr_getCharMaxSpeed(partyIndex) {
	return obj_controller.party[partyIndex].maxSpeed;
}
function scr_getCharArmor(partyIndex) {
	return obj_controller.party[partyIndex].armor;
}
function scr_getCharAttack(partyIndex) {
	return obj_controller.party[partyIndex].attack;
}