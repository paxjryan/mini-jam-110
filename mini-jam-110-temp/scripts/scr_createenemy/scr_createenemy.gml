// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_createEnemy(n, enemyPos) {
	var enemyXs = [ENEMY_0_X, ENEMY_1_X, ENEMY_2_X, ENEMY_3_X];
	var enemyYs = [ENEMY_0_Y, ENEMY_1_Y, ENEMY_2_Y, ENEMY_3_Y];
	
	var _enemyObj = instance_create_layer(enemyXs[enemyPos], enemyYs[enemyPos], "Instances", obj_enemy);
	
	// get attributes from json (obj_controller.enemies)
	_enemyObj.entityName = obj_controller.enemies[n].enemyName;
	_enemyObj.description = obj_controller.enemies[n].description;
	_enemyObj.maxHealth = obj_controller.enemies[n].maxHealth;
	_enemyObj.maxSpeed = obj_controller.enemies[n].maxSpeed;
	_enemyObj.speedOffset = obj_controller.enemies[n].speedOffset;
	_enemyObj.armor = obj_controller.enemies[n].armor;
	_enemyObj.attackAttributes = obj_controller.enemies[n].attack;
	
	_enemyObj.sprite_index = asset_get_index(obj_controller.enemies[n].combatSprite);
	
	with _enemyObj
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
		scr_setMaxShield(BASIC_ENEMY_MAX_SHIELD);
		scr_setShield(0);
	}
	
	return _enemyObj;
}