// 9. Lista Simples: Crie uma lista de frutas e imprima cada uma delas usando
// um loop.

void main() {
  List<String> frutas = ["morango", "kiwi", "uva", "banana", "melancia"];

  for (int i = 0; i < frutas.length; i++) {
    print("> ${frutas[i]}");
  }
}