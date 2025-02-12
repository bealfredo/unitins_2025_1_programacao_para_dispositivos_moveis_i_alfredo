// 14.Manipulação de Listas: Ordene uma lista de números.

import 'dart:io';

void main() {
  stdout.write("-> Informe a quantidade de numeros: ");
  int qtItems = int.parse(stdin.readLineSync()!);
  List<double> nums = List.generate(qtItems, (int x) => 0);
  for (int i = 0; i < qtItems; i++) {
    stdout.write("-> ");
    nums[i] = double.parse(stdin.readLineSync()!);
  }

  ordena(nums);
  print("Lista ordenada: $nums");
}

void ordena(List<double> nums) {
  int qt = nums.length;
  double aux;

  for (int i = 0; i < qt; i++) {
    for (int j = 0; j < qt; j++) {
      if (nums[j] > nums[i]) {
        aux = nums[i];
        nums[i] = nums[j];
        nums[j] = aux;
      }
    }
  }
}
