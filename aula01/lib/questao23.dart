// 23.Manipulação de Arquivos: Leia e escreva em um arquivo usando dart:io.

import 'dart:io';

void main() {
  stdout.write("-> Informe seu nome: ");
  String nome = stdin.readLineSync()!;

  try {
    File file = File("aula01/lib/questao23.txt");
    file.writeAsStringSync("Bem vindo, $nome!");
    print("Arquivo salvo com sucesso!");
  } catch (e) {
    print("Erro ao salvar o arquivo: $e");
  }

  try {
    File file = File("aula01/lib/questao23.txt");
    String conteudo = file.readAsStringSync();
    print("Conteúdo do arquivo (modicado em = ${file.lastModifiedSync()}): $conteudo");
  } catch (e) {
    print("Erro ao ler o arquivo: $e");
  }
}