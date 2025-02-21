

import 'dart:convert';
import "dart:io";
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

void main() async {

  // print("Consumindo api 1");
  // fetchPessoas();

  // print("Consumindo api 2");
  await fetchPessoas();

  await postPessoa("Fulano", "0000000000", 30);

  await getPessoaByCpf("0000000000");

  print("## Fim do programa");
}

Future<dynamic> fetchPessoas() async {
  var url = Uri.parse("https://247b-200-129-177-130.ngrok-free.app/Pessoas");

  print("\n\nFazendo requisição para: $url");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    // print(data);
    showPessoas(data);
  } else {
    print("Erro ao fazer a requisição: ${response.statusCode}");
  }
}

void showPessoas(List<dynamic> pessoas) {
  for (var pessoa in pessoas) {
    print("--------------------------");
    print("Nome: ${pessoa['nome']}");
    print("CPF: ${pessoa['cpf']}");
    print("Idade: ${pessoa['idade']}");
    print("--------------------------");
  }
}

void showPessoa(Map<String, dynamic> pessoa) {
  print("--------------------------");
  print("Nome: ${pessoa['nome']}");
  print("CPF: ${pessoa['cpf']}");
  print("Idade: ${pessoa['idade']}");
  print("--------------------------");
}

Future<void> getPessoaByCpf(String cpf) async {
  var url = Uri.parse("https://247b-200-129-177-130.ngrok-free.app/Pessoas/cpf/$cpf");

  print("\n\nBuscando pessoa (CPF = $cpf): $url");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    // print(data);
    showPessoa(data);
  } else {
    print("Erro ao fazer a requisição: ${response.statusCode}");
  }
}

Future<void> postPessoa(String nome, String cpf, int idade) async {
  var url = Uri.parse("https://247b-200-129-177-130.ngrok-free.app/Pessoas");

  var body = json.encode({
    "nome": nome,
    "cpf": cpf,
    "idade": idade
  });

  var headers = {
    "Content-Type": "application/json"
  };

  print("\n\nEnviando dados para: $url");
  await http.post(url, headers: headers, body: body).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  });
}