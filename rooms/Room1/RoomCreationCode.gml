if (global.returning_from_room3)
{
    global.returning_from_room3 = false;

    // Move player in the first frame AFTER Room1 loads
    alarm[0] = 1; // Set up a small delay to let Room1 fully load
}