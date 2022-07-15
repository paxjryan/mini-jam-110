// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createCharObj(n) {
	var charObj = instance_create_layer(0, 0, "Instances", obj_char);
	
	charObj.charName = obj_controller.chars[n].charName;
	charObj.description = obj_controller.chars[n].description;
	charObj.quest = obj_controller.chars[n].quest;
	charObj.skillTree = obj_controller.chars[n].skills;
	charObj.combatSprite = obj_controller.chars[n].combatSprite;
	charObj.maxHealth = obj_controller.chars[n].maxHealth;
	charObj.maxSpeed = obj_controller.chars[n].maxSpeed;
	charObj.armor = obj_controller.chars[n].armor;
	charObj.attackAttributes = obj_controller.chars[n].attack;
	
	charObj.exp = 0;
	charObj.questsCompleted = "";
	charObj.skillsCompleted = "";
	charObj.partyPosition = array_length(obj_controller.party); // add to the end of party
	charObj.speedOffset = 0;
	
	return charObj;
}