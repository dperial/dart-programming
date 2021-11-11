void main(List<String> args) {
  List<List<int>> gameList = [
    [1, 0, 1],
    [0, 1, 0],
    [1, 0, 1]
  ];

  checkWinner(gameList);
}

void checkWinner(List<List<int>> board) {
  if (rowWinner(board)) {
    print("Row win the game !");
  } else if (rowWinner(transpose(board))) {
    print("Colum win the game!");
  } else if (rowWinner(diagWinner(board))) {
    print("Diagonal win the game");
  } else {
    print("Draww!!!");
  }
}

/* 
  Accepts: list of lists of integers
  Does: checks if any row consists of the same values
  Returns: true if any, false otherwise 
  */
bool rowWinner(List<List<int>> board) {
  // Another way to implement this part
  /* for (List<int> in board) {
      if(row.toSet().length == 1) {
        return true;
      } 
    }
    return fasle; */

  for (var i = 0; i < board.length; i++) {
    if (board[i].toSet().length == 1) {
      // print(board[i]);
      return true;
    }
  }
  return false;
}

/* 
  Accepts: list of lists of integers
  Does: transposes it so each row becomes a column
  Returns: the transposed list of lists
  */
List<List<int>> transpose(List<List<int>> board) {
  return [
    for (var i = 0; i < board.length; i++) [for (List<int> r in board) r[i]]
  ];
}

/* 
  Accepts: list of list of integers
  Does: takes both diagonals and adds them to a new list
  Returns: new list of lists
  
  Left-to-right diagonal is fairly easy.
  To take the right-to-left diagonal, first we reverse the each row
  then take left-to-right diagonal one more time
  */
List<List<int>> diagWinner(List<List<int>> board) {
  print([
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ]);

  return [
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ];
}
