// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createMaxHealthBox(){
	var _maxHealthBox = instance_create_layer(x - BOX_SIDE/2,y - (CHAR_HEIGHT/2+BOX_SIDE/2), "Instances",obj_box);
	_maxHealthBox.sprite_index = spr_healthBoxDark;
	_maxHealthBox.image_index = maxHealth;
	//_maxHealthBox.owner = id;
	//_maxHealthBox.image_xscale = argument0;
	//_maxHealthBox.image_yscale = argument1;
	//_maxHealthBox.xOffset = argument2;
	//_maxHealthBox.yOffset = argument3;
	return _maxHealthBox;
}
	
function scr_createHealthBox(){
	var _healthBox = instance_create_layer(x - BOX_SIDE/2,y - (CHAR_HEIGHT/2+BOX_SIDE*1.5), "Instances",obj_box);
	_healthBox.sprite_index = spr_healthBox;
	_healthBox.image_index = healthCounter;
	return _healthBox;
}
function scr_createMaxSpeedBox(){
	var _maxSpeedBox = instance_create_layer(x + BOX_SIDE/2,y - (CHAR_HEIGHT/2+BOX_SIDE/2), "Instances",obj_box);
	_maxSpeedBox.sprite_index = spr_turnBoxDark;
	_maxSpeedBox.image_index = maxSpeed;
	return _maxSpeedBox;
}
function scr_createSpeedBox(){
	var _speedBox = instance_create_layer(x + BOX_SIDE/2,y - (CHAR_HEIGHT/2+BOX_SIDE*1.5), "Instances",obj_box);
	_speedBox.sprite_index = spr_turnBox;
	_speedBox.image_index = speedCounter;
	return _speedBox;
}
function scr_createShieldBox(){
	var _shieldBox = instance_create_layer(x + BOX_SIDE/2,y - (CHAR_HEIGHT/2+BOX_SIDE*2.5), "Instances",obj_box);
	_shieldBox.sprite_index = spr_shieldBox;
	_shieldBox.image_index = shieldCounter;
	return _shieldBox;
}