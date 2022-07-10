// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createEnemyObj(xPosition, yPosition, n) {
	var _enemyObj = instance_create_layer(xPosition, yPosition, "Instances", obj_enemy);
	_enemyObj.enemyName = obj_controller.enemies[n].enemyName;
	_enemyObj.description = obj_controller.enemies[n].description;
	_enemyObj.sprite_index = asset_get_index(obj_controller.enemies[n].combatSprite);
	_enemyObj.maxHealth = obj_controller.enemies[n].maxHealth;
	_enemyObj.maxSpeed = obj_controller.enemies[n].maxSpeed;
	_enemyObj.speedOffset = obj_controller.enemies[n].speedOffset;
	_enemyObj.armor = obj_controller.enemies[n].armor;
	_enemyObj.attack = obj_controller.enemies[n].attack;
	
	_enemyObj.attackAttributes = scr_parseAttack(enemyObj.attack);
	
	with _enemyObj
	{
		scr_setMaxHealth(maxHealth)
		scr_setMaxSpeed(maxSpeed)
		scr_setHealth(maxHealth)
		scr_setSpeed(maxSpeed)
	}
	return _enemyObj;
}