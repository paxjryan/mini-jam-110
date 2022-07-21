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
			// get ally list from front to back (aka front melee)
			var targetList = scr_getTargetList(0, !(pos < PARTY_SIZE), MELEE);
			break;
		case "weakest ally":
			// get ally list from front to back (aka front melee)
			var allyList = scr_getTargetList(0, !(pos < PARTY_SIZE), MELEE);
			
			// targetList holds the current lowest-health ally
			var targetList = [ allyList[0] ];
			// loop through ally list
			for (var i = 0; i < array_length(allyList); i++) {
				mostDamagedAlly = scr_mapLookupKeyFromValue(battleEntities, targetList[0]);
				currentAlly = scr_mapLookupKeyFromValue(battleEntities, allyList[i]);
				
				// store iff current ally has more damage than current most-damaged ally
				if ( (currentAlly.maxHealth - currentAlly.healthCounter) > 
					 (mostDamagedAlly.maxHealth - mostDamagedAlly.healthCounter) )
					targetList[0] = i;
			}
			
			break;
		case "self":
			var targetList = [self];
			break;
		default:
			// targetingType not recognized
			throw("targetingType not recognized: " + targetingType);
			return;
	}
	
	// return if no targets
	if (array_length(targetList) == 0) return [ [], [] ];
	
	// returning only one target for now; get first target from targetList
	var target = scr_mapLookupKeyFromValue(battleEntities, targetList[0]);
	
	// for debug
	if (target) show_debug_message("TARGETING: " + target.entityName);
	
	// secondary targets array is empty for now
	return [ [target], [] ];
}

// Takes in battleEntity's battle position, 
// which side to target (0 for characters, 1 for enemies),
// and melee/ranged (MELEE for melee, RANGED for ranged).
// Returns a list of all possible targets in order of greatest to least priority.
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
	
	// for debug
	var targetString = "targets: ";
	for (var i = 0; i < array_length(targetList); i++) 
		targetString += string(targetList[i]) + " ";
	show_debug_message(targetString);
	
	// filter out non-existing target positions
	for (var i = 0; i < array_length(targetList); i++) {
		if (!scr_mapLookupKeyFromValue(battleEntities, targetList[i])) {
			array_delete(targetList, i, 1);
			i--;
		}
	}
	
	// for debug
	var targetString = "filtered targets: ";
	for (var i = 0; i < array_length(targetList); i++) 
		targetString += string(targetList[i]) + " ";
	show_debug_message(targetString);
		
	return targetList;
}