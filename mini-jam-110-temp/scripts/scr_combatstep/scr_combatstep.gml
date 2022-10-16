// Run by combatController
function scr_combatStep() {	
	var currentAttacker = scr_getNextAttacker();
	
	// tick down speed
	with currentAttacker var sp = scr_loseSpeed(1);

	// it is time to attack!
	if (sp <= 0) {
		// reset speed to full
		with currentAttacker scr_setSpeed(maxSpeed);
		// build and resolve attack
		scr_buildAttack(currentAttacker);
	}
	
	if (scr_checkCombatFinished()) {
		return false;
	}
}