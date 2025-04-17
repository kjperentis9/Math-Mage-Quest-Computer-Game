if (keyboard_check_pressed(ord("K"))) {
    global.enemies_defeated += 1;
    global.kills_room1 += 1; // ← Add this line so Blocker 1 also responds
    show_debug_message("Enemies defeated: " + string(global.enemies_defeated));
    show_debug_message("Kills Room 1: " + string(global.kills_room1));
}
global.teleporting = false;