// Returns index of val in array
function scr_getArrayIndex(array, val) {
	for (var i = 0; i < array_length(array); i++)
		if (array[i] == val) return i;
		
	return -1;
}