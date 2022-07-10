function scr_initiateCombat(fightNumber){
	// set characters and enemies. earlier in array is towards bottom of screen
	//this array should be gotten from the 'pick your characters to fight' screen but for now is fine
	var partyPositions = [false, false, false, false];
	// silly thing I need to do bc macros can't be lists
	var enemyX = [ENEMY_0_X, ENEMY_1_X, ENEMY_2_X, ENEMY_3_X]
	var enemyY = [ENEMY_0_Y, ENEMY_1_Y, ENEMY_2_Y, ENEMY_3_Y]
	
	// get fight info. Consider also getting scenario name
	var enemyFront = obj_controller.fights[fightNumber].front;
	var enemyBack = obj_controller.fights[fightNumber].back;
	for (var i = 0; i < array_length(obj_controller.party); i++) {
		if(scr_getCharPartyPosition(i) < 4){
			partyPositions[getCharPosition(i)] = getChar(i);
		}
	}
	
	//finally store the long term combat info
	charFrontline = [scr_createCombatChar(CHAR_0_X, CHAR_0_Y, 0), scr_createCombatChar(CHAR_1_X, CHAR_1_Y, 1)]
	charBackline = [scr_createCombatChar(CHAR_2_X, CHAR_2_Y, 2), scr_createCombatChar(CHAR_3_X, CHAR_3_Y, 3)]
	
	enemyBackline = []
	enemyFrontline = []
	for (var i = 0; i < array_length(enemyFront); i++) {
		array_push(enemyFrontline, scr_createEnemyObj(enemyX[i], enemyY[i], scr_enemyToIndex(enemyFront[i])))
	}
	while(array_length(enemyFrontline) < 2){
		array_push(enemyFrontline, false)
	}
	for (var i = 0; i < array_length(enemyBack); i++) {
		array_push(enemyBackline, scr_createEnemyObj(enemyX[i + 2], enemyY[i + 2], scr_enemyToIndex(enemyBack[i])))
	}
	while(array_length(enemyBackline) < 2){
		array_push(enemyBackline, false)
	}
}

function scr_createCombatChar(start_x, start_y, char_position){
	if(!partyPositions[char_position]){
		return false;
	}
	var _char = instance_create_layer(start_x,start_y, "Instances",obj_combatChar);
	_char.sprite_index = asset_get_index(partyPositions[char_position].combatSprite);
	_char.image_index = 0;
	return _char;
}