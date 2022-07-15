// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getChar(partyIndex){
	return obj_controller.party[partyIndex];
}

function scr_getCharName(partyIndex) {
	return scr_getChar(partyIndex).charName;	
}

function scr_getCharDescription(partyIndex) {
	return scr_getChar(partyIndex).description;
}

function scr_getCharQuest(partyIndex) {
	return scr_getChar(partyIndex).quest;
}

function scr_getCharSkillTree(partyIndex) {
	return scr_getChar(partyIndex).skills;
}

function scr_getCharCombatSprite(partyIndex) {
	return scr_getChar(partyIndex).combatSprite;
}

function scr_getCharMaxHealth(partyIndex) {
	return scr_getChar(partyIndex).maxHealth;
}

function scr_getCharMaxSpeed(partyIndex) {
	return scr_getChar(partyIndex).maxSpeed;
}

function scr_getCharArmor(partyIndex) {
	return scr_getChar(partyIndex).armor;
}

function scr_getCharAttackAttributes(partyIndex) {
	return scr_getChar(partyIndex).attackAttributes;
}

function scr_getCharExp(partyIndex) {
	return scr_getChar(partyIndex).exp;
}

function scr_getCharQuestsCompleted(partyIndex) {
	return scr_getChar(partyIndex).questsCompleted;
}

function scr_getCharSkillsCompleted(partyIndex) {
	return scr_getChar(partyIndex).skillsCompleted;
}

function scr_getCharPartyPosition(partyIndex) {
	return scr_getChar(partyIndex).partyPosition;
}