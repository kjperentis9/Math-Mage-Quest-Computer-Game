if (obj_player.portal_delay > 0) {
    show_debug_message("TO ROOM 2 BLOCKED by delay: " + string(obj_player.portal_delay));
    exit;
}

show_debug_message("TO ROOM 2 TRIGGERED by: " + string(other));
show_debug_message("Portal used: ToRoom2");
room_goto(Room2);