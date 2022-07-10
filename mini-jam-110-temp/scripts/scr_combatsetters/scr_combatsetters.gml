// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_setHealth(newHealth){
	healthCounter = newHealth;
	healthBox.image_index = healthCounter;
}

function scr_setSpeed(newSpeed){
	speedCounter = newSpeed;
	speedBox.image_index = speedCounter;
}

function scr_setMaxHealth(newHealth){
	maxHealth = newHealth;
	maxHealthBox.image_index = maxHealth;
}

function scr_setMaxSpeed(newSpeed){
	maxSpeed = newSpeed;
	maxSpeedBox.image_index = maxSpeed;
}