// Run by combatController
// (need to double check that all allocated space is being freed)
function scr_endCombat(playerWin){
	// destroy all battleEntities
	for (e = ds_map_find_first(battleEntities); !is_undefined(e); e = ds_map_find_next(battleEntities, e)) {
		instance_destroy(e);
	}
	
	ds_map_destroy(battleEntities);
	
	// temp debugging
	if(playerWin) {
		show_message("you win!");
	} else {
		show_message("you lose");
	}
	
	instance_destroy(self);
}