/// @description Draw pixels and send data

if (position_meeting(mouse_x, mouse_y, self)) {
	
	var tile_x = floor(mouse_x / TILE_SIZE);
	var tile_y = floor(mouse_y / TILE_SIZE);
	var tile_index = selected_tile_index;
	var socket = global.server_socket;
	var buffer = global.send_buffer;
	
	if (fill_cooldown > 0) fill_cooldown--;
	
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
				var origin_tile_index = tile_get_index(tilemap_get(global.pixels_tilemap, tile_x, tile_y));
				scr_client_draw_fill(socket, buffer, tile_x, tile_y, tile_index, origin_tile_index);
				fill_cooldown = fill_delay;
			}
			break;
		default:
			scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index);
			break;
	}
}
