// Run by combatController
function scr_initiateCombat(fightIndex){
	// Create a ds_map of battleEntities where:
	// - key is battleEntity
	// - value is battle position:
	//		0-3 characters (bottom front, top front, bottom back, top back)
	//		4-7 enemies (bottom front, top front, bottom back, top back)
	battleEntities = ds_map_create();
	
	// add combat characters to battleEntities
	for (var i = 0; i < array_length(obj_controller.party); i++) {
		ds_map_add(battleEntities, scr_createCombatChar(i), obj_controller.party[i].partyPosition);
	}
	
	// should really implement enemy party size sooner or later
	// add front enemies to battleEntities
	var enemyFront = obj_controller.fights[fightIndex].front;
	for (var i = 0; i < array_length(enemyFront); i++) {
		ds_map_add(battleEntities, scr_createEnemy(scr_getEnemyMatch(enemyFront[i]), i), PARTY_SIZE+i);
	}
	
	// add back enemies to battleEntities
	var enemyBack = obj_controller.fights[fightIndex].back;
	for (var i = 0; i < array_length(enemyBack); i++) {
		ds_map_add(battleEntities, scr_createEnemy(scr_getEnemyMatch(enemyBack[i]), i+(PARTY_SIZE/2)), PARTY_SIZE+2+i);
	}
}