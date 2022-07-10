// ends combat

function scr_endCombat(win){
	for (var i = 0; i < array_length(charFrontline); i++) {
		instance_destroy(charFrontline[i]);
	}
	for (var i = 0; i < array_length(charBackline); i++) {
		instance_destroy(charBackline[i]);
	}
	for (var i = 0; i < array_length(enemyFrontline); i++) {
		instance_destroy(enemyFrontline[i]);
	}
	for (var i = 0; i < array_length(enemyBackline); i++) {
		instance_destroy(enemyBackline[i]);
	}
	if(win){
		show_message("you win!");
	} else {
		show_message("you lose");
	}
	instance_destroy(self);
}