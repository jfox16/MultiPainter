/// @description Read input and draw
// You can write your code in this editor

if (fill_cooldown > 0) fill_cooldown--;

if ( (mouse_check_button(mb_left) || mouse_check_button(mb_right))
	&& position_meeting(mouse_x, mouse_y, self) ) {
		
	var tile_index = selected_tile_index;
	if (mouse_check_button(mb_right)) tile_index = 0;
	
	var tile_x = floor(mouse_x / TILE_SIZE);
	var tile_y = floor(mouse_y / TILE_SIZE);
	var socket = global.server_socket;
	var buffer = global.send_buffer;
	
	if (!was_clicking) {
		last_tile_x = tile_x;
		last_tile_y = tile_y;
		was_clicking = true;
	}
	
	if (global.brush_type == BRUSH_TYPE_FILL) {
		if (fill_cooldown == 0) {
			var origin_tiledata = tilemap_get(global.pixels_tilemap, tile_x, tile_y);
			var origin_tile_index = tile_get_index(origin_tiledata);
			scr_client_draw_fill(socket, buffer, tile_x, tile_y, tile_index, origin_tile_index);
			fill_cooldown = fill_delay;
		}
	}
	else {
		var dx = tile_x - last_tile_x;
		var dy = tile_y - last_tile_y;
		scr_display_message(string(last_tile_x) + "," + string(last_tile_y) + " -> "
			+ string(tile_x) + "," + string(tile_y)
			+ "[dx:" + string(dx) + "] [dy:" + string(dy) + "]");
		
		scr_client_draw_brush(global.brush_type, socket, buffer, tile_x, tile_y, tile_index);
		
		if (was_clicking) {
			if (abs(dx)>=abs(dy)) {
				var slope = dy/dx;
				for (var i=0; i!=dx; i+=sign(dx)) {
					var tx = last_tile_x + i;
					var ty = last_tile_y + round(slope*i);
					scr_client_draw_brush(global.brush_type, socket, buffer, tx, ty, tile_index);
				}
			}
			else {
				var slope = dx/dy;
				for (var i=0; i!=dy; i+=sign(dy)) {
					var tx = last_tile_x + round(slope*i);
					var ty = last_tile_y + i;
					scr_client_draw_brush(global.brush_type, socket, buffer, tx, ty, tile_index);
				}
			}
		}
	}

	last_tile_x = tile_x;
	last_tile_y = tile_y;
}
else {
	was_clicking = false;
}