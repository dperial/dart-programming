import "dart:math";
import 'dart:io';

void main(List<String> arguments) {
  final String listWorld = randomWord('swopods.txt');

  print(listWorld);
}

String randomWord(String txt) {
  /**
   * Read the given file as a list
   * Then picks a random word from it
   */
  // generates a new Random object
  final _random = Random();

  // Get access to the file
  var file = File(txt);

  // Create a list to receive the file
  List<String> wordList = file.readAsLinesSync();
  // generate a random index based on the list length
  // and use it to retrieve the element
  String word = wordList[_random.nextInt(wordList.length)];
  return word;
}
