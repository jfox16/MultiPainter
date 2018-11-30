/// @description Initialize Server


global.client_sockets = ds_list_create();

var socket_type = network_socket_tcp;
var port = 25653;
scr_display_message("Creating server... [port: " + string(port) = "]");
server = network_create_server(socket_type, port, NUM_CLIENTS_MAX);

scr_display_message("Server created.");
image_blend = c_aqua;