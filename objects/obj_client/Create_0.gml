/// @description Initialize Client

global.client = self;

instance_create_depth(16, 496, 10, obj_palette);
instance_create_depth(496, 496, 10, obj_button_eraseall);
instance_create_depth(496, 560, 10, obj_button_brush);

fill_cooldown = 0;
fill_delay = 10;

scr_display_message("Client created.");