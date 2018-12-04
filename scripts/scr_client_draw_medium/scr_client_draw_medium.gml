///@function scr_client_draw_medium(socket, buffer, tile_x, tile_y, tile_index)
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

scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x-2, tile_y, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x+2, tile_y, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x, tile_y-2, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x, tile_y+2, tile_index);

for (var tx = tile_x-1; tx <= tile_x+1; tx++) {
	for (var ty = tile_y-1; ty <= tile_y+1; ty++) {
		scr_client_draw_pixel(socket, buffer, tx, ty, tile_index);
	}
}
