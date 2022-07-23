// Run by combatController
function scr_resolveAttack(effect, amount, primaryTargets, secondaryTargets) {
	for (var i = 0; i < array_length(primaryTargets); i++) {
		with primaryTargets[i] {
			switch(effect) {
				case "damage":
					scr_takeDamage(amount);
					// take hit animation here (flash red?)
					break;
				case "damagestun":
					scr_takeDamage(amount);
					scr_addSpeed(STUN_AMOUNT);
					// take hit animation here (flash red?)
					break;
				case "heal":
					scr_addHealth(amount);
					//heal animation here (flash green?)
					break;
				case "shield":
					scr_addShield(amount);
					//shield animation here (flash blue?)
					break;
				default:
					// effect not recognized
					throw("effect not recognized: " + effect);
					return;
			}
		}
		
		// may need to change to work with overkill damage: healthCounter <= 0
		if (primaryTargets[i].healthCounter == 0) {
			// for debug
			show_debug_message(primaryTargets[i].entityName + " DIED");
			
			// death animation here
			ds_map_delete(battleEntities, primaryTargets[i]);
			instance_destroy(primaryTargets[i]);
		}
	}
}

// returns remaining health
function scr_takeDamage(damageAmount) {
	damageAmount -= shieldCounter;
	scr_loseShield(min(shieldCounter, damageAmount));
	
	damageAmount -= armor;
	
	damageAmount = max(damageAmount, 0);
	var damageDone  = healthCounter - scr_loseHealth(damageAmount);
	
	return healthCounter;
}
