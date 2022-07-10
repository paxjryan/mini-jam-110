// update later for negative numbers, also currently breaks with numbers > 19

function scr_takeDamage(damage){
	// * -1 so it's positive if overflows, b/c shieldCounter will be neg
	damage = -1 * (scr_setShield(shieldCounter - damage))
	//hidden mechanic: -= armor here b/c armor doesn't block damage to shield
	damage -= armor;
	damage = max(damage, 0);
	return scr_setHealth(healthCounter - damage);
}

function scr_takeHealing(healAmount){
	return scr_setHealth(min(maxHealth, healthCounter + healAmount));
}

function scr_takeShield(shield){
	scr_setShield(min(maxShield, shieldCounter + shield));
}

function scr_setHealth(newHealth){
	healthCounter = min(newHealth, maxHealth);
	healthBox.image_index = healthCounter;
	return healthCounter;
}

function scr_setSpeed(newSpeed){
	//not min(newSpeed, maxSpeed) b/c speed can go above max (as of now anyway)
	speedCounter = newSpeed;
	speedBox.image_index = max(speedCounter, 0);
	return speedCounter;
}

function scr_setMaxHealth(newHealth){
	maxHealth = newHealth;
	maxHealthBox.image_index = max(maxHealth, 0);
	return maxHealth;
}

function scr_setMaxSpeed(newSpeed){
	maxSpeed = newSpeed;
	maxSpeedBox.image_index = max(maxSpeed, 0);
	return maxSpeed;
}

// will output negative numbers when shield is overkilled
function scr_setShield(newShield){
	shieldCounter = newShield;
	shieldBox.image_index = max(newShield, 0);
	return newShield;
}