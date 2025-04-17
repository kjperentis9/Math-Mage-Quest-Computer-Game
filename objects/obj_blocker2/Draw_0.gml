// Set up text
var msg = "Defeat 8 Enemies\nto Unlock";
draw_set_font(Font1); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Background box centered on origin
draw_set_color(c_black);
draw_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, false);

// Draw the text centered on the origin
draw_set_color(c_white);
draw_text(x, y, msg);