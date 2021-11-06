import 'dart:io';
/* Exercise 2: Ask the user for a number. 
Depending on whether the number is even or odd, 
print out an appropriate message to the user.
*/

void main(List<String> arguments) {
  stdout.write('My friend please enter a number here :');

  var n = stdin.readLineSync();
  int? number = int.tryParse(n ?? '');
  if (number != null) {
    if (number % 2 == 0) {
      print("My friend type an odd number $number ");
    } else {
      print("my friend type an even number $number ");
    }
  } else {
    stdout.write('Please enter a number here my friend :');
  }
}
