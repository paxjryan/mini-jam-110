/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_color(c_black);
draw_set_font(fnt_actionDescription);
draw_set_valign(fa_top);

draw_text_ext(x+30, y+50, 
	scr_getCurrentEventName(),
	30, 500);