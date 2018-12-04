///scr_client_handle_packet(buffer)
/// @param buffer

var buffer = argument0;

buffer_seek(buffer, buffer_seek_start, 0);
var packet_type = buffer_read(buffer, buffer_u8); // packet type

switch (packet_type) {
	case PACKET_PIXEL:
		// Receiving pixel info. Make change on clientside.
		var tile_x = buffer_read(buffer, buffer_u8); // tile x
		var tile_y = buffer_read(buffer, buffer_u8); // tile y
		var tile_index = buffer_read(buffer, buffer_u8); // tile index
			
		scr_set_pixel(tile_x, tile_y, tile_index);
	break;
	
	case PACKET_ERASEALL:
		// Receiving eraseall command. Erase all pixels on clientside.
		for (var tx=0; tx<tilemap_get_width(global.pixels_tilemap); tx++) {
			for (var ty=0; ty<tilemap_get_height(global.pixels_tilemap); ty++) {
				scr_set_pixel(tx, ty, 0);
			}
		}	
		scr_display_message("Receiving ERASEALL command.");
	break;
}
