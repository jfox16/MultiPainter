/// @function scr_set_pixel(tile_x, tile_y, tile_index)
/// @description Sets a tile on your client to tile_index. Return true if a change was made, returns false otherwise.
/// @param tile_x
/// @param tile_y
/// @param tile_index

var tile_x = argument0;
var tile_y = argument1;
var tile_index = argument2;

var old_tile = tilemap_get(global.pixels_tilemap, tile_x, tile_y);
var old_tile_index = tile_get_index(old_tile);

if (old_tile_index != tile_index) {
	
	var tiledata = tile_index | tile_rotate | tile_flip;
	tilemap_set(global.pixels_tilemap, tiledata, tile_x, tile_y);
	
	return true;
}
else {
	return false;
}

