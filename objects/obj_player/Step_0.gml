var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collide with tilemap and obj_blockers
move_and_collide(
    _hor * move_speed,
    _ver * move_speed,
    [tilemap, obj_blocker1, obj_blocker2, obj_blocker3], 
    undefined, undefined, undefined,
    move_speed, move_speed
);

//  walking animation
if (_hor != 0 || _ver != 0) {
    if (_ver > 0) {
        sprite_index = spr_player_walk_down;
    } else if (_ver < 0) {
        sprite_index = spr_player_walk_up;
    } else if (_hor > 0) {
        sprite_index = spr_player_walk_right;
    } else if (_hor < 0) {
        sprite_index = spr_player_walk_left;
    }
}
else {
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}

// Player death
if (hp <= 0) {
    game_restart();
}

if (portal_delay > 0) {
    portal_delay -= 1;
}