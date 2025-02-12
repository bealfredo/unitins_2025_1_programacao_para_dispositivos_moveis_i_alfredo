// 12. Função com Valor Padrão: Faça uma função que receba um nome e exiba
// uma saudação. Se nenhum nome for passado, use "Visitante"

import "dart:io";

void main() {
  stdout.write("-> Insira seu nome: ");
  String name = stdin.readLineSync()!;
  sayHi(nome: name);
}

void sayHi({String nome = "Visitante"}) {
  print("> Hi, $nome! Bem vindo!");
}