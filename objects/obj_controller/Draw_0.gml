/// @description Draw tilemap and cursor tile
// You can write your code in this editor

draw_tilemap(global.pixels_tilemap, 0, 0);

// draw tile at cursor position
var pos_x = clamp(mouse_x - (mouse_x % TILE_SIZE), 0, CANVAS_WIDTH-1);
var pos_y = clamp(mouse_y - (mouse_y % TILE_SIZE), 0, CANVAS_HEIGHT-1);

if (global.client != noone && global.client.selected_tile_index != 0) {
	var tiledata = global.client.selected_tile_index | tile_rotate | tile_flip;
	draw_tile(tileset_colors8, tiledata, 0, pos_x, pos_y);
}
else {
	draw_set_color(c_black);
	draw_rectangle(pos_x, pos_y, pos_x+TILE_SIZE-1, pos_y+TILE_SIZE-1, false);
}
