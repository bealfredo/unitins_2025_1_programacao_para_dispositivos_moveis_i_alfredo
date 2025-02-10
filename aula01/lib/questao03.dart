// 3. Operações Matemáticas: Peça dois números ao usuário e exiba a soma,
// subtração, multiplicação e divisão.

import 'dart:io';

void main() {
  stdout.write("-> Digite o primeiro número: ");
  double number1 = double.parse(stdin.readLineSync()!);

  stdout.write("-> Digite o segundo número: ");
  double number2 = double.parse(stdin.readLineSync()!);

  print("> Soma: ${number1 + number2}");
  print("> Subtração: ${number1 - number2}");
  print("> Multiplicação: ${number1 * number2}");
  print("> Divisão: ${number1 / number2}");
}