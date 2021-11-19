/*
 * Implement a function that takes as input three variables, and returns the 
 * largest of the three. Do this without using the Dart max() function!
 *The goal of this exercise is to think about some internals that Dart normally 
 *takes care of for us. All you need is some variables and if statements!
 */

void main(List<String> arguments) {
  int max;
  int a = 32;
  int b = 12;
  int c = 64;

  if (a > b) {
    max = a;
  } else {
    max = b;
  }

  if (c > max) {
    max = c;
  }
  print(max);

  // Another method, which will work with any length
  List l = [a, b, c, 4, 5, 2, 1];
  l.sort();
  print(l.last);
}
