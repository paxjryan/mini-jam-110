function scr_initiateCombat(){
	// set characters and enemies. earlier in array is towards bottom of screen
	charFrontline = [scr_createCombatChar(CHAR_1_X, CHAR_1_Y, 1), scr_createCombatChar(CHAR_2_X, CHAR_2_Y, 2)]
	charBackline = [scr_createCombatChar(CHAR_3_X, CHAR_3_Y, 3), scr_createCombatChar(CHAR_4_X, CHAR_4_Y, 4)]
	//enemyFrontline = [scr_createCombatChar(CHAR_1_X, CHAR_1_Y, 1), scr_createCombatChar(CHAR_2_X, CHAR_2_Y, 2)]
	//enemyBackline = [scr_createCombatChar(CHAR_1_X, CHAR_1_Y, 1), scr_createCombatChar(CHAR_2_X, CHAR_2_Y, 2)]
}

function scr_createCombatChar(start_x, start_y, char_position){
	var _char = instance_create_layer(start_x,start_y, "Instances",obj_combatChar);
	_char.sprite_index = asset_get_index(scr_getCharCombatSprite(char_position - 1));
	_char.image_index = 0;
	return _char;
}