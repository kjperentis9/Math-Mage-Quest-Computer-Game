if (waiting_for_answer) 
{
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1); 

    var q = current_question[0];
    var choices = current_question[1];

    draw_text(50, 50, "Question: " + q);

    for (var i = 0; i < array_length(choices); i++)
	{
        var text_y = 100 + i * 40;

        draw_set_color(c_white); 
        draw_rectangle(45, text_y - 5, 400, text_y + 25, false);

        draw_set_color(c_black); 
        draw_text(50, text_y, string(i+1) + ": " + choices[i]);
    }
}


if (show_incorrect_msg) 
{
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_text(100, 250, "Incorrect. Try again!");
}