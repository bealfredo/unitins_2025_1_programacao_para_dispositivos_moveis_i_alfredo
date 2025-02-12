// 13. Função Recursiva: Calcule o fatorial de um número.

import "dart:io";

void main() {
  stdout.write("--> Insira um número: ");
  int num = int.parse(stdin.readLineSync()!);
  stdout.write("> Fatorial de $num: ${fatorial(num)}");
}

int fatorial(int x) {
  if (x == 1) {
    return x;
  } else {
    return fatorial(x - 1) * x;
  }
}