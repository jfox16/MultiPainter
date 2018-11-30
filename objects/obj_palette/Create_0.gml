/// @description Insert description here
// You can write your code in this editor

var selector_x = x + ((global.selected_tile_index % 8)*32);
var selector_y = y + (floor(global.selected_tile_index / 8)*32);
selector = instance_create_depth(selector_x, selector_y, depth-1, obj_selector);