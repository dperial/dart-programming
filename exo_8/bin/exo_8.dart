/*
 * Make a two-player Rock-Paper-Scissors game against computer.
 *Ask for player’s input, compare them, print out a message to the winner.
 */
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print(
      "Are you reading to play again the best machine ever !!! \n  Tape 'exit' to stop the GAME!");

  final random = Random();

  // Game Rules
  Map<String, String> rules = {
    'rock': 'scissors',
    'paper': 'rock',
    'scissors': 'paper'
  };

  // Point in the game
  int userPoint = 0;
  int compPoint = 0;

  // User name
  stdout.write('Please enter your name : ');
  String userName = stdin.readLineSync()!.toLowerCase();

  // Computer Choices
  String compName = "Computer";
  List<String> compChoices = ['rock', 'paper', 'scissors'];

  while (true) {
    String compChoice = compChoices[random.nextInt(compChoices.length)];
    stdout.write("Make a choose between : Rock | Paper | Scissors  !!");
    String userChoice = stdin.readLineSync()!.toLowerCase();

    if (userChoice == "exit") {
      print(
          "$userName stop the game. \n Points| $userName = $userPoint & $compName = $compPoint");
      break;
    }
    if (!compChoices.contains(userChoice)) {
      print("Incorrect choice! Please enter a correct one :");
      continue;
    } else if (compChoice == userChoice) {
      print("OOHHHH we have a DRAWW!!!!!!");
    } else if (rules[compChoice] == userChoice) {
      print("Computer WINS : $compChoice VS $userChoice");
      compPoint += 1;
    } else if (rules[userChoice] == compChoice) {
      print("User WINS :  $userChoice VS $compChoice");
      userPoint += 1;
    }
  }
}
