/*
 *ake a list, say for example this one:

  a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 4, 55, 89]
and write a program that prints out all the elements of the list that are less than 5. 
 */
void main(List<String> arguments) {
  List<int> list = [1, 1, 2, 3, 5, 8, 13, 21, 34, 4, 55, 89];
  List<int> resultList = [];
  for (var item in list) {
    if (item < 5) {
      resultList.add(item);
    }
  }
  print(resultList);

// Another way to solve this exercise. I love it guy :-P!!!
  print([
    for (var item in list)
      if (item < 5) item
  ]);
}
