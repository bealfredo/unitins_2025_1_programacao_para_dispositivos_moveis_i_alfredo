// 24.Uso de Pacotes Externos: Instale o pacote http e faça uma requisição GET
// para uma API pública.

import 'dart:convert';
import "dart:io";
import 'package:http/http.dart' as http;

void main() async {
  stdout.write("-> Informe o CEP (Ex: 77022092): ");
  String cep = stdin.readLineSync()!;

  try {
    var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    Map<String, dynamic> data = jsonDecode(response.body);

    print("Response status: ${response.statusCode}");
    print("> Rua: ${data['logradouro']}");
    print("> Bairro: ${data['bairro']}");
    print("> Cidade: ${data['localidade']}");
    print("> Estado: ${data['uf']}");

    print("> Response body completo: ${response.body}");
  } catch (e) {
    print("Erro ao fazer a requisição: $e");
  }
}