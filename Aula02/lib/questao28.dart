// 28. Operadores Avançados: Use o operador ?? (null-aware) para tratar valores
// nulos em um mapa de configurações.

void main() {
  Map<String, dynamic> configuracoes = {
    "primaryColor": "Azul",
    "secondaryColor": "Vermelho",
    "textColor": "Preto",
    "fontSize": 16,
  };

  String tema = configuracoes["tema"] ?? "Escuro";

  print("> Tema: $tema");
  print("> Tamanho da fonte: ${configuracoes["fontSize"]}");
}