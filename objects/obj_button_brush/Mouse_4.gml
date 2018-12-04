/// @description 

if (position_meeting(mouse_x, mouse_y, self)) {
	var offset_x = mouse_x - x;
	global.brush_type = floor(offset_x / 32);
	selector.x = x + (offset_x - (offset_x % 32));
	scr_display_message("Selected brush " + string(global.brush_type));
}