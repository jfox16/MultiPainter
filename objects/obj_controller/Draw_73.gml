/// @description Draw display log
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab)) 
	show_display_log = !show_display_log;

if (startup) {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(0, 0, instructions);
}
else if (show_display_log) {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	for (var i=0; i<array_length_1d(global.display_log); i++) {
		draw_text(0, i*16, global.display_log[i]);
	}
}