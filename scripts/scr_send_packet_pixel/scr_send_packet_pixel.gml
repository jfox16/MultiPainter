/// scr_send_packet_pixel(socket, buffer, tile_x, tile_y, tile_index)
/// @param socket
/// @param buffer
/// @param tile_x
/// @param tile_y
/// @param tile_index

var socket = argument0;
var buffer = argument1;
var tile_x = argument2;
var tile_y = argument3;
var tile_index = argument4;

scr_display_message("Sending pixel at tile " + string(tile_x) + ", " + string(tile_y) 
	+ ", index " + string(tile_index));

buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer, buffer_u8, PACKET_PIXEL); //packet type
buffer_write(buffer, buffer_u8, tile_x); //tile x
buffer_write(buffer, buffer_u8, tile_y); //tile y
buffer_write(buffer, buffer_u8, tile_index); //tile index

scr_display_message("Sending packet... [socket: " + string(socket) + "] [buffer: " + string(buffer) + "]");
network_send_packet(socket, buffer, buffer_tell(buffer));