/// @description Initialize globals

global.socket = noone;

global.display_log = array_create(32, "");
var pixels_layer = layer_create(75);

global.pixels_tilemap = layer_tilemap_create(pixels_layer, 0, 0,
	tileset_colors8, TILEMAP_WIDTH, TILEMAP_HEIGHT);

for (var i=0; i<24; i++) {
	var tiledata = i | tile_rotate | tile_flip;
	tilemap_set(global.pixels_tilemap, tiledata, i+1, 1);
}

instructions = "[Numpad 1: Create Server] [Numpad 2: Join Server] [Esc: Exit Game]";

startup = true;
show_display_log = false;
