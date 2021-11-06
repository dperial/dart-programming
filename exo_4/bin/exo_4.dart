import 'dart:io';
/*
 * Create a program that asks the user for a number and then prints out a list 
 * of all the divisors of that number.
 *If you don’t know what a divisor is, it is a number that divides evenly into 
 *another number. For example, 13 is a divisor of 26 because 26 / 13 has no remainder.
 */

void main(List<String> arguments) {
  stdout.write("Please Enter a number here : ");

  var n = stdin.readLineSync();
  int? number = int.tryParse(n ?? '');
  List<int> resultList = [];

  for (int i = 1; i <= number!; i++) {
    if (number % i == 0) {
      resultList.add(i);
    }
  }
  print(resultList);
}
