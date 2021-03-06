/*
 * Write a password generator in Dart. Be creative with how you generate 
 * passwords - strong passwords have a mix of lowercase letters, 
 * uppercase letters, numbers, and symbols. The passwords should be random, 
 * generating a new password every time the user asks for a new password. 
 * Include your run-time code in a main method.

 * Ask the user how strong they want their password to be. For weak passwords, pick a word or two from a list.

 * :exclamation: Do not use the generated password in your real accounts. Use 1password= 'https://1password.com/.
 */
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // User Answer choice
  List<String> userAnsChoice = ["yes", "no"];

  // Password types choices
  List<String> passwordTypesChoices = ["weak", "medium", "strong"];
  //List of weak password and randomly choice one between

  while (true) {
    stdout.write("Do you want a new password ? \n yes | no ");
    String userAnswer = stdin.readLineSync()!;

    if (userAnswer == "no" || userAnswer == "exit") {
      print("Bye bye!!");
      break;
    }
    if (!userAnsChoice.contains(userAnswer)) {
      print("Please enter a choice between yes |  no");
      continue;
    }
    stdout.write("How should be your password ? \n weak | medium |strong ");
    String passChoice = stdin.readLineSync()!;

    if (!passwordTypesChoices.contains(passChoice)) {
      print("Please choice a password type between : weak | medium | strong");
      continue;
    }
    if (passChoice == "weak") {
      // print("Your weak password is : ${getRandomString(5)}");
      shuffleGenerator(5);
      continue;
    } else if (passChoice == "medium") {
      // print("Your medium password is : ${getRandomString(15)}");
      shuffleGenerator(15);
      continue;
    } else {
      // print("Your strong password is : ${getRandomString(25)}");
      shuffleGenerator(20);
      continue;
    }
  }
}

const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random random = Random.secure();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));

// Another way to solve the random generate sequence string
// Create a random sequence of characters
void shuffleGenerator(int strength) {
  final random = Random.secure();
  List<int> intList = List.generate(strength, (_) => random.nextInt(255));
  List charList = base64UrlEncode(intList).split('').toList();
  charList.shuffle();
  print("\nYour password is: ${charList.join('')}\n");
}
