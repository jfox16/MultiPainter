/// @description Initialize Server

image_blend = c_aqua;

var socket_type = network_socket_tcp;
var port = 25653;
scr_display_message("Creating server... [port: " + string(port) = "]");
server = network_create_server(socket_type, port, NUM_CLIENTS_MAX);

var size = 1024;
var buffer_type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size,buffer_type,alignment);

global.client_sockets = ds_list_create();

scr_display_message("Server created.");