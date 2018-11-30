/// @description Select Color

if (position_meeting(mouse_x, mouse_y, self)) {
	var index_x = floor((mouse_x - x) / (sprite_width/8));
	var index_y = floor((mouse_y - y) / (sprite_height/3));

	global.selected_tile_index = index_x + index_y*8;
	
	selector.x = x + index_x*32;
	selector.y = y + index_y*32;

	scr_display_message("Selected color " + string(global.selected_tile_index) + ".");
}