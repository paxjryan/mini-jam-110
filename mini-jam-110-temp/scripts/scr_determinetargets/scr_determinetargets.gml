// Run by combatController:
// given a battleEntity's battle position and attack targetingType,
// return a 2d array [ primaryTargets, secondaryTargets]
function scr_determineTargets(pos, targetingType) {	
	switch(targetingType) {
		// target monsters if pos < PARTY_SIZE; characters if pos >= PARTY_SIZE
		case "enemy":
			var targetList = scr_getTargetList(pos, pos < PARTY_SIZE, MELEE);
			break;
		case "ranged":
			var targetList = scr_getTargetList(pos, pos < PARTY_SIZE, RANGED);
			break;
		case "ally":
			var targetList = scr_getTargetList(pos, !(pos < PARTY_SIZE), MELEE);
			break;
		case "weakest ally":
			// still broken, currently heals frontmost party member
		
			// get ally list
			var targetList = scr_getTargetList(pos, !(pos < PARTY_SIZE), MELEE);
			
			break;
		case "self":
			var targetList = [self];
			break;
		default:
			// targetingType not recognized
			throw("targetingType not recognized: " + targetingType);
			return;
	}
	
			
	for (var i = 0; i < array_length(targetList); i++) {
		var e = scr_mapLookupKeyFromValue(battleEntities, i);
		// secondary targets array is empty for now
		if (e) return [ [e], [] ];		
	}	
	
	// no targets found; return empty double array
	return [ [], [] ];
}

// Takes in battleEntity's battle position, 
// which side to target (0 for characters, 1 for enemies),
// and melee/ranged (MELEE for melee, RANGED for ranged).
// Returns a list of all possible targets in order of priority.
function scr_getTargetList(pos, side, ranged) {
	var targetList = [];
	side = PARTY_SIZE*side;
	
	// get random order for attacks within column
	first = irandom(1);
	second = 1 - first;
	
	// front melee - target front to back
	if ( (pos mod PARTY_SIZE) < (PARTY_SIZE/2) && !ranged) 
		targetList = [first + side, second + side, first + side + 2, second + side + 2];
	// back melee  - can't target
	else if ( (pos mod PARTY_SIZE) >= (PARTY_SIZE/2) && !ranged) 
		targetList = [];
	// front ranged - target back to front
	else if ( (pos mod PARTY_SIZE) < (PARTY_SIZE/2) && ranged) 
		targetList = [first + side + 2, second + side + 2, first + side, second + side];
	// back ranged - target front to back
	else
		targetList = [first + side, second + side, first + side + 2, second + side + 2];
		
	return targetList;
}