/// @description Read input and draw
// You can write your code in this editor

if (fill_cooldown > 0) fill_cooldown--;

if (mouse_check_button(mb_left) || mouse_check_button(mb_right)
	&& position_meeting(mouse_x, mouse_y, self)) {
		
	var tile_index = selected_tile_index;
	if (mouse_check_button(mb_right)) tile_index = 0;
	
	var tile_x = floor(mouse_x / TILE_SIZE);
	var tile_y = floor(mouse_y / TILE_SIZE);
	var socket = global.server_socket;
	var buffer = global.send_buffer;
	
	switch (global.brush_type) {
		case BRUSH_TYPE_SMALL:
			scr_client_draw_small(socket, buffer, tile_x, tile_y, tile_index);
			break;
		case BRUSH_TYPE_MEDIUM:
			scr_client_draw_medium(socket, buffer, tile_x, tile_y, tile_index);
			break;
		case BRUSH_TYPE_LARGE:
			scr_client_draw_large(socket, buffer, tile_x, tile_y, tile_index);
			break;
		case BRUSH_TYPE_FILL:
			if (fill_cooldown == 0) {
				var origin_tiledata = tilemap_get(global.pixels_tilemap, tile_x, tile_y);
				var origin_tile_index = tile_get_index(origin_tiledata);
				scr_client_draw_fill(socket, buffer, tile_x, tile_y, tile_index, origin_tile_index);
				fill_cooldown = fill_delay;
			}
			break;
		default:
			scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index);
			break;
	}
	
	
}