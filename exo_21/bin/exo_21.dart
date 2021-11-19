/*
 * You, the user, will have in your head a number between 0 and 100. 
 * The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.
 *At the end of this exchange, your program should print out how many guesses 
 *it took to get your number.
 */
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print("""\n
  Hello boss. I am your laptop.
  Please, think of a number between 0 and 100.
  I will try to guess it and blow your mind.

  If my guess is too low, type "low". If I am too high, type "high".
  If I guess your number correctly, type "yes".
  """);

  guessMachine();
}

guessMachine() {
  final random = Random();
  List<int> numList = List.generate(101, (i) => i);
  int guess = numList[random.nextInt(numList.length)];
  int count = 0;

  while (true) {
    count += 1;

    stdout.write("\nIs $guess your number? ");
    String response = stdin.readLineSync()!.toLowerCase();
    print(numList);

    if (response == "yes") {
      print("\nI got it! Attempts: $count\n");
      break;
    } else if (response == "low") {
      numList = numList.where((e) => e > guess).toList();
      guess = numList[random.nextInt(numList.length)];
    } else if (response == "high") {
      numList = numList.where((e) => e < guess).toList();
      guess = numList[random.nextInt(numList.length)];
    }
  }
}
