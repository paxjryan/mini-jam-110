// Run by combatChar object
function scr_makeAttack() {
	// do attack effect. Need to parse char json attack attribute (ask pax). This should then be stored by 
	//char object in a format the game can read. perhaps an array formatted [effect, number/value, target].
	//This then can be modified for buff purposes, and displayed to the screen. combatChar has a copy
	//of this array, which can change (temporarily) in combat. can also permachange via owner variable
	//in combatChar
	// should: decide on targets, change color, call attack function, reset speed
	
	//temporary debug effect
	show_message("attack!");
	for (var i = 0; i < array_length(attackAttributes); i++) {
		target = scr_resolveTarget(attackAttributes[i])
		//do effect
	}
	scr_setSpeed(maxSpeed);
}

function scr_resolveTarget(effect){
	var _target;
	var _back = (position > 2)
	switch(effect[2])
	{
		case "enemy":
			if(_back) and obj_combatController.charFrontline
			
			return _target;
		case "ally":
		
			return _target;
	}
}