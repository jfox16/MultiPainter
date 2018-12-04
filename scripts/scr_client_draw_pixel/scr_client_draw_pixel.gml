///@function scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index)
///@param socket
///@param buffer
///@param tile_x
///@param tile_y
///@param tile_index

var socket = argument0;
var buffer = argument1;
var tile_x = argument2;
var tile_y = argument3;
var tile_index = argument4;

// if tile coordinates are valid, draw a pixel
if (tile_x >= 0 && tile_x < TILEMAP_WIDTH && tile_y >= 0 && tile_y < TILEMAP_HEIGHT) {
	
	var pixel_changed = scr_set_pixel(tile_x, tile_y, tile_index);
	
	// if a pixel was changed, send pixel info to socket
	if (pixel_changed)
		scr_send_packet_pixel(socket, buffer, tile_x, tile_y, tile_index);
}
