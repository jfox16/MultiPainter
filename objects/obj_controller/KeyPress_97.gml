/// @description Creates a server
// You can write your code in this editor

if (startup) {
	startup = false;
	scr_display_message("Creating a server...");
	instance_create_depth(0, 0, 100, obj_server_client);
}