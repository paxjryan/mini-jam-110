// REPLACE WITH ONE FILE scr_createCombatEntity WHICH INCLUDES:
// scr_createCombatEntity()
// scr_createCombatChar() -- calls createCombatEntity
// scr_createCombatEnemy() -- calls createCombatEntity



// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createCombatChar(partyIndex) {	
	var charXs = [CHAR_0_X, CHAR_1_X, CHAR_2_X, CHAR_3_X];
	var charYs = [CHAR_0_Y, CHAR_1_Y, CHAR_2_Y, CHAR_3_Y];
	
	var _char = instance_create_layer(charXs[partyIndex], charYs[partyIndex], "Instances", obj_combatChar);
	_char.side = CHAR_SIDE;
	
	// get attributes from obj_controller.party
	_char.entityName = scr_getCharName(partyIndex);
	_char.partyIndex = partyIndex;
	_char.maxHealth = scr_getCharMaxHealth(partyIndex);
	_char.maxSpeed = scr_getCharMaxSpeed(partyIndex);
	_char.armor = scr_getCharArmor(partyIndex);
	_char.attackAttributes = scr_getCharAttackAttributes(partyIndex);
	
	_char.sprite_index = asset_get_index(scr_getCharCombatSprite(partyIndex));
	//_char.visible = false;
	
	with _char
	{
		maxHealthBox = scr_createMaxHealthBox();
		healthBox = scr_createHealthBox();
		maxSpeedBox = scr_createMaxSpeedBox();
		speedBox = scr_createSpeedBox();
		shieldBox = scr_createShieldBox();
		
		scr_setMaxHealth(maxHealth);
		scr_setHealth(maxHealth);
		scr_setMaxSpeed(maxSpeed);
		scr_setSpeed(maxSpeed);
		scr_setMaxShield(BASIC_CHAR_MAX_SHIELD);
		scr_setShield(0);
	}
	
	return _char;
}