// 5. Estruturas Condicionais: Verifique se um número é par ou ímpar.

import 'dart:io';

void main() {
  stdout.write("-> Digite um número: ");
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print("> O número $number é par.");
  } else {
    print("> O número $number é ímpar.");
  }
}