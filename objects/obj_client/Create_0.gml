/// @description Initialize Client

var size = 1024;
var buffer_type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size,buffer_type,alignment);

global.selected_tile_index = 16;

instance_create_depth(16, 496, 10, obj_palette);



scr_display_message("Client created.");