// 10.Mapa (Dicionário): Crie um mapa com nomes e idades e exiba os valores.

void main() {
  Map<String, int> bruxos = {
    "Harry Potter": 17,
    "Hermione Granger": 17,
    "Ron Weasley": 17,
    "Albus Dumbledore": 115,
    "Voldemort": 71,
  };

  print("[nome: idade]");

  bruxos.forEach((nome, idade) {
    print("> $nome: $idade");
  });
}
