if (!waiting_for_answer) exit;

var mouse_x_pos = device_mouse_x_to_gui(0);
var mouse_y_pos = device_mouse_y_to_gui(0);

for (var i = 0; i < 4; i++) {
    var top = 100 + i * 40;
    var bottom = top + 30;
    if (mouse_y_pos > top && mouse_y_pos < bottom) 
	{
		var correct_index = current_question[2];
		if (i == correct_index) 
		{
			// CORRECT
			obj_battle_enemy.data.hp = 0;
			instance_destroy(obj_battle_enemy); 
			global.kills_room1 += 1;
			global.enemies_defeated += 1;
			global.question_index += 1;
			if (global.question_index >= array_length(questions)) {
    global.question_index = 0; // or show victory/end battle logic
}
			current_question = questions[global.question_index];
			alarm[3] = room_speed; 
			waiting_for_answer = false;
			show_incorrect_msg = false;
        } 
		else 
		{
            // WRONG
            wrong_attempts++;

            if (wrong_attempts == 1) 
			{
                obj_battle_player.data.hp /= 2;
                show_incorrect_msg = true;
            } 
			else 
			{
                obj_battle_player.data.hp = 0;
				room_goto(Room1);
                waiting_for_answer = false;
                show_incorrect_msg = false;
            }
        }

        break;
    }
}