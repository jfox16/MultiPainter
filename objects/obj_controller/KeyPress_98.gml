/// @description Joins a Server
// You can write your code in this editor

if (startup) {
	var socket_type = network_socket_tcp;
	var ip = get_string("Which IP address do you want to connect to?","");

	var port = 25653;
	var socket = network_create_socket(socket_type);
	scr_display_message("Connecting to network... [socket: " + string(socket) 
		+ "] [ip: " + string(ip) + "] [port: " + string(port) + "]");
		
	var connection = network_connect(socket, ip, port);
	
	if (connection < 0) {
		scr_display_message("Connection failed.");
		show_message_async("Unable to connect.");
	}
	else {
		scr_display_message("Connection successful");
		var new_client = instance_create_depth(0, 0, 100, obj_client);
		global.server_socket = socket;
		new_client.client_id = 5;
		startup = false;
	}
}