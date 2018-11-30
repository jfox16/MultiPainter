/// @description Initialize globals

global.server_socket = noone;

var size = 1024;
var buffer_type = buffer_fixed;
var alignment = 1;
global.send_buffer = buffer_create(size,buffer_type,alignment);

var pixels_layer = layer_create(75);
global.pixels_tilemap = layer_tilemap_create(pixels_layer, 0, 0,
	tileset_colors8, TILEMAP_WIDTH, TILEMAP_HEIGHT);

var display_log_length = 32;
global.display_log = array_create(display_log_length, "");
	
/*
for (var i=0; i<24; i++) {
	var tiledata = i | tile_rotate | tile_flip;
	tilemap_set(global.pixels_tilemap, tiledata, i+1, 1);
}*/

startup = true;
instructions = "[Press 1: Create Server] [Press 2: Join Server] [Esc: Exit Game]";
show_display_log = false;
