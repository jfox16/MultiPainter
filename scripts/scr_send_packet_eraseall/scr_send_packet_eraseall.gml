///@function scr_send_packet_eraseall(socket, buffer)
///@param socket
///@param buffer


var socket = argument0;
var buffer = argument1;

buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer, buffer_u8, PACKET_ERASEALL); //packet type

scr_display_message("Sending ERASEALL");
network_send_packet(socket, buffer, buffer_tell(buffer));