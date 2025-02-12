// 15. Filtro em Listas: Filtre os números pares de uma lista usando .where().

import 'dart:io';

void main() {
  int qt;

  stdout.write("-> Informe a quantidade de numeros: ");
  qt = int.parse(stdin.readLineSync()!);
  List<double> nums = List.generate(qt, (x) => 0);

  for(int i = 0; i < nums.length; i++) {
    stdout.write("-> ");
    nums[i] = double.parse(stdin.readLineSync()!);
  }

  List<double> numsPares = nums.where((n) => n % 2 == 0).toList();

  print("> Lista completa: $nums");
  print("> Lista com pares: $numsPares");
}