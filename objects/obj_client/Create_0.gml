/// @description Initialize Client

global.selected_tile_index = 16;

instance_create_depth(16, 496, 10, obj_palette);
instance_create_depth(496, 496, 10, obj_button_eraseall);

scr_display_message("Client created.");