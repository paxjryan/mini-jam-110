/// @description Insert description here
// You can write your code in this editor

events = scr_parseJson("events.json");
chars = scr_parseJson("characters.json");
enemies = scr_parseJson("enemies.json");
fights = scr_parseJson("fights.json");

// Initialize event and char
currentEvent = 0;
currentChar = 0;

// Initialize party to hold only main character
party = [];
array_push(party, scr_createCharObj(0));
array_push(party, scr_createCharObj(1));
array_push(party, scr_createCharObj(2));
array_push(party, scr_createCharObj(3));