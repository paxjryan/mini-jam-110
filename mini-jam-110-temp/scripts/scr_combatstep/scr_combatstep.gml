// Run by combatController
function scr_combatStep() {
	// loop through battleEntities
	
	// tick down speed
	with currentAttacker var sp = scr_loseSpeed(1);

	// it is time to attack!
	if (sp <= 0) {
		// build and resolve attack
		scr_buildAttack(currentAttacker);
		// reset speed to full
		with currentAttacker scr_setSpeed(maxSpeed);
	}
	if(scr_checkCombatFinished()){
		return false;
	}
	currentAttacker = ds_map_find_next(battleEntities, currentAttacker);
	if(is_undefined(currentAttacker)){
		currentAttacker = ds_map_find_first(battleEntities);
	}
}