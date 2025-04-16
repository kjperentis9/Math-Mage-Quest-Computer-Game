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
    ["Factor: x^2 - 9x + 20", ["(x-4)(x-5)", "(x+4)(x+5)", "(x-2)(x-10)", "(x+1)(x-20)"], 0],
    ["Simplify: (3x^2 + 6x) / 3x", ["x + 2", "3x + 2", "3x", "x + 3"], 0],
    ["If f(x) = 2x + 5, find f(3)", ["11", "9", "8", "7"], 0],

    // Geometry
    ["Find the area of a triangle with base 10 and height 5", ["25", "50", "15", "30"], 0],
    ["How many degrees in the interior angles of a triangle?", ["90", "180", "270", "360"], 1],
    ["What is the perimeter of a square with side length 4?", ["12", "14", "16", "8"], 2],

    // Trigonometry
    ["sin(30) = ?", ["1", "1/2", "sqrt(3)/2", "0"], 1],
    ["cos(60) = ?", ["1", "0", "1/2", "sqrt(3)/2"], 2],
    ["tan(45) = ?", ["1", "0", "sqrt(3)", "sqrt(2)"], 0],

    // Probability
    ["What is the probability of rolling a 4 on a standard die?", ["1/4", "1/3", "1/6", "1/2"], 2],
    ["What is the probability of flipping heads on a coin?", ["1/2", "1/3", "1/4", "1"], 0],
    ["If a bag has 2 red, 3 blue marbles, chance of red?", ["1/5", "2/5", "3/5", "1/2"], 1],

    // Limits
    ["What is lim(x->2) (x + 3)?", ["5", "2", "1", "0"], 0],
    ["What is lim(x->0) (sin x / x)?", ["1", "0", "undefined", "x"], 0],
    ["What is lim(x->infinity) (1/x)?", ["0", "1", "infinity", "undefined"], 0]
//Medium Level
	//Allgebra
	["Solve for x in terms of y: 3x + 4y = 12", ["x = 12 − 4y", "x = (12 − 4y)/3", "x = 4y/3", "x = 3y − 12"], 1],
	["The sum of two numbers is 24, and their difference is 6. Find the numbers.", ["18 and 6", "15 and 9", "12 and 12", "20 and 4"], 1],
	["Solve the system: 2x + y = 10, 3x − y = 5", ["x = 2, y = 6", "x = 3, y = 4", "x = 1, y = 8", "x = 4, y = 2"], 1],

	// Geometry
["A cylinder has height 10 cm and radius 4 cm. Find its volume.", ["160π cm³", "120π cm³", "80π cm³", "100π cm³"], 0],
["Square inscribed in a circle, diameter 10 cm. What is the area of the square?", ["50 cm²", "100 cm²", "25 cm²", "75 cm²"], 0],
["Cone with radius 3 cm and height 6 cm. Find the volume.", ["18π cm³", "9π cm³", "27π cm³", "36π cm³"], 0],

	// Trigonometry
["A 10m ramp makes a 30° angle. How high does it reach?", ["3 meters", "5 meters", "7 meters", "10 meters"], 1],
["Solve for x: tan(x) = 1, 0° ≤ x ≤ 180°", ["45°, 135°", "30°, 150°", "60°, 120°", "0°, 180°"], 0],
["If tan(θ) = 3/4, find sin(θ) and cos(θ).", ["sin = 3/5, cos = 4/5", "sin = 4/5, cos = 3/5", "sin = 5/3, cos = 5/4", "sin = 5/4, cos = 3/5"], 0],

// High Level
	// Algebra
["A town grows 5% per year from 10,000. What is population after 3 years?", ["11,000", "11,576", "12,000", "10,500"], 1],
["Find vertex of y = x^2 − 4x + 3", ["(1, 2)", "(2, −1)", "(0, 3)", "(4, 3)"], 1],

	// Geometry
["Parallel lines cut by transversal. One angle is 65°. Find its corresponding angle.", ["55°", "75°", "65°", "90°"], 2],
["Triangle with sides 8 cm and 10 cm, angle 60°. Find third side (Law of Cosines).", ["8.17 cm", "9.17 cm", "10.17 cm", "11.17 cm"], 1],
["Triangle sides in 3:4:5 ratio, hypotenuse is 15 cm. Find other sides.", ["7 cm & 10 cm", "9 cm & 12 cm", "6 cm & 8 cm", "5 cm & 10 cm"], 1],

	// Probability & Statistics
["Probability of face card from a deck?", ["12/52 = 3/13", "4/52 = 1/13", "13/52 = 1/4", "26/52 = 1/2"], 0],
["Two dice rolled. Probability of sum = 7?", ["1/6", "1/36", "5/36", "6/36"], 0],
["Event has 30% chance. Odds against it happening?", ["3:7", "7:3", "3:10", "10:3"], 1],

	// Limits & Calculus
["Evaluate: lim(x→0) x² / sin(x) using L’Hôpital’s Rule", ["0", "1", "∞", "2"], 0],
["Evaluate ∫x² dx", ["x³/3 + C", "x²/2 + C", "x³ + C", "x⁴/4 + C"], 0],
["s(t) = 3t² − 2t + 1. Find velocity function.", ["v(t) = 6t − 2", "v(t) = 3t − 2", "v(t) = 6t + 2", "v(t) = 3t + 1"], 0]
];

current_question = questions[global.question_index];