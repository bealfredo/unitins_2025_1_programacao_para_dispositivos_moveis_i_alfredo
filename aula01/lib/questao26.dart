// 26. Generics: Crie uma classe genérica Caixa<T> que armazena um valor de
// qualquer tipo.

import 'dart:io';

class Caixa<T> {
  T valor;

  Caixa(this.valor);
}

void main() {
  Caixa<String> caixinha1nome;
  Caixa<int> caixinha2idade;

  stdout.write("--> Informe seu nome: ");
  caixinha1nome = Caixa(stdin.readLineSync()!);

  stdout.write("--> Informe sua idade: ");
  caixinha2idade = Caixa(int.parse(stdin.readLineSync()!));

  print("> Nome: ${caixinha1nome.valor} | Idade: ${caixinha2idade.valor}");
}