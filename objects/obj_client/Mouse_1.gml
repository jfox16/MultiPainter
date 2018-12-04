/// @description Erase pixels and send data

if (position_meeting(mouse_x, mouse_y, self)) {
	
	var tile_x = floor(mouse_x / TILE_SIZE);
	var tile_y = floor(mouse_y / TILE_SIZE);
	
	// if erasing pixel made a change
	if (scr_set_pixel(tile_x, tile_y, 0) == true) {
		scr_send_packet_pixel(global.server_socket, global.send_buffer, tile_x, tile_y, 0);
	}
}
