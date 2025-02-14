// 21. Futuro e Assincronismo: Simule uma requisição assíncrona usando
// Future.delayed().

// void main() {
//   Future.delayed(Duration(seconds: 2), () {
//     print("Informacoes salvas com sucesso!");
//   });

//   print("Salvando informacoes...");
// }





void main() async {
  Future minhaFuture = Future(
    () async {
      print("Executando uma Future...");
      // return Future.delayed(Duration(seconds: 10));
      await Future.delayed(Duration(seconds: 5));
      return 10;
    }
  ).then((value) => {
    print("Valor retornado minhaFuture: $value")
  });

  void sayHi() {
    print("Hi!");
  }

  int result = await busca();
  
  print ("Fim da execução! Resultado: $result");
}

Future<int> busca() async {
  await Future.delayed(Duration(seconds: 10));
  return 42;
}