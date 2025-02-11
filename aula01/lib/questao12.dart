import "dart:io";

void main() {
  stdout.write("-> Insira seu nome: ");
  String name = stdin.readLineSync()!;
  sayHi(nome: name);
}

void sayHi({String nome = "Visitante"}) {
  print("> Hi, $nome! Bem vindo!");
}