/// @description Insert description here
// You can write your code in this editor

var network_type = async_load[? "type"];

switch(network_type) {	
	case network_type_data:
		var buffer = async_load[? "buffer"];
		scr_client_handle_packet(buffer);
		scr_display_message("Package received.");
	break;
}