import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

const primaryColor = Color.fromARGB(255, 102, 255, 82);
const primaryColorLight = Color.fromARGB(255, 102, 255, 82);
const secondaryColor = Color.fromARGB(255, 255, 82, 82);

class ResenhaApp extends StatelessWidget {
  const ResenhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: ListaResenhasScaffold(),
  );
  }
}



class ListaMidiasScaffold extends StatelessWidget {
  const ListaMidiasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mídias'),
        backgroundColor: primaryColor,      
        
      ),
      body: ListaMedias(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormularioAddMidiaScaffold()),
          );
        },
        backgroundColor: primaryColorLight,
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> getMedias() async {
  var url = Uri.parse('https://67e6f0a56530dbd31111f8e2.mockapi.io/resenhal/media');

  var response = await Future.delayed(
    Duration(seconds: 1),
    () => http.Response(
      json.encode([
        {
          "id": "1",
          "titulo": "Interestelar",
          "createdAt": "2024-03-28T14:30:00Z",
          "genero": "Ficção Científica",
          "criador": "Christopher Nolan",
          "tipo": "Filme",
          "sinopse": "Um grupo de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.",
          "anoLancamento": "2014-01-01T00:00:00Z"
        },
        {
          "id": "2",
          "titulo": "A Origem",
          "createdAt": "2024-03-29T14:30:00Z",
          "genero": "Ficção Científica",
          "criador": "Christopher Nolan",
          "tipo": "Filme",
          "sinopse": "Um ladrão que rouba segredos corporativos através do uso de tecnologia de compartilhamento de sonhos é oferecido a chance de apagar seu passado como pagamento por uma tarefa considerada impossível.",
          "anoLancamento": "2010-01-01T00:00:00Z"
        }
      ]),
      200,
    ),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<Media> medias = (data as List).map((item) => Media.fromJson(item)).toList();
    return medias;
  } else {
    print("Erro ao fazer a requisição: ${response.statusCode}");
  }
}

Future<http.Response> postMedia(Map<String, dynamic> media) async {
  var url = Uri.parse('https://67e6f0a56530dbd31111f8e2.mockapi.io/resenhal/media');
  var response = await http.post(
    url,
    body: json.encode(media),
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

class ListaMedias extends StatelessWidget {
  const ListaMedias({super.key});

  Future<List<Media>> fetchMedias() async {
    try {
      return await getMedias();
    } catch (e) {
      print("Erro ao buscar mídias: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Media>>(
      future: fetchMedias(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar mídias'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Nenhuma mídia encontrada'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemListaMedia(snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

class ItemListaMedia extends StatelessWidget {
  final Media media;

  const ItemListaMedia(this.media, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(media.titulo),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Criador: ${media.criador}'),
            Text('Tipo: ${media.tipo}'),
            Text('Gênero: ${media.genero}'),
            Text('Ano de Lançamento: ${media.anoLancamento.year}'),
          ],
        ),
        leading: Icon(Icons.movie),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}

class Media {
  String id;
  DateTime createdAt;
  String titulo;
  String criador; // (diretor, autor, etc.)
  String tipo; // (Filme, Série, Anime, etc.)
  String genero;
  String sinopse;
  DateTime anoLancamento;

  Media({
    required this.id,
    required this.createdAt,
    required this.titulo,
    required this.criador,
    required this.tipo,
    required this.genero,
    required this.sinopse,
    required this.anoLancamento,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      titulo: json['titulo'],
      criador: json['criador'],
      tipo: json['tipo'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      anoLancamento: DateTime.parse(json['anoLancamento']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'titulo': titulo,
      'criador': criador,
      'tipo': tipo,
      'genero': genero,
      'sinopse': sinopse,
      'anoLancamento': anoLancamento.toIso8601String(),
    };
  }
}

// Lista de gêneros
final List<String> sugestGeneros = [
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

// Formulário adicionar mídia
class FormularioAddMidiaScaffold extends StatefulWidget {
  const FormularioAddMidiaScaffold({super.key});

  @override
  _FormularioAddMidiaScaffoldState createState() => _FormularioAddMidiaScaffoldState();
}

class _FormularioAddMidiaScaffoldState extends State<FormularioAddMidiaScaffold> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para os campos de texto
  final _tituloController = TextEditingController();
  final _criadorController = TextEditingController();
  final _tipoController = TextEditingController();
  final _generoController = TextEditingController();
  final _sinopseController = TextEditingController();
  final _dataLancamentoController = TextEditingController();
  
  DateTime? _dataLancamento;
  bool _isLoading = false;

  @override
  void dispose() {
    // Liberar recursos dos controladores
    _tituloController.dispose();
    _criadorController.dispose();
    _tipoController.dispose();
    _generoController.dispose();
    _sinopseController.dispose();
    _dataLancamentoController.dispose();
    super.dispose();
  }

  Future<void> _salvarMidia() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final midia = {
          'titulo': _tituloController.text,
          'criador': _criadorController.text,
          'tipo': _tipoController.text,
          'genero': _generoController.text,
          'sinopse': _sinopseController.text,
          'anoLancamento': _dataLancamento!.toIso8601String(),
          'createdAt': DateTime.now().toIso8601String(),
        };

        var response = await postMedia(midia);

        if (response.statusCode == 201) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mídia adicionada com sucesso!')),
            );
            Navigator.pop(context);
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro ao salvar mídia: ${response.statusCode}')),
            );

            setState(() {
            _isLoading = false;
          });
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao salvar mídia: $e')),
          );

          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Mídia'),
        backgroundColor: primaryColor,        
      ),
      body: _isLoading 
        ? Center(child: CircularProgressIndicator()) 
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _tituloController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ex: Interestelar',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o título';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _criadorController,
                      decoration: InputDecoration(
                        labelText: 'Criador',
                        hintText: 'Ex: Christopher Nolan',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o criador';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _tipoController,
                      decoration: InputDecoration(
                        labelText: 'Tipo',
                        hintText: 'Ex: Filme',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o tipo';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _generoController,
                      decoration: InputDecoration(
                        labelText: 'Gênero',
                        hintText: 'Ex: Ficção Científica',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o gênero';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _sinopseController,
                      decoration: InputDecoration(
                        labelText: 'Sinopse',
                        hintText: 'Informe a sinopse do filme',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a sinopse';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    GestureDetector(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: _dataLancamento ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        
                        if (selectedDate != null) {
                          setState(() {
                            _dataLancamento = selectedDate;
                            _dataLancamentoController.text = 
                                "${selectedDate.day.toString().padLeft(2, '0')}/"
                                "${selectedDate.month.toString().padLeft(2, '0')}/"
                                "${selectedDate.year}";
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _dataLancamentoController,
                          decoration: InputDecoration(
                            labelText: 'Data de Lançamento',
                            hintText: 'Selecione a data',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Selecione a data de lançamento';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    ElevatedButton(
                      onPressed: _salvarMidia,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'SALVAR',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormularioAddResenhaScaffold()),
          );
        },
        backgroundColor: Colors.redAccent[100],
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> getResenhas() async {
  var url = Uri.parse('https://67e6f0a56530dbd31111f8e2.mockapi.io/resenhal/resenha');

  // var response = await http.get(url);
  var response = await Future.delayed(
    Duration(seconds: 1),
    () => http.Response(
      json.encode([
        {
          "id": "1",
          "titulo": "Interestelar",
          "createdAt": "2024-03-28T14:30:00Z",
          "genero": ["Ficção Científica", "Drama", "Aventura"],
          "diretor": "Christopher Nolan",
          "sinopse": "Um grupo de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.",
          "usuario": "joao123",
          "nota": 9.5,
          "comentario": "Filme incrível, com uma trilha sonora maravilhosa!"
        },
        {
          "id": "2",
          "titulo": "A Origem",
          "createdAt": "2024-03-29T14:30:00Z",
          "genero": ["Ficção Científica", "Ação", "Mistério"],
          "diretor": "Christopher Nolan",
          "sinopse": "Um ladrão que rouba segredos corporativos através do uso de tecnologia de compartilhamento de sonhos é oferecido a chance de apagar seu passado como pagamento por uma tarefa considerada impossível.",
          "usuario": "maria456",
          "nota": 8.8,
          "comentario": "Uma trama complexa, mas fascinante!"
        }
      ]),
      200,
    ),
  );

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
        title: Text(resenha.titulo),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nota: ${resenha.nota.toStringAsFixed(1)}'),
            Text('Comentário: ${resenha.comentario}'),
          ],
        ),
        leading: Icon(Icons.movie),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            
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
                  // DropdownButtonFormField<String>(
                  //   decoration: InputDecoration(
                  //     labelText: 'Gênero',
                  //     hintText: 'Selecione',
                  //   ),
                  //   items: generos.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //     value: value,
                  //     child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (newValue) {
                  //     // Lógica ao mudar o gênero
                  //   },
                  // ),
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