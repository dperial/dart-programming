/*
 * Write a program (using functions!) that asks the user for a long string containing multiple words. Print back to the user the same string, except with the words in backwards order.
 *For example, say I type the string:
 *My name is Michele
 *Then I would see the string:
 *Michele is name My
 */
import 'dart:io';

void main(List<String> arguments) {
  stdout.write("Enter your sentence here : ");
  String? sentence = stdin.readLineSync();

  print("Initial sentece is : $sentence\n");
  print("Backwards sentence is : ${inversedString(sentence!)}\n");
}

String inversedString(String sen) {
  /* Split the sentence into a list of words
  Reverse the list, then join the words back */
  String value = sen.split(" ").reversed.join(" ");

  return value;
}
