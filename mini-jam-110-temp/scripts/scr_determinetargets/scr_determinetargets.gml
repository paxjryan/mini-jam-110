// Run by combatController

// Given a combatEntity's combat position, side (CHAR_SIDE or ENEMY_SIDE), and the attack targetingType
// Returns a 2d array [ primaryTargets, secondaryTargets]
function scr_determineTargets(pos, side, targetingType) {
	// uses value stored in side to decide which array is opponents and which is allies
	var opponents = side ? combatChars : combatEnemies;
	var allies = side ? combatEnemies : combatChars;
	
	switch(targetingType) {
		case "melee":
			var targetList = scr_getTargetList(pos, opponents, MELEE);
			break;
		case "ranged":
			var targetList = scr_getTargetList(pos, opponents, RANGED);
			break;
		case "ally":
			// get filtered list of front allies (aka front melee)
			var targetList = scr_getTargetList(0, allies, MELEE);
			break;
		case "weakest ally":
			// get filtered list of all allies (aka front ranged)
			// slightly hacky but that do be how it be -- for now
			var allyList = scr_getTargetList(0, allies, RANGED);
		
			// targetList holds the ally who has taken the most damage
			var targetList = [ allyList[0] ];
			
			// loop through ally list
			for (var i = 0; i < array_length(allyList); i++) {
				mostDamagedAlly = targetList[0];
				currentAlly = allyList[i];
				
				// store iff current ally has more damage than current most-damaged ally
				if ( (currentAlly.maxHealth - currentAlly.healthCounter) > 
					 (mostDamagedAlly.maxHealth - mostDamagedAlly.healthCounter) ) {
					targetList[0] = allyList[i];
				}
			}
			
			break;
		case "self":
			var targetList = [allies[pos]];
			break;
		default:
			// targetingType not recognized
			throw("targetingType not recognized: " + targetingType);
			return;
	}
	
	// for debug
	if (targetList[0]) show_debug_message("TARGETING: " + targetList[0].entityName);
	
	// secondary targets array is empty for now
	return [ [targetList[0]], [] ];
}

// Given a combatEntity's combat position, combat entity array to target, and melee/ranged (MELEE or RANGED)
// Returns a list of all possible targets in order of greatest to least priority
function scr_getTargetList(pos, targetEntities, ranged) {
	// targetListPos holds a list of potential target positions
	// targetList holds a list of targets, with nonexistent targets filtered out
	var targetListPos = [];
	var targetList = [];
	
	// get random order for attacks within column
	first = irandom(1);
	second = 1 - first;
	
	front = pos < PARTY_SIZE/2;	
	
	// front melee - target front
	if (front && !ranged) 
		targetListPos = [first, second];
	// back melee  - can't target
	else if (!front && !ranged) 
		targetListPos = [];
	// front ranged - target back to front
	else if (front && ranged) 
		targetListPos = [first + 2, second + 2, first, second];
	// back ranged - target front
	else
		targetListPos = [first, second];
	
	for (var i = 0; i < array_length(targetListPos); i++) {
		if (targetEntities[targetListPos[i]])
			array_push(targetList, targetEntities[targetListPos[i]]);
	}
	
	//// for debug
	//var targetString = "targets: ";
	//for (var i = 0; i < array_length(targetList); i++) 
	//	targetString += string(targetList[i]) + " ";
	//show_debug_message(targetString);
	
	//// for debug
	//var targetString = "filtered targets: ";
	//for (var i = 0; i < array_length(targetList); i++) 
	//	targetString += string(targetList[i]) + " ";
	//show_debug_message(targetString);
		
	return targetList;
}