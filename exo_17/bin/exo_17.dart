import 'dart:io';

void main(List<String> args) {
  stdout.write("What size game board do you want to draw ! \n");
  int size = int.parse(stdin.readLineSync()!);

  print("Here is a $size by $size board: \n");
  // Draw value
  String rowEl = ' ---';
  String columEl = '|   ';

  for (var i = 0; i < size; i++) {
    print(rowEl * size);
    print(columEl * (size + 1));
  }
  print("${rowEl * size} \n");
}
