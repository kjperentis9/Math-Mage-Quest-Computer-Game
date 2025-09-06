Description:
- Built in GameMaker Studio, this game is structured as a top down RPG adventure game which engages its users through a   storyline and math based combat. It is structured to have various levels of difficulty for multiple different subjects. The user's goal is to progress through each level by answering multiple choice questions. 
How To Play:
- Move the character through the world using the WASD keys
- After coming in contact with an enemy and a question appears, choose from four answer options by clicking with the mouse
- Correct answers deal damage to enemy, while incorrect answers deal damage to the player
- Defeat all of the enemies in each level to move to the next
Math-Based Battle Mechanic:
- A list of questions is defined, each with:
  - A prompt
  - An array of four answer choices
  - The index of the correct answer
- Each question and answer choice is drawn at separate vertical positions
- Mouse input checks if the player clicked inside the bounds of a choice
- The program compares the selected choice with the correct index to determine correctness
Blocker Object Counter:
- A persistent controller object tracks a counter variable
- Each correct answer increases the counter by 1
- Blocker objects in the level run step events to check the counter
- When the counter reaches a threshold(all enemies are defeated), the blocker deletes itself, allowing the user to progress to the next level.
