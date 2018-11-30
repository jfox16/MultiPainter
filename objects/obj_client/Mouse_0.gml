/// @description Draw pixels and send data

if (position_meeting(mouse_x, mouse_y, self)) {
	var tile_x = floor(mouse_x / TILE_SIZE);
	var tile_y = floor(mouse_y / TILE_SIZE);
	
	if (scr_set_pixel(tile_x, tile_y, global.selected_tile_index) == true) {
		scr_send_packet_pixel(global.server_socket, global.send_buffer, 
			tile_x, tile_y, global.selected_tile_index);
	}
}
