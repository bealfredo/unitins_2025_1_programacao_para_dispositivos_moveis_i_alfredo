// 25. Programação Funcional: Use map, reduce e where para transformar uma
// lista de números

void main() {
  List<int> numeros = [9, 10, 1, 2, 4, 11, 20];
  print("> Numeros: $numeros");

  List<int> numerosAoQuadrado = numeros.map((numero) => numero * numero).toList();
  print("> Numeros ao quadrado: $numerosAoQuadrado");

  List<int> numerosAoQuadradoPares = numerosAoQuadrado.where((numero) => numero %2 == 0).toList();
  print("> Numeros ao quadrado pares: $numerosAoQuadradoPares");

  int somaNumeroAoQuadradoPares = numerosAoQuadradoPares.reduce((total, numero) => total + numero);
  print("> Soma dos numeros ao quadrado pares: $somaNumeroAoQuadradoPares");
}