// Draw the full black tile
draw_self();

// Set up text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(Font1); // Use your actual font name

// Draw centered over the 2x2 area (64×64)
draw_text(x + 32, y + 32, "Defeat 10 Enemies\nto Unlock");;