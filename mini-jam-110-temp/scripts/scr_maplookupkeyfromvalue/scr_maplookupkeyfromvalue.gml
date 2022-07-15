// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mapLookupKeyFromValue(dsMap, value) {	
	for (currentKey = ds_map_find_first(dsMap);
		!is_undefined(currentKey);
		currentKey = ds_map_find_next(dsMap, currentKey)) {
			
		if (dsMap[? currentKey] == value) 
			return currentKey;
	}
	
	return pointer_null;
}