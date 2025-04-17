if (!global.teleporting) {
    global.teleporting = true;
    show_debug_message("Portal used: ToRoom1_1");
    room_goto(Room1);
}