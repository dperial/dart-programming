import 'dart:io';

/*
 * Exercise 1:
 * Create a program that asks the user to enter their name and their age. 
 * Print out a message that tells how many years they have to be 100 
 * years old.
 */
void main() {
  stdout.write("What is your name my friend ?");
  String? name = stdin.readLineSync();

  stdout.write("How old are you $name ?");
  var age = stdin.readLineSync();

  int? myAge = int.tryParse(age ?? "");
  if (myAge == null) {
    print("Please enter you age my friend $name ?");
  } else {
    int? yourAgeBefore100 = 100 - myAge;
    print(
        "My friend $name, you have $yourAgeBefore100 years to be 100.Congratilation!!!!");
  }
}
