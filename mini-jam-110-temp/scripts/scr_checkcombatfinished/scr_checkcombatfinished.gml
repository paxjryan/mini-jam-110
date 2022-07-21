// Run by combatController
function scr_checkCombatFinished() {
	var playersExhausted = true;
	var enemiesExhausted = true;
	
	for (var i = 0; i < PARTY_SIZE; i++) {
		if (scr_mapLookupKeyFromValue(battleEntities, i)) {
			playersExhausted = false;
		}
	}
	
	for (var i = 4; i < 4 + PARTY_SIZE; i++) {
		if (scr_mapLookupKeyFromValue(battleEntities, i)) {
			enemiesExhausted = false;
		}
	}
	
	// hidden mechanic - players currently lose ties
	if (playersExhausted) scr_endCombat(false);
	else if (enemiesExhausted) scr_endCombat(true);
	
	// return true iff combat has finished
	return (playersExhausted || enemiesExhausted);
}