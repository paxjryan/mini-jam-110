/// @description Init vars, make boxes
// You can write your code in this editor

// these values will not be assigned by combat controller
maxHealth = 0;
maxSpeed = 0;
speedOffset = 0;
position = 0;
healthCounter = 0; // = maxHealth
speedCounter = 0; // = maxSpeed - speedOffset
shieldCounter = 0;
maxShield = 10;

team = "good";

// boxes
maxHealthBox = scr_createMaxHealthBox()
healthBox = scr_createHealthBox()
maxSpeedBox = scr_createMaxSpeedBox()
speedBox = scr_createSpeedBox()
shieldBox = scr_createShieldBox()
//armorBox = 

