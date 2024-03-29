// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Font
#macro FONT_CHAR_NAME fnt_charName
#macro FONT_SMALL fnt_pixel

// Combat
#macro STEP_TIME 5
#macro PARTY_SIZE 4
#macro CHAR_SIDE 0
#macro ENEMY_SIDE 1
#macro MELEE 0
#macro RANGED 1
#macro BASIC_CHAR_MAX_SHIELD 99
#macro BASIC_ENEMY_MAX_SHIELD 99
#macro STUN_AMOUNT 1

// Combat positioning
#macro ROOM_HEIGHT 180
#macro ROOM_WIDTH 320
#macro BOX_SIDE 16
#macro CHAR_WIDTH 32
#macro CHAR_HEIGHT 48
#macro CHAR_0_X CHAR_WIDTH * 3.5
#macro CHAR_0_Y ROOM_HEIGHT - CHAR_HEIGHT*.75 // *.5 gives exactly on the bottom. Change later perhaps
#macro CHAR_1_X CHAR_0_X + CHAR_WIDTH
#macro CHAR_1_Y CHAR_0_Y - CHAR_HEIGHT
#macro CHAR_2_X CHAR_1_X - CHAR_WIDTH * 3.5
#macro CHAR_2_Y CHAR_0_Y
#macro CHAR_3_X CHAR_2_X + CHAR_WIDTH
#macro CHAR_3_Y CHAR_0_Y - CHAR_HEIGHT
#macro ENEMY_WIDTH 32
#macro ENEMY_HEIGHT 48
#macro ENEMY_0_X ROOM_WIDTH - ENEMY_WIDTH*3.5
#macro ENEMY_0_Y ROOM_HEIGHT - ENEMY_HEIGHT*.75
#macro ENEMY_1_X ENEMY_0_X + ENEMY_WIDTH
#macro ENEMY_1_Y ENEMY_0_Y - ENEMY_HEIGHT
#macro ENEMY_2_X ENEMY_1_X + ENEMY_WIDTH*1.5
#macro ENEMY_2_Y ENEMY_0_Y
#macro ENEMY_3_X ENEMY_2_X + ENEMY_WIDTH
#macro ENEMY_3_Y ENEMY_0_Y - ENEMY_HEIGHT