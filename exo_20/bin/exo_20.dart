/*
 * In 3 previous exercises, we built up a few components needed to build a Tic Tac Toe game in Dart:
 *Draw the Tic Tac Toe game board
 *Checking whether a game board has a winner
 *Handle a player move from user input
 *The next step is to put all these three components together to make a two-player Tic Tac Toe game!

 *Your challenge in this exercise is to use the functions from those previous exercises all together 
 *in the same program to make a two-player game that you can play with a friend. There are a lot of 
 *choices you will have to make when completing this exercise, so you can go as far or as little as you want with it.

 *Here are a few things to keep in mind:
 
 *You should keep track of who won - if there is a winner, show a congratulatory message on the screen.
 *If there are no more moves left, don’t ask for the next player’s move!
 *:notes: Keep in mind, the current solution is not just a copy pase of 
 *functions from the previous exercises, but rather a rework of them.
 */
import 'dart:io';

void main(List<String> args) {
  List<List<String>> initialBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));
  // print out the rules and instructions
  startGame(initialBoard);

  // Alternative between user: 1 or 2
  int user1 = 1, user2 = 2, tmp;

  while (true) {
    // Establish the current user
    tmp = user1;
    user1 = user2;
    user2 = tmp;

    currentBoard(initialBoard);

    //Ask for coordinates
    stdout.write("Please User $user2, choose a coordinate : ");
    List userChoice = stdin.readLineSync()!.split(" ");
    if (userChoice.join(" ") == "exit") {
      print("\nGame quitted in the following state");
      break;
    }
    // Populate the board with the choice
    initialBoard = makeMove(initialBoard, user2, userChoice);

    //Check the game
    if (rowWinner(initialBoard)) {
      print("\nUser $user2: Row win!");
      break;
    } else if (rowWinner(transpose(initialBoard))) {
      print("\nUser $user2: Row win!");
      break;
    } else if (rowWinner(diagWinner(initialBoard))) {
      print("\nUser $user2: Row win!");
      break;
    } else if (drawGame(initialBoard) == 1) {
      print("\nThe game ended in DRAWWW!");
      break;
    }
  }

  // Current state of the game
  currentBoard(initialBoard);
}

void startGame(List<List<String>> board) {
  print("""\n
  Welcome to Tic Tac Toc!
  The game is for two users: User 1(X) and User 2 (O).
  To make a move, give the coordinates of the board separared by space.
  For instance, 0 0 is the top left corner, 1 1  is the middle cell 
  and 2 2 is the bottom right corner and so on.
  If you want to quit the game, type exit.
  """);
}

void currentBoard(List<List<String>> board) {
  /*
  Draws the current board
  Rows and borders are hard coded
  Feel free to reimplement them with for loops
  But for exercise purposes it suffices
  */
/*   String border = ' ---';
  String col = "|   ";
  for (var i = 0; i < board.length; i++) {
    print(border * board.length);
    for (List<String> row in board) {
      for (var j = row.length + 1; j > 0; j--) {
        if (i > j) {
          print("  ${board[j]}");
        }
      }
    }
    print(col * (board.length + 1));
  }
  print(border * board.length); */
  String row1 = "| ${board[0][0]} | ${board[0][1]} | ${board[0][2]} |";
  String row2 = "| ${board[1][0]} | ${board[1][1]} | ${board[1][2]} |";
  String row3 = "| ${board[2][0]} | ${board[2][1]} | ${board[2][2]} |";
  String border = "\n --- --- ---\n";

  print(border + row1 + border + row2 + border + row3 + border);
}

List<List<String>> makeMove(
    List<List<String>> board, int currentUser, List choice) {
  /*
  Takes an initial board and populates it 
  either with X or with O depending on
  the currentUser
  */
  late String move;
  currentUser == 1 ? move = 'X' : move = 'O';

  board[int.parse(choice[0])][int.parse(choice[1])] = move;

  return board;
}

/* 
  Accepts: list of lists of integers
  Does: checks if any row consists of the same values
  Returns: true if any, false otherwise 
  */
bool rowWinner(List<List<String>> board) {
  // Another way to implement this part
  /* for (List<int> in board) {
      if(row.toSet().length == 1) {
        return true;
      } 
    }
    return fasle; */

  for (List<String> row in board) {
    if (row.toSet().length == 1 && row.any((e) => e != ' ')) {
      return true;
    }
  }
  return false;
}

List<List<String>> transpose(List<List<String>> board) {
  /* 
  Accepts: list of lists of integers
  Does: transposes it so each row becomes a column
  Returns: the transposed list of lists
  */
  return [
    for (var i = 0; i < board.length; i++) [for (List<String> r in board) r[i]]
  ];
}

List<List<String>> diagWinner(List<List<String>> board) {
  /* 
  Accepts: list of list of integers
  Does: takes both diagonals and adds them to a new list
  Returns: new list of lists
  
  Left-to-right diagonal is fairly easy.
  To take the right-to-left diagonal, first we reverse the each row
  then take left-to-right diagonal one more time
  */
  return [
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ];
}

int drawGame(List<List<String>> board) {
  /*
  Counts the number of empty cells in the board
  If the count is 1 and game has not ended
  it means the game is a draw
  */
  int count = 0;
  for (var row in board) {
    for (var e in row) {
      if (e == " ") {
        count += 1;
      }
    }
  }
  return count;
}
