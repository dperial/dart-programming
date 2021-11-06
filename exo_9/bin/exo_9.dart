import 'dart:io';
import 'dart:math';

/*
 * Generate a random number between 1 and 100. Ask the user to guess the number, then tell them whether they guessed too low, too high, or exactly right.
 *Keep track of how many guesses the user has taken, and when the game ends, print this out.
 */
void main(List<String> arguments) {
  print(
      "Are you reading to play this amazing GAME !!! \n  Tape 'exit' to stop the GAME!");

  // another way with function
  guessingGame();
}

guessingGame() {
  final random = Random();
  int? numberGen = random.nextInt(100);
  // Count how many game have been play
  int playGame = 0;

  while (true) {
    playGame += 1;
    stdout.write("Enter number between [ 0 - 100 ] ?");
    var value = stdin.readLineSync()!;

    int? number = int.tryParse(value);
    // Make sure user does not go out of limit
    if (value.toLowerCase() == "exit") {
      print("\n Bye, see you later.");
      break;
    } else if (number! < 0 && number > 100) {
      print("Please enter a number between | 0 - 100 | :");
      continue;
    }

    // Main Logic
    if (number > numberGen) {
      print("The number you enter is too high !!");
      continue;
    } else if (number < numberGen) {
      print("The number you enter is too low !!");
      continue;
    } else {
      print("The number you enter is the exact one !! CONGRATILATION ");
      print("You have play : $playGame time(s)");

      break;
    }
  }
}
