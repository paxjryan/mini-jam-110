// Run by combatChar object
function scr_makeAttack() {
	//Attack attributes is an array formatted [effect, number/value, target], in combatChar (and obj_char)
	//can be modified temporarily in combatChar, or can permachange via combatChar owner variable
	
	// should: decide on targets, call attack animtion, call script to handle attack effect, reset speed
	
	//temporary debug effect
	show_message("attack!");
	
	for (var i = 0; i < array_length(attackAttributes); i++) {
		var effect = attackAttributes[i];
		var target = scr_resolveTarget(effect);
		//target in array: [targets, locations, secondary targets]
		if(array_length(target[0]) == 0){
			//be sad. do the sad animation. if there's a combat log, log 'did attack, no targets'
			//this isn't actually necessary for scr_handleAttack, but it seems useful to catch
		} else{
			//be happy. do the happy animation. You did it!
			
			//takes in effect, target, and target location
			with obj_combatController {
				scr_handleAttack(effect, target[0], target[1], target[2], other);
			}
		}
	}
	scr_setSpeed(maxSpeed);
}

function scr_resolveTarget(effect){
	// each of these are lists
	var _target;
	var _targetLocation; // where target. [column, row], where column (0-3) goes from charFrontline (0)
	//to enemyBackline (3), and row (0-1) gives index in that array. Column from _aF style vars
	var _secondary = [];
	var _output;
	
	if(team == "good"){
		var _allyFront = obj_combatController.charFrontline;
		var _allyBack = obj_combatController.charBackline;
		var _enemyFront = obj_combatController.enemyFrontline;
		var _enemyBack = obj_combatController.enemyBackline;
		var _aF = 0;
		var _aB = 1;
		var _eF = 2;
		var _eB = 3;
	}
	if(team == "evil"){
		var _allyFront = obj_combatController.enemyFrontline;
		var _allyBack = obj_combatController.enemyBackline;
		var _enemyFront = obj_combatController.charFrontline;
		var _enemyBack = obj_combatController.charBackline;
		var _aF = 2;
		var _aB = 3;
		var _eF = 0;
		var _eB = 1;
	}
	var _back = (position > 2) and (array_length(_allyFront) > 0);
	switch(effect[2])
	{
		case "enemy":
			if(_back){
				// melee attack from backline can't hit
				_target = [];
				_targetLocation = [[]];
			} else if(array_length(_enemyFront) > 0){
				var _random = irandom(array_length(_enemyFront) - 1);
				_target = [_enemyFront[_random]];
				_targetLocation = [[_eF, _random]];
			} else if(array_length(_enemyBack) > 0){
				var _random = irandom(array_length(_enemyBack) - 1);
				_target = [_enemyBack[_random]];
				_targetLocation = [[_eB, _random]];
			} else {
				//no enemies. Combat is over, or maybe the boss is b/t stages or an enemy phased out
				_target = [];
				_targetLocation = [[]];
			}
			_output = [_target, _targetLocation, _secondary];
			return _output;
		case "ranged":
			if(_back){
				if(array_length(_enemyFront) > 0){
					var _random = irandom(array_length(_enemyFront) - 1);
					_target = [_enemyFront[_random]];
					_targetLocation = [[_eF, _random]];
				} else if(array_length(_enemyBack) > 0){
					var _random = irandom(array_length(_enemyBack) - 1);
					_target = [_enemyBack[_random]];
					_targetLocation = [[_eB, _random]];
				} else {
					//no enemies. Combat is over, or maybe the boss is b/t stages or an enemy phased out
					_target = [];
					_targetLocation = [[]];
				}
			} else{
				// check the back first b/c ranged. If no one in the back, hit front
				if(array_length(_enemyBack) > 0){
					var _random = irandom(array_length(_enemyBack) - 1);
					_target = [_enemyBack[_random]];
					_targetLocation = [[_eB, _random]];
				} else if(array_length(_enemyFront) > 0){
					var _random = irandom(array_length(_enemyFront) - 1);
					_target = [_enemyFront[_random]];
					_targetLocation = [[_eF, _random]];
				} else{
					_target = [];
					_targetLocation = [[]];
				}
			}
			_output = [_target, _targetLocation, _secondary];
			return _output;
		case "ally":
			if(array_length(_allyFront) > 0){
				var _random = irandom(array_length(_allyFront) - 1);
				_target = [_allyFront[_random]];
				_targetLocation = [[_aF, _random]];
			} else if(array_length(_allyBack) > 0){
				var _random = irandom(array_length(_allyBack) - 1);
				_target = [_allyBack[_random]];
				_targetLocation = [[_aB, _random]];
			} else {
				_target = [];
				_targetLocation = [[]];
			}
			_output = [_target, _targetLocation, _secondary];
			return _output;
		case "weakest ally":
			var _lostHealth = 0;
			for (var i = 0; i < array_length(_allyFront); i++) {
				if ((_allyFront[i].maxHealth - _allyFront[i].healthCounter) > _lostHealth){
					_lostHealth = (_allyFront[i].maxHealth - _allyFront[i].healthCounter);
					_target = [_allyFront[i]];
					_targetLocation = [[_aF, i]];
				}
			}
			for (var i = 0; i < array_length(_allyBack); i++) {
				if ((_allyBack[i].maxHealth - _allyBack[i].healthCounter) > _lostHealth){
					_lostHealth = (_allyBack[i].maxHealth - _allyBack[i].healthCounter);
					_target = [_allyBack[i]];
					_targetLocation = [[_aB, i]];
				}
			}
			// no one to heal?
			if(_lostHealth == 0){
				_target = [];
				_targetLocation = [[]];
			}
			_output = [_target, _targetLocation, _secondary];
			return _output;
		case "self":
			_target = [id];
			_targetLocation = [scr_getPositionAsCombatLocation()];
			_output = [_target, _targetLocation, _secondary];
			return _output;
	}
}

function scr_getPositionAsCombatLocation(){
	// row depends only on even/odd, column depends on team and 0-1 vs 2-3
	var _location = [position % 2, floor(position / 2)];
	if(team = "evil"){
		_location[1] += 2;
		show_message(_location);
	}
}