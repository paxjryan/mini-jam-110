// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_parseJson(json) {
	if (file_exists(json)) {
		var returnString = "";
		var _file = file_text_open_read(json);
	
		while(file_text_eof(_file) == false) {
			returnString += file_text_readln(_file);
		}

		file_text_close(_file);
		returnObj = json_parse(returnString);
	
		return returnObj;
	} 
	
	return false;
}