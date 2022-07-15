// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getEnemyMatch(enemyString) {
	for (var i = 0; i < array_length(obj_controller.enemies); i++) {
		if (obj_controller.enemies[i].enemyName == enemyString) return i;
	}
	
	// enemyString unrecognized
	throw("unrecognized enemy name: " + enemyString);
	return -1;
}