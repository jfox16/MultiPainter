/// @function scr_client_draw_brush(brush_type, socket, buffer, tile_x, tile_y, tile_index)
/// @param brush_type
/// @param socket
/// @param buffer
/// @param tile_x
/// @param tile_y
/// @param tile_index

var brush_type = argument0;
var socket = argument1;
var buffer = argument2;
var tile_x = argument3;
var tile_y = argument4;
var tile_index = argument5;
		
switch (global.brush_type) {
	case BRUSH_TYPE_SMALL:
		scr_client_draw_small(socket, buffer, tile_x, tile_y, tile_index);
		break;
	case BRUSH_TYPE_MEDIUM:
		scr_client_draw_medium(socket, buffer, tile_x, tile_y, tile_index);
		break;
	case BRUSH_TYPE_LARGE:
		scr_client_draw_large(socket, buffer, tile_x, tile_y, tile_index);
		break;
	default:
		scr_client_draw_pixel(socket, buffer, tile_x, tile_y, tile_index);
		break;
}