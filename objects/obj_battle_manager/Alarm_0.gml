obj_battle_enemy.data.hp -= damage_to_enemy;

// alarm[1] = 60;

if (check_for_end()) {
    alarm[2] = 60;
}
else {
    alarm[1] = 60;
    
    obj_battle_enemy.alarm[0] = 30;
}