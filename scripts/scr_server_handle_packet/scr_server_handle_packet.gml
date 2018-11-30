///scr_server_handle_packet(buffer)
/// @param buffer

var buffer = argument0;

buffer_seek(buffer, buffer_seek_start, 0);
var packet_type = buffer_read(buffer, buffer_u8); // packet type

switch (packet_type) {
	case PACKET_PIXEL:
		var tile_x = buffer_read(buffer, buffer_u8); // tile x
		var tile_y = buffer_read(buffer, buffer_u8); // tile y
		var tile_index = buffer_read(buffer, buffer_u8); // tile index
		
		scr_display_message("Receiving pixel at tile " + string(tile_x) + ", " + string(tile_y) 
			+ ", index " + string(tile_index));
			
		var pixel_changed = scr_set_pixel(tile_x, tile_y, tile_index);
		if (pixel_changed == true && ds_exists(global.client_sockets, ds_type_list)) {
			for (var i=0; i<ds_list_size(global.client_sockets); i++) {
				var client_socket = ds_list_find_value(global.client_sockets, i);
				scr_send_packet_pixel(client_socket, buffer, tile_x, tile_y, tile_index);
			}
		}
	break;
}
