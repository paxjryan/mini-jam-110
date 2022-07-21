// Run by combatController
function scr_buildAttack(attacker) {	
	// for debug
	show_debug_message("--- " + attacker.entityName + " is trying to attack! ---");
	
	for (var i = 0; i < array_length(attacker.attackAttributes); i++) {
		var effect = attacker.attackAttributes[i][0];
		var amount = attacker.attackAttributes[i][1];
		var targetType = attacker.attackAttributes[i][2];
		
		// for debug
		show_debug_message("effect: " + effect + ", amount: " + string(amount) + ", target type: " + targetType);
		
		var targets = scr_determineTargets(battleEntities[? attacker], targetType);
		
		if (array_length(targets[0]) == 0) {
			//be sad. do the sad animation. if there's a combat log, log 'did attack, no targets'
			//this isn't actually necessary for scr_resolveAttack, but it seems useful to catch
		} else {
			//be happy. do the happy animation. You did it!
			scr_resolveAttack(effect, amount, targets[0], targets[1]);
		}
	}
}