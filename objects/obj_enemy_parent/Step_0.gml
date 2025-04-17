// Only chase the player if they're nearby
if (instance_exists(obj_player)) {
    var detect_range = 130; 
    if (point_distance(x, y, obj_player.x, obj_player.y) <= detect_range) {
        target_x = obj_player.x;
        target_y = obj_player.y;
    }
}
// Calculate vector to target
var dx = target_x - x;
var dy = target_y - y;
var dist = point_distance(x, y, target_x, target_y);

// If close enough to target, stop moving
if (dist > 8) {
    dx /= dist;
    dy /= dist;
    move_and_collide(dx * move_speed, dy * move_speed, [tilemap, obj_enemy_parent]);
}

// Health check
if (hp <= 0) {
    instance_destroy();
}