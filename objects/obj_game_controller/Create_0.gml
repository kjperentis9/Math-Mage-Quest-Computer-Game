if (!instance_exists(obj_player)) {
    var player = instance_create_layer(x, y, "Instances", obj_player);
    player.x = 180; 
    player.y = 100; 
}
if (!variable_global_exists("enemies_defeated")) {
    global.enemies_defeated = 0;
}
if (!variable_global_exists("question_index")) {
    global.question_index = 0;
}

if (!variable_global_exists("kills_room1")) {
    global.kills_room1 = 0;
}
if (!variable_global_exists("teleporting")) {
    global.teleporting = false;
}
if (!variable_global_exists("returning_from_room3")) {
    global.returning_from_room3 = false;
}

if (global.returning_from_room3) {
    global.returning_from_room3 = false;
    alarm[0] = 1;
}