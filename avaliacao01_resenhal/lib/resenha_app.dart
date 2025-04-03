import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ResenhaApp extends StatelessWidget {
  const ResenhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: ListaResenhasScaffold(),
  );
  }
}

class ListaResenhasScaffold extends StatelessWidget {
  const ListaResenhasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resenhas de Filmes'),
        backgroundColor: Colors.redAccent,        
        
      ),
      body: ListaResenhas(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.redAccent[100],
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> getResenhas() async {
  var url = Uri.parse('https://67e6f0a56530dbd31111f8e2.mockapi.io/resenhal/resenha');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<Resenha> resenhas = (data as List).map((item) => Resenha.fromJson(item)).toList();
    return resenhas;
  } else {
    print("Erro ao fazer a requisição: ${response.statusCode}");
  }
}

class ListaResenhas extends StatelessWidget {
  const ListaResenhas({super.key});

  // getting data from API
  Future<List<Resenha>> fetchResenhas() async {
  try {
    return await getResenhas();
  } catch (e) {
    print("Erro ao buscar resenhas: $e");
    return [];
  }
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Resenha>>(
      future: fetchResenhas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar resenhas'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Nenhuma resenha encontrada'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemListaResenhas(snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

class ItemListaResenhas extends StatelessWidget {
  final Resenha resenha;

  const ItemListaResenhas(this.resenha, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(resenha.titulo), // Exibe o título do filme
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nota: ${resenha.nota.toStringAsFixed(1)}'), // Exibe a nota
            Text('Comentário: ${resenha.comentario}'), // Exibe o comentário
          ],
        ),
        leading: Icon(Icons.movie), // Ícone representando um filme
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Aqui você pode implementar a lógica para deletar a resenha
          },
        ),
      ),
    );
  }
}

class Resenha {
  String id;
  DateTime createdAt;
  String titulo;
  // DateTime anoLancamento;
  List<String> genero;
  String diretor;
  String sinopse;
  String usuario;
  double nota;
  String comentario;

  Resenha(
    this.id,
    this.titulo,
    this.createdAt,
    // this.anoLancamento,
    this.genero,
    this.diretor,
    this.sinopse,
    this.usuario,
    this.nota,
    this.comentario,
  );

  factory Resenha.fromJson(Map<String, dynamic> json) {
    return Resenha(
      json['id'],
      json['titulo'],
      DateTime.parse(json['createdAt']),
      List<String>.from(json['genero']),
      json['diretor'],
      json['sinopse'],
      json['usuario'],
      json['nota'].toDouble(),
      json['comentario'],
    );
  }
}

// {
//   "id": 1,
//   "titulo": "Interestelar",
//   "ano_lancamento": 2014,
//   "genero": ["Ficção Científica", "Drama", "Aventura"],
//   "diretor": "Christopher Nolan",
//   "sinopse": "Um grupo de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.",
//   "usuario": "joao123",
//   "nota": 9.5,
//   "comentario": "Filme incrível, com uma trilha sonora maravilhosa!",
//   "createdAt": "2024-03-28T14:30:00Z"
// }

// Lista de gêneros
final List<String> generos = [
  'Ação',
  'Anime',
  'Asiáticos',
  'Brasileiros',
  'Britânicos',
  'Ciência e natureza',
  'Comédia',
  'Drama',
  'Esportes',
  'EUA',
  'Ficção científica e fantasia',
  'Mistério',
  'Mulheres em ação',
  'Novelas',
  'Para as crianças',
  'Policiais',
  'Reality e talk shows',
  'Romance',
  'Séries documentais',
  'Teen',
  'Terror',
  'Outro'
];

// Formulário addicionar resenha

class FormularioAddResenhaScaffold extends StatelessWidget {
  const FormularioAddResenhaScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Resenha'),
        backgroundColor: Colors.redAccent,        
        
      ),
      body: Column(
        children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Título',
                    hintText: 'Ex: Interestelar',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Diretor',
                    hintText: 'Ex: Christopher Nolan',
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Gênero',
                      hintText: 'Selecione',
                    ),
                    items: generos.map((String value) {
                      return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Lógica ao mudar o gênero
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Sinopse',
                    hintText: 'Informe a sinopse do filme',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Usuário',
                    hintText: 'Informe seu nome de usuário',
                    ),
                  ),
                  SizedBox(height: 10),
                    TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Nota',
                      hintText: 'Informe a nota do filme (máximo 10)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Informe a nota';
                      }
                      final nota = double.tryParse(value);
                      if (nota == null) {
                      return 'Valor inválido';
                      }
                      if (nota > 10) {
                      return 'A nota deve ser no máximo 10';
                      }
                      return null;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Comentário',
                    hintText: 'Informe sua opinião sobre o filme',
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      );
                      // Adicione a lógica para atualizar o estado com a data selecionada
                    },
                    child: AbsorbPointer(
                      child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Data de Lançamento',
                        hintText: 'Selecione a data',
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ElevatedButton(
            onPressed: (){},
            child: Text('Salvar'),
          )
        ],
      ),
    );
  }
}