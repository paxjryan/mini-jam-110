function scr_mapLookupKeyFromValue(dsMap, value) {	
	for (currentKey = ds_map_find_first(dsMap);
		!is_undefined(currentKey);
		currentKey = ds_map_find_next(dsMap, currentKey)) {
			
		if (dsMap[? currentKey] == value) 
			return currentKey;
	}
	
	return pointer_null;
}