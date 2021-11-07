import 'dart:io';
import 'dart:math';

/*
 * Ask the user for a number and determine whether the number is prime or not.
 *Do it using a function
 */
void main(List<String> arguments) {
  stdout.write("Please enter a number : ");
  var n = stdin.readLineSync()!;
  int number = int.parse(n);
  askNumber(number);
}

void askNumber(int? number) {
  int count = 0;
  List<int> b = [];
  for (var i = 1; i <= number!; i++) {
    if (number % i == 0) {
      count += 1;
      b.add(i);
    }
  }
  if (count > 2) {
    print(" The number $number ins't a prime number");
    print(b);
  } else {
    print("the number $number is a  prime number");
    print(b);
  }
}

// Another way to implement
void checkPrime(int number) {
  // List comprehensions
  List<int> a = [
    for (var i = 1; i <= number; i++)
      if (number % i == 0) i
  ];

  // Check for prime
  a.length == 2
      ? print("the chosen number $number is a prime")
      : print("The chosen number $number isn't a prime");
}
