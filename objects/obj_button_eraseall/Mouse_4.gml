/// @description 

var erase = show_question("Erase everything?");

if (erase) {
	scr_send_packet_eraseall(global.server_socket, global.send_buffer);
}