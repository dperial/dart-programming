import 'dart:math';

void main(List<String> arguments) {
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(100));

  print("Initial list is $randList\n");
  print("Cleaned list is ${printList(randList)} \n");
}

List<int> printList(List<int> n) {
  return n.toSet().toList();
}
