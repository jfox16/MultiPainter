///@function scr_client_draw_small(socket, buffer, tile_x, tile_y, tile_index)
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
scr_client_draw_pixel(socket, buffer, tile_x-1, tile_y, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x+1, tile_y, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x, tile_y-1, tile_index);
scr_client_draw_pixel(socket, buffer, tile_x, tile_y+1, tile_index);
