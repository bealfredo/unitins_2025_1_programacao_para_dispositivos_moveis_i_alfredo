// 6. Switch Case: Crie um programa que leia um dia da semana e exiba uma
// mensagem correspondente.

import 'dart:io';

void main() {
  print("-> Digite um dia da semana: ");
  print("(segunda, terca, quarta, quinta, sexta, sabado, domingo)");
  stdout.write("-> ");
  String day = stdin.readLineSync()!;

  switch (day) {
    case "segunda":
      print("Monday left me broken.");
      break;
    case "terca":
      print("Tuesday I was through with hoping.");
      break;
    case "quarta":
      print("Wednesday my empty arms were open.");
      break;
    case "quinta":
      print("Thursday waiting for love, waiting for love.");
      break;
    case "sexta":
      print("Thank the stars it's Friday.");
      break;
    case "sabado":
      print("I'm burning like a fire gone wild on Saturday.");
      break;
    case "domingo":
      print("Guess I won't be coming to church on Sunday");
      break;
    default:
      print("Dia da semana inválido. (But still waiting for love.)");
  }
}