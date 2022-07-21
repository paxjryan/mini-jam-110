// Run by combatController
function scr_combatStep() {
	// loop through battleEntities
	for (var e = ds_map_find_first(battleEntities); !is_undefined(e); e = ds_map_find_next(battleEntities, e)) {
		// tick down speed
		with e var sp = scr_loseSpeed(1);
	
		// it is time to attack!
		if (sp <= 0) {
			show_message("NEXT COMBAT ROUND");
			// build and resolve attack
			scr_buildAttack(e);
			// trigger scr_endCombat if combat is finished
			scr_checkCombatFinished();
			// reset speed to full
			with e scr_setSpeed(maxSpeed);
		}
	}
}