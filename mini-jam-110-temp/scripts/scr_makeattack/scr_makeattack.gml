// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_makeAttack(){
	//do attack effect. Need to parse char json attack attribute (ask pax)
	//should: parse attack string, decide on targets, change color, call attack function, reset speed
	
	//temporary debug effect
	show_message("attack!");
	scr_setSpeed(maxSpeed);
}