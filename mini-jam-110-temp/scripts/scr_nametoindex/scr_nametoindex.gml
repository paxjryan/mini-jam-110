// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_charToIndex(charName){
	switch(charName)
	{
		case "Pandora": return 0;
		case "Thor": return 1;
		case "Orpheus": return 2;
		case "Apollo": return 3;
	}
}
function scr_enemyToIndex(enemyName){
	switch(enemyName)
	{
		case "Slime": return 0;
		case "Shield Slime": return 1;
	}
}