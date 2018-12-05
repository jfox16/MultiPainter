/// @description Read input -> Create, Join, or Exit

// Create a Server
if (keyboard_check_pressed(ord("1")) || keyboard_check_pressed(vk_numpad1)) {
	
	if (startup) {
		startup = false;
		show_display_log = true;
		scr_display_message("Creating a server...");
		instance_create_depth(0, 0, 100, obj_server_client);
	}
	
}

// Join a Server
else if (keyboard_check_pressed(ord("2")) || keyboard_check_pressed(vk_numpad2)) {

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
	
}

// Exit Game
else if (keyboard_check_pressed(vk_escape)) {
	var confirm_exit = show_question("Are you sure you want to Exit?");
	if (confirm_exit) game_end();
}