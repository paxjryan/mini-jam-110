// Run by combatController
// (need to double check that all allocated space is being freed)
function scr_endCombat(playerWin){
	// destroy all battleEntities
	for (var i = 0; i < array_length(combatChars); i++) 
		if (combatChars[i]) instance_destroy(combatChars[i]);
	for (var i = 0; i < array_length(combatEnemies); i++) 
		if (combatEnemies[i]) instance_destroy(combatEnemies[i]);
	
	// for debug
	if(playerWin) {
		show_message("you win!");
	} else {
		show_message("you lose");
	}
	
	instance_destroy(self);
	
	// move to new room
}