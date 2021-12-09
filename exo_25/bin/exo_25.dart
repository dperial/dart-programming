import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  String listWorld = randomWord('bin/swopods.txt');

  intro();
  hangman(listWorld);
}

void intro() {
  print("""\n
  Welcome to Hagman!
  We prepared a word for you.
  You have 6 attempts to guess it correctly
  You can type the whole word anytime before attempts are over
  To quit the game type "exit"
  """);
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

// The logic geussing all the letter
void hangman(String word) {
  /*
  Takes the word and create a clue
  Ask the user to guess a letter
  Check if the letter is in the word
  If yes, put the letter in the same index of the clue
  */

  List clue = ("___ " * word.length).split(" ");

  // Initial state
  print(clue.join(" "));
  int count = 0;
  int n = 6;
  List<String> value = [];
  // Game
  while (true) {
    // User input
    count += 1;

    stdout.write("\nPlease guess a letter.\nYou have now $n attempt(s): ");
    n -= 1;
    String choice = stdin.readLineSync()!.toUpperCase();
    // (value.add(choice));
    print(value);
    /* 
    Allow user to type the whole word or exit the game
    Any other incorrect case, demand a single letter */
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      print("\nNope!");
      continue;
    }

    // Check the word for guessed letter
    for (var i = 0; i < word.length; i++) {
      if ((clue[i] == choice) && value.contains(choice)) {
        print("\nYou already tape $choice, choose something else!");
        n += 1;
        continue;
      } else if (word[i] == choice) {
        clue[i] = choice;
        value.add(choice);
      }
    }

    print("\n Attempts left: $n");
    // Current state
    print(clue.join(" "));

    // End the game if there are no more guesses
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
    if (n == 0 && clue.join("") != word) {
      print("\nGame over! \nYou didn't found it!!\nThe right word was $word");
      break;
    }
  }
}

// Another way to solve the problem.
/*
import 'dart:io';
import 'dart:math';

void main() {
  // Pick a random word
  String theWord = randomWord("bin/swopods.txt");

  intro();
  hangman(theWord);
}

void hangman(String word) {
  /*
  Takes the word and create a clue
  Ask the user to guess a letter
  Check if the letter is in the word
  If yes, put the letter in the same index of the clue
  */

  List clue = ("___ " * word.length).split(" ");

  // Initial state
  print(clue.join(" "));
  int count = 0;
  int attempts = word.length + 1;
  List history = [];

  // Game
  while (true) {
    count += 1;
    attempts -= 1;

    // User input
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync()!.toUpperCase();
    if (history.contains(choice)) {
      print("\nYou already tried this letter!");
      attempts += 1;
    } else {
      history.add(choice);
    }

    /* 
    Allow user to type the whole word or exit the game
    Any other incorrect case, demand a single letter */
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      attempts += 1;
      print("\nNope! Attemps left: $attempts");
      continue;
    } else if (attempts < 1) {
      print("\nAttemps left: $attempts. \nGame over!");
      print("\nThe word was: $word");
      break;
    }

    // Check the word for guessed letter
    for (var i = 0; i < word.length; i++) {
      if (word[i] == choice) {
        clue[i] = choice;
      }
    }
    print("\nAttempts left: $attempts");

    // Current state
    print(clue.join(" "));

    // End the game if there are no more guesses
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
  }
}

String randomWord(String txt) {
  /*
  Reads the given file as a list
  Then picks a random word from it
  */
  final random = Random();
  var file = File(txt);
  List<String> wordList = file.readAsLinesSync();
  String word = wordList[random.nextInt(wordList.length)];
  return word;
}

void intro() {
  print("""\n
  Welcome to Hangman!
  We prepared a word for you.
  You have 6 attempts to guess it correctly
  You can type the whole word anytime before attempts are over
  To quit the game type "exit"
  """);
}
*/