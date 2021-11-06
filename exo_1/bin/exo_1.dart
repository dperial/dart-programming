import 'dart:io';

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
