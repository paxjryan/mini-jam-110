// run by -obj_combatController!!!
// intakes attackAttribute array: [effect, value, target], target (object), and targetLocation [column, row]
// but target and targetLocation are actually arrays
// this actually could handle taking in an array with no targets.
function scr_handleAttack(effect, targets, targetPositions, secondary, attacker){
	switch(effect[0])
	{
		case "damage":
			for(var i = 0; i < array_length(targets); i++) {
				with targets[i]{
					var _healthRemaining = scr_takeDamage(effect[1]); //can be < 0, shows as 0
					// take hit animation here (flash red?)
				}
				if (_healthRemaining <= 0){
					// remove from battle array
					switch(targetPositions[i][0])
					{
						case 0: array_delete(charFrontline, targetPositions[i][1], 1); break;
						case 1: array_delete(charBackline, targetPositions[i][1], 1); break;
						case 2: array_delete(enemyFrontline, targetPositions[i][1], 1); break;
						case 3: array_delete(enemyBackline, targetPositions[i][1], 1); break;
					}
					// death animation here, ends by destroying the instance
					
					//temporary code
					instance_destroy(targets[i]);
				}
			}
		break;
		case "heal":
			for(i = 0; i < array_length(targets); i++){
				with targets[i]{
					scr_takeHealing(effect[1]);
					//heal animation here (flash green?)
				}
			}
		break;
		case "shield":
			for(i = 0; i < array_length(targets); i++){
				with targets[i]{
					scr_takeShield(effect[1]);
					//shield animation here (flash blue?)
				}
			}
		break;
	}
	// check if combat over (total chars or enemies = 0)
	if(array_length(charFrontline) + array_length(charBackline) == 0){
		scr_endCombat(false);
	}
	if(array_length(enemyFrontline) + array_length(enemyBackline) == 0){
		scr_endCombat(true);
	}
}