// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generateCharButtons(){
	for (var i = 0; i < array_length(obj_controller.party); i++) {
		instance_create_layer(288, 56+(32*i), "Instances", obj_charButton,
			{ buttonId: i });
		var partyPositionObj = instance_create_layer(294, 56+(32*i), "Instances", obj_partyPosition);
		partyPositionObj.image_index = i;
	}
}