import 'dart:io';

import 'package:aula1/aula1.dart' as aula1;

// void main(List<String> arguments) {
//   print('Hello world: ${aula1.calculate()}!');
// }

void main() {
  print('Hello World');

  int n1;
  int n2;

  print('Digite o primeiro número: ');
  n1 = int.parse(stdin.readLineSync()!);

  print('Digite o segundo número: ');
  n2 = int.parse(stdin.readLineSync()!);

  soma(n1, n2);
}

void soma(int n1, int n2) {
  print('= ${n1 + n2}');

  stdout.write('Digite o primeiro número: ');
  int n3 = int.parse(stdin.readLineSync()!);

  stdout.write('Digite o segundo número: ');
  int n4 = int.parse(stdin.readLineSync()!);
}