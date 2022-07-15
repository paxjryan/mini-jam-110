function scr_createMaxHealthBox(){
	var _maxHealthBox = instance_create_layer(x - BOX_SIDE/2, y - (CHAR_HEIGHT/2 + BOX_SIDE/2), "Instances", obj_box);
	_maxHealthBox.sprite_index = spr_healthBoxDark;
	return _maxHealthBox;
}
	
function scr_createHealthBox(){
	var _healthBox = instance_create_layer(x - BOX_SIDE/2, y - (CHAR_HEIGHT/2 + BOX_SIDE*1.5), "Instances", obj_box);
	_healthBox.sprite_index = spr_healthBox;
	return _healthBox;
}
function scr_createMaxSpeedBox(){
	var _maxSpeedBox = instance_create_layer(x + BOX_SIDE/2, y - (CHAR_HEIGHT/2 + BOX_SIDE/2), "Instances", obj_box);
	_maxSpeedBox.sprite_index = spr_turnBoxDark;
	return _maxSpeedBox;
}
function scr_createSpeedBox(){
	var _speedBox = instance_create_layer(x + BOX_SIDE/2, y - (CHAR_HEIGHT/2 + BOX_SIDE*1.5), "Instances", obj_box);
	_speedBox.sprite_index = spr_turnBox;
	return _speedBox;
}
function scr_createShieldBox(){
	var _shieldBox = instance_create_layer(x + BOX_SIDE/2, y - (CHAR_HEIGHT/2 + BOX_SIDE*2.5), "Instances", obj_box);
	_shieldBox.sprite_index = spr_shieldBox;
	return _shieldBox;
}