/// scr_display_message(message)
/// @description Adds a message to display_log.
/// @param message

var message = argument0;

for (var i=array_length_1d(global.display_log)-1; i>=1; i--) {
	global.display_log[i] = global.display_log[i-1];
}

var timestamp = "[" + string(current_hour) + ":" + string(current_minute) 
	+ "." + string(current_second) + "]";
global.display_log[0] = string(timestamp) + string(message);