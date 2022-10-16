// Run by combatController
// Returns next attacker
function scr_getNextAttacker() {
	// nextAttackerPos holds position value of next attacker
	// 0 to PARTY_SIZE-1				=	characters
	// PARTY_SIZE to 2*PARTY_SIZE-1		=	enemies
	
	var retValue = false;
	
	// increment nextAttackerPos until next existing attacker is found
	while (true) { 
		nextAttackerPos = (nextAttackerPos+1) mod (2*PARTY_SIZE);
		show_debug_message("next attacker pos: " + string(nextAttackerPos));
		
		if (nextAttackerPos < PARTY_SIZE) {
			if (nextAttackerPos < array_length(combatChars)) {
				retValue = combatChars[nextAttackerPos];
				//show_debug_message("retValue updated to char: " + retValue.entityName);
			} 
		} else { 
			if ((nextAttackerPos-PARTY_SIZE) < array_length(combatEnemies)) {
				retValue = combatEnemies[nextAttackerPos - PARTY_SIZE];
				//show_debug_message("retValue updated to enemy: " + retValue.entityName);
			}
		}
		
		if (retValue) return retValue;
	}
}