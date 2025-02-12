// 27. Extensão de Classes: Crie uma extensão para a classe String que adiciona
// um método toCamelCase().

import 'dart:io';

extension StringExtension on String {
  String toCamelCase() {
    int count = 0;
    return split(" ").map((palavra) {
      count++;
      return count == 1 
      ? palavra.toLowerCase() 
      : palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
    }).join("");
  }
}

void main() {
  stdout.write("--> Informe uma frase: ");
  String frase = stdin.readLineSync()!;

  print("> Frase: $frase");
  print("> Frase em CamelCase: ${frase.toCamelCase()}");
}