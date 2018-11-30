/// @description 

var network_type = async_load[? "type"];

switch(network_type) {
	case network_type_connect:
	case network_type_non_blocking_connect:
		var client_socket = async_load[? "socket"];
		ds_list_add(global.client_sockets, client_socket);
		
		for (var tx=0; tx<TILEMAP_WIDTH; tx++) {
			for (var ty=0; ty<TILEMAP_HEIGHT; ty++) {
				var tiledata = tilemap_get(global.pixels_tilemap, tx, ty);
				var tile_index = tile_get_index(tiledata);
				scr_send_packet_pixel(client_socket, buffer, tx, ty, tile_index);
			}
		}
		
		scr_display_message("Client connected. [socket: " + string(client_socket) + "] [clients: " 
			+ string(ds_list_size(global.client_sockets)) + "]");
	break;
	
	case network_type_data:
		var async_buffer = async_load[? "buffer"];
		scr_server_handle_packet(async_buffer);
		scr_display_message("Package received.");
	break;
	
	case network_type_disconnect:
		var client_socket = async_load[? "socket"];
		var client_index = ds_list_find_index(global.client_sockets, client_socket);
		ds_list_delete(global.client_sockets, client_index);
		scr_display_message("Client disconnected. [socket: " + string(client_socket) + "] [clients: " 
			+ string(ds_list_size(global.client_sockets)) + "]");
	break;
}