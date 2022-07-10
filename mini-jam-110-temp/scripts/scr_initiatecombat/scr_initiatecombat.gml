function scr_initiateCombat(fightNumber){
	fightnum = fightNumber
	// set characters and enemies. earlier in array is towards bottom of screen
	//this array should be gotten from the 'pick your characters to fight' screen but for now is fine
	partyPositions = [false, false, false, false];
	
	// silly thing I need to do bc macros can't be lists
	var enemyX = [ENEMY_0_X, ENEMY_1_X, ENEMY_2_X, ENEMY_3_X]
	var enemyY = [ENEMY_0_Y, ENEMY_1_Y, ENEMY_2_Y, ENEMY_3_Y]
	var charX = [CHAR_0_X, CHAR_1_X, CHAR_2_X, CHAR_3_X]
	var charY = [CHAR_0_Y, CHAR_1_Y, CHAR_2_Y, CHAR_3_Y]
	
	// get fight info. Consider also getting scenario name
	var enemyFront = obj_controller.fights[fightNumber].front;
	var enemyBack = obj_controller.fights[fightNumber].back;
	for (var i = 0; i < array_length(obj_controller.party); i++) {
		if(scr_getCharPartyPosition(i) < 4){
			partyPositions[scr_getCharPartyPosition(i)] = scr_getChar(i);
		}
	}
	
	//finally store the long term combat info. These are the important variables for obj_combatController
	
	charFrontline = []
	charBackline = []
	for (var i = 0; i < 2; i++) {
		if(partyPositions[i] != false){
			array_push(charFrontline, scr_createCombatChar(charX[i], charY[i], i))
		}
	}
	for (var i = 2; i < 4; i++) {
		if(partyPositions[i] != false){
			array_push(charBackline, scr_createCombatChar(charX[i], charY[i], i))
		}
	}
	
	enemyBackline = [];
	enemyFrontline = [];
	
	for (var i = 0; i < array_length(enemyFront); i++) {
		array_push(enemyFrontline, scr_createEnemyObj(enemyX[i], enemyY[i], scr_enemyToIndex(enemyFront[i])))
		enemyFrontline[i].position = i;
	}
	for (var i = 0; i < array_length(enemyBack); i++) {
		array_push(enemyBackline, scr_createEnemyObj(enemyX[i + 2], enemyY[i + 2], scr_enemyToIndex(enemyBack[i])))
		enemyBackline[i].position = i + 2;
	}
}

function scr_createCombatChar(start_x, start_y, char_position){
	if(!partyPositions[char_position]){
		return false;
	}
	var _char = instance_create_layer(start_x,start_y, "Instances",obj_combatChar);
	_char.owner = partyPositions[char_position];
	_char.position = char_position;
	with _char
	{
		armor = owner.armor;
		attackAttributes = owner.attackAttributes;
		speedOffset = owner.speedOffset;
		sprite_index = asset_get_index(owner.combatSprite);
		image_index = 0;
		scr_setMaxHealth(owner.maxHealth);
		scr_setMaxSpeed(owner.maxSpeed);
		scr_setHealth(maxHealth);
		scr_setSpeed(max(maxSpeed - speedOffset, 0));
	}
	return _char;
}