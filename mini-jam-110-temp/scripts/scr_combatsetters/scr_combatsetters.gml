// update later for negative numbers, also currently breaks with numbers > 19

function scr_addHealth(healthAmount) {
	return scr_setHealth(healthCounter + healthAmount);
}

function scr_loseHealth(healthAmount) {
	return scr_addHealth(-1 * healthAmount);
}

function scr_addSpeed(speedAmount) {
	return scr_setSpeed(speedCounter + speedAmount);
}

function scr_loseSpeed(speedAmount) {
	return scr_addSpeed(-1 * speedAmount);
}

function scr_addShield(shieldAmount) {
	return scr_setShield(shieldCounter + shieldAmount);
}

function scr_loseShield(shieldAmount) {
	return scr_addShield(-1 * shieldAmount);
}


function scr_setHealth(newHealth) {
	if (newHealth < 0) newHealth = 0;
	
	healthCounter = min(newHealth, maxHealth); // cannot set healthCounter higher than maxHealth
	healthBox.image_index = healthCounter; 
	return healthCounter;
}

function scr_setSpeed(newSpeed) {
	if (newSpeed < 0) newSpeed = 0;
	
	speedCounter = min(newSpeed, maxSpeed); // cannot set speedCounter higher than maxSpeed
	speedBox.image_index = speedCounter; 
	return speedCounter;
}

function scr_setShield(newShield) {
	if (newShield < 0) newShield = 0;
	
	shieldCounter = min(newShield, maxShield); // cannot set shieldCounter higher than maxShield
	shieldBox.image_index = shieldCounter;
	return shieldCounter;
}

function scr_setMaxHealth(newMaxHealth) {
	if (newMaxHealth < 0) newMaxHealth = 0; 
	
	maxHealth = newMaxHealth;
	maxHealthBox.image_index = maxHealth;
	return maxHealth;
}

function scr_setMaxSpeed(newMaxSpeed) {
	if (newMaxSpeed < 0) newMaxSpeed = 0;
	
	maxSpeed = newMaxSpeed;
	maxSpeedBox.image_index = maxSpeed; 
	return maxSpeed;
}

function scr_setMaxShield(newMaxShield) {
	if (newMaxShield < 0) newMaxShield = 0;
	
	maxShield = newMaxShield;
	return newMaxShield;
}