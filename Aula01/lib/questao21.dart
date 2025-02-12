// 21. Futuro e Assincronismo: Simule uma requisição assíncrona usando
// Future.delayed().

void main() {
  Future.delayed(Duration(seconds: 2), () {
    print("Informacoes salvas com sucesso!");
  });

  print("Salvando informacoes...");
}
