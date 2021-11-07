import 'dart:math';

void main(List<String> arguments) {
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(100));

  //Pass it to the function
  print("The generate List : $randList");
  print(newList(randList));
  // firstLAstNumber(randList);
}

// Third way to solve
List<int> newList(List<int> initialList) {
  return [initialList.first, initialList.last];
}

void firstLAstNumber(List<int> list) {
  List<int> b = []; // use in first way
  // Second way to solve
  print([
    for (var i = 0; i < list.length; i++)
      if (i == 0 || i == list.length - 1) list[i]
  ]);

  // Another way to solve ( First way to solve)
/*   for (var i = 0; i < a.length; i++) {
    if (i == 0 || i == a.length - 1) {
      b.add(a[i]);
    }
  }
  print(b); */
}
