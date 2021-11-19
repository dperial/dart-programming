/*
 * In a previous exercise we explored the idea of using a list of lists as a 
 * “data structure” to store information about a tic tac toe game. 
 * In a tic tac toe game, the “game server” needs to know where the 
 * Xs and Os are in the board, to know whether player 1 or player 2 (or whoever is X and O) won.

 * There has also been an exercise (17) about drawing the actual tic tac toe gameboard using text characters.

 * The next logical step is to deal with handling user input. When a player 
 * (say player 1, who is X) wants to place an X on the screen, 
 * they can’t just click on a terminal. So you are going to approximate 
 * this clicking simply by asking the user for a coordinate of where they want to place their piece.
 */
import 'dart:io';

void main() {
  // Empty board
  List<List<String>> initialBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));
  drawBoard(initialBoard, 2);
}

void drawBoard(List<List<String>> board, int currentUser) {
  /*
  Takes an initial board and populates it 
  either with X or with O depending on
  the currentUser
  */
  late String move;
  currentUser == 1 ? move = 'X' : move = 'O';

  stdout.write("Please choose a coordinate: ");
  List choice = stdin.readLineSync()!.split(" ");
  print(choice);
  board[int.parse(choice[0])][int.parse(choice[1])] = move;
  print(board);
}
