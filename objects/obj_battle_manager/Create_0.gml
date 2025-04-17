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

    // Geometry
    ["Find the area of a triangle with base 10 and height 5", ["25", "50", "15", "30"], 0],
    ["How many degrees in the interior angles of a triangle?", ["90", "180", "270", "360"], 1],

    // Trigonometry
    ["sin(30) = ?", ["1", "1/2", "sqrt(3)/2", "0"], 1],
    ["cos(60) = ?", ["1", "0", "1/2", "sqrt(3)/2"], 2],

    // Limits
    ["What is lim(x->2) (x + 3)?", ["5", "2", "1", "0"], 0],

	
//Medium Level
	//Algebra
	["Solve for x in terms of y: 3x + 4y = 12", ["x = 12 - 4y", "x = (12 - 4y)/3", "x = 4y/3", "x = 3y - 12"], 1],
	["The sum of two numbers is 24, and their difference is 6. Find the numbers.", ["18 and 6", "15 and 9", "12 and 12", "20 and 4"], 1],
	["Solve the system: 2x + y = 10, 3x - y = 5", ["x = 2, y = 6", "x = 3, y = 4", "x = 1, y = 8", "x = 4, y = 2"], 1],

	// Geometry
	["A cylinder has height 10 and radius 4. Find its volume.", ["160π", "120pi", "80pi", "100pi"], 0],
	["Square inscribed in a circle, diameter 10. What is the area of the square?", ["50", "100", "25", "75"], 0],
	["Cone with radius 3 and height 6. Find the volume.", ["18pi", "9pi", "27pi", "36pi"], 0],

	// Trigonometry
	["A 10m ramp makes a 30deg angle. How high does it reach?", ["3m", "5m", "7m", "10m"], 1],
	["Solve for x: tan(x) = 1, 0deg ≤ x ≤ 180deg", ["45deg, 135deg", "30deg, 150deg", "60deg, 120deg", "0deg, 180deg"], 0],

// High Level
	// Algebra
	["A town grows 5percent per year from 10,000. What is population after 3 years?", ["11,000", "11,576", "12,000", "10,500"], 1],
	["Find vertex of y = x^2 - 4x + 3", ["(1, 2)", "(2, −1)", "(0, 3)", "(4, 3)"], 1],

	// Geometry
	["Parallel lines cut by transversal. One angle is 65deg. Find its corresponding angle.", ["55deg", "75deg", "65deg", "90deg"], 2],
	["Triangle with sides 8 and 10, angle 60deg. Find third side (Law of Cosines).", ["8.17", "9.17", "10.17", "11.17"], 1],
	["Triangle sides in 3:4:5 ratio, hypotenuse is 15. Find other sides.", ["7 & 10", "9 & 12", "6 & 8", "5 & 10"], 1],

	// Probability & Statistics
	["Probability of face card from a deck?", ["12/52 = 3/13", "4/52 = 1/13", "13/52 = 1/4", "26/52 = 1/2"], 0],
	["Two dice rolled. Probability of sum = 7?", ["1/6", "1/36", "5/36", "6/36"], 0],

	// Limits & Calculus
	["Evaluate: lim(x->0) x^2 / sin(x) using L’Hôpital’s Rule", ["0", "1", "infinity", "2"], 0],
	["Evaluate the integral of x^2 dx", ["x^3/3 + C", "x^2/2 + C", "x^3 + C", "x^4/4 + C"], 0],
	["s(t) = 3t^2 − 2t + 1. Find velocity function.", ["v(t) = 6t - 2", "v(t) = 3t - 2", "v(t) = 6t + 2", "v(t) = 3t + 1"], 0]
];

current_question = questions[global.question_index];