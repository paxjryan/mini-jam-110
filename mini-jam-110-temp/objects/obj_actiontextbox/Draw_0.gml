/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_color(c_black);
draw_set_font(FONT_SMALL);
draw_set_valign(fa_top);

draw_text_ext(x+4, y+8, 
	scr_getCurrentEventName(),
	30, 150);//spr_actionTextBox.width - 20);