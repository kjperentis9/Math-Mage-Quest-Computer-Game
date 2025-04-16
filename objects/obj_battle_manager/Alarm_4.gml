if (instance_exists(obj_battle_enemy)) {
    waiting_for_answer = true;
    show_incorrect_msg = false;
    wrong_attempts = 0;
    current_question = questions[global.question_index];
}