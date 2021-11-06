import 'dart:io';

/*
 * Ask the user for a string and print out whether this string is a palindrome or not.
 *A palindrome is a string that reads the same forwards and backwards.
 */
void main(List<String> arguments) {
  stdout.write("Enter a string here :");

  String value = stdin.readLineSync()!.toLowerCase();
  String revValue = value.split('').reversed.join('');

  print("This is value giving : $value");
  // Tenary operator
  value == revValue
      ? print("The giving word is a PALINDROME!!!")
      : print("The giving word isn't a PALINDROME");
}
