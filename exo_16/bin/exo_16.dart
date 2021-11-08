import 'dart:io';
import 'dart:math';
/*
 * Create a program that will play the “cows and bulls” game with the user. 
 * The game works like this:
 *Randomly generate a 4-digit number. Ask the user to guess a 4-digit number. 
 *For every digit the user guessed correctly in the correct place, they have a “cow”. 
 *For every digit the user guessed correctly in the wrong place is a “bull.”
 *Every time the user makes a guess, tell them how many “cows” and “bulls” they have. 
 *Once the user guesses the correct number, the game is over. Keep track of the number 
 *of guesses the user makes throughout the game and tell the user at the end.
 */

void main(List<String> arguments) {
  List<String> listString = fourDigitGenerator().split('');
  print(listString);

  // Count User guess
  int userGuess = 0;
  int countCow = 0;
  int countBull = 0;

  print("Are you ready to play [ COW | BULL ] GAME ?\n"
      "You will guess 4 Digit number from now, COW if you guess right and BULL if it's not correct. \n Are you ready ?? \n ");

  // ignore: unrelated_type_equality_checks
  while (listString.isNotEmpty) {
    userGuess += 1;
    stdout.write("Guess your Digit !");
    String firstDigit = stdin.readLineSync()!;
    print("firsDigit : $firstDigit");

    if (firstDigit == listString.first) {
      listString.remove(firstDigit);
      print("COW");
      countCow += 1;
      print(
          'You already have: \n Gues: $userGuess \n  COW =$countCow \n BULL = $countBull');
    } else {
      print("BULL");
      countBull += 1;
      print(
          "You already have: \n Gues: $userGuess \n COW =$countCow \n BULL = $countBull ");
    }

    // ignore: iterable_contains_unrelated_type
  }
  print(
      " You found the 4 Digits with $userGuess : \n COW =$countCow \n BULL = $countBull");
}

String fourDigitGenerator() {
  Random random = Random();
  double value = random.nextDouble() * 10000;
  while (value < 1000) {
    value *= 10;
  }
  int valInt = value.toInt();
  // print(valInt);
  return valInt.toString();
}
