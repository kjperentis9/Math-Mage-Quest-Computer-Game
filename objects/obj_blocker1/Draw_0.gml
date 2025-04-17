// Draw the black sprite (background block)
draw_self();

// Set up the font and alignment
draw_set_font(Font1); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Draw centered text over the block
var msg = "Defeat 8 Enemies\nto Unlock";
draw_text(x + sprite_width / 2, y + sprite_height / 2, msg);