// Run by combatController
function scr_initiateCombat(fightIndex) {
	// array of combat characters and enemies, where position in array matches battle position
	combatChars = [];
	combatEnemies = [];
	
	// add combat characters to battleEntities
	for (var i = 0; i < array_length(obj_controller.party); i++) {
		// for debug
		show_debug_message("Character added to combat: " + obj_controller.party[i].charName + " at position: " + string(obj_controller.party[i].partyPosition));
		
		var partyPos = obj_controller.party[i].partyPosition;
		combatChars[partyPos] = scr_createCombatChar(partyPos);
	}
	
	// should really add support for more than two cols of enemies by turning these into a for loop,
	// and the json from "front" and "back" attributes into a 2d array
	
	// add front enemies to battleEntities
	var enemyFront = obj_controller.fights[fightIndex].front;
	for (var i = 0; i < array_length(enemyFront); i++) {
		// for debug
		show_debug_message("Enemy added to combat: " + enemyFront[i] + " at position: " + string(PARTY_SIZE+i));
		
		combatEnemies[i] = scr_createEnemy(scr_getEnemyMatch(enemyFront[i]), i);
	}
	
	// add back enemies to battleEntities
	var enemyBack = obj_controller.fights[fightIndex].back;
	for (var i = 0; i < array_length(enemyBack); i++) {
		// for debug
		show_debug_message("Enemy added to combat: " + enemyBack[i] + " at position: " + string(PARTY_SIZE+2+i));
		
		combatEnemies[i+2] = scr_createEnemy(scr_getEnemyMatch(enemyBack[i]), i+2);
	}
	
	// initialize nextAttackerPos for scr_getNextAttacker
	nextAttackerPos = -1;
}

// returns the index in obj_controller.enemies of the enemy whose name matches enemyString
function scr_getEnemyMatch(enemyString) {
	for (var i = 0; i < array_length(obj_controller.enemies); i++) {
		if (obj_controller.enemies[i].enemyName == enemyString) return i;
	}
	
	// enemyString unrecognized
	throw("unrecognized enemy name: " + enemyString);
	return -1;
}