///@function scr_client_draw_fill(socket, buffer, tile_x, tile_y, tile_index, origin_tile_index)
///@description Checks if adjacent tiles if they match original tile index. If so, recurses on those tiles.
///@param socket
///@param buffer
///@param tile_x
///@param tile_y
///@param tile_index
///@param origin_tile_index

var socket = argument0;
var buffer = argument1;
var tile_x = argument2;
var tile_y = argument3;
var tile_index = argument4;
var origin_tile_index = argument5;

if (tile_index != origin_tile_index
	&& tile_x >= 0 && tile_x < TILEMAP_WIDTH && tile_y >= 0 && tile_y < TILEMAP_HEIGHT
	&& tile_get_index(tilemap_get(global.pixels_tilemap, tile_x, tile_y)) == origin_tile_index ) {
	
	// draw middle pixel
	scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index);
	
	// recurse from west adjacent pixel
	scr_client_draw_fill(socket, buffer, tile_x-1, tile_y, tile_index, origin_tile_index);
	// recurse from north adjacent pixel
	scr_client_draw_fill(socket, buffer, tile_x, tile_y-1, tile_index, origin_tile_index);
	// recurse from east adjacent pixel
	scr_client_draw_fill(socket, buffer, tile_x+1, tile_y, tile_index, origin_tile_index);
	// recurse from south adjacent pixel
	scr_client_draw_fill(socket, buffer, tile_x, tile_y+1, tile_index, origin_tile_index);
}