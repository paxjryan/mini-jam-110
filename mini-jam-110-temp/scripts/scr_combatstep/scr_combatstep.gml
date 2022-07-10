// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_combatStep(){
	// there is a mechanic hidden here: who attacks first. Current vibe front to back
	for (var i = 0; i < array_length(charFrontline); i++) {
		//can't say if true b/c either false or an object. Hopefully false doesn't overlap obj ID
		if (charFrontline[i] != false) {
			with charFrontline[i] {
				scr_setSpeed(speedCounter - 1);
				if (speedCounter <= 0) {
					//attack
					scr_makeAttack();
					//should take time bc animation
				}
			}
		}
	}
	for (var i = 0; i < array_length(charBackline); i++) {
		//can't say if true b/c either false or an object. Hopefully false doesn't overlap obj ID
		if(charBackline[i] != false){
			with charBackline[i]{
				scr_setSpeed(speedCounter - 1);
				if(speedCounter <= 0){
					//attack
					scr_makeAttack();
					//should take time bc animation
				}
			}
		}
	}
	for (var i = 0; i < array_length(enemyFrontline); i++) {
		//can't say if true b/c either false or an object. Hopefully false doesn't overlap obj ID
		if(enemyFrontline[i] != false){
			with enemyFrontline[i]{
				scr_setSpeed(speedCounter - 1);
				if(speedCounter <= 0){
					//attack
					scr_makeAttack();
					//should take time bc animation
				}
			}
		}
	}
	for (var i = 0; i < array_length(enemyBackline); i++) {
		//can't say if true b/c either false or an object. Hopefully false doesn't overlap obj ID
		if(enemyBackline[i] != false){
			with enemyBackline[i]{
				scr_setSpeed(speedCounter - 1);
				if(speedCounter <= 0){
					//attack
					scr_makeAttack();
					//should take time bc animation
				}
			}
		}
	}
}