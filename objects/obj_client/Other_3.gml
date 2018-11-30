/// @description Delete socket and buffer

network_destroy(global.server_socket);
buffer_delete(global.send_buffer);