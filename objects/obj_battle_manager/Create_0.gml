enemy_turn = 0;
damage_to_enemy = 0;
alarm[1] = -1;

player_attack = function (_damage) 
{
    damage_to_enemy = _damage;
    enemy_turn = 1;
    alarm[0] = 40;
    
    obj_battle_player.alarm[0] = 10;
    
}

check_for_end = function()
{
    return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0);
}

//  Question System Setup 
waiting_for_answer = true;
wrong_attempts = 0;
show_incorrect_msg = false;

questions = 
[
//Low Level
   // Algebra
    ["Solve for x: 5x - 7 = 18", ["x = 7", "x = 5", "x = 10", "x = 6"], 1],
    ["Factor: x² - 9x + 20", ["(x-4)(x-5)", "(x+4)(x+5)", "(x-2)(x-10)", "(x+1)(x-20)"], 0],
    ["Simplify: (3x^² + 6x) / 3x", ["x + 2", "3x + 2", "3x", "x + 3"], 0],
    ["If f(x) = 2x + 5, find f(3)", ["11", "9", "8", "7"], 0],

    // Geometry
    ["Find the area of a triangle with base 10 and height 5", ["25", "50", "15", "30"], 0],
    ["How many degrees in the interior angles of a triangle?", ["90", "180", "270", "360"], 1],
    ["What is the perimeter of a square with side length 4?", ["12", "14", "16", "8"], 2],

    // Trigonometry
    ["sin(30°) = ?", ["1", "1/2", "√3/2", "0"], 1],
    ["cos(60°) = ?", ["1", "0", "1/2", "√3/2"], 2],
    ["tan(45°) = ?", ["1", "0", "√3", "√2"], 0],

    // Probability
    ["What is the probability of rolling a 4 on a standard die?", ["1/4", "1/3", "1/6", "1/2"], 2],
    ["What is the probability of flipping heads on a coin?", ["1/2", "1/3", "1/4", "1"], 0],
    ["If a bag has 2 red, 3 blue marbles, chance of red?", ["1/5", "2/5", "3/5", "1/2"], 1],

    // Limits
    ["What is limₓ→2 (x + 3)?", ["5", "2", "1", "0"], 0],
    ["What is limₓ→0 (sin x / x)?", ["1", "0", "undefined", "x"], 0],
    ["What is limₓ→∞ (1/x)?", ["0", "1", "∞", "undefined"], 0]
];

current_question = questions[global.question_index];