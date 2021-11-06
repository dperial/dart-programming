/*Exercise 5 :
 *Take two lists, for example:
 *a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 105, 16, 25, 99, 72, 23]
 *b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 89, 105, 15]
 *and write a program that returns a list that contains only the elements that 
 *are common between them (without duplicates). Make sure your program works on 
 *two lists of different sizes.
 */
void main(List<String> arguments) {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 105, 16, 25, 99, 72, 23];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 89, 105, 15];

  List<int> resultList = [];
  Set<int> c = {};

  for (var itemA in a) {
    for (var itemB in b) {
      if (itemA == itemB && !resultList.contains(itemA)) {
        resultList.add(itemA);
        print(resultList);
      }
    }
  }
  // Another way to solve
  print(Set.from(a).intersection(Set.from(b)).toList());

  // Another way to do
  for (var itemA in a) {
    for (var itemB in b) {
      if (itemA == itemB) {
        c.add(itemA);
      }
    }
  }
  print(c.toList());
}
