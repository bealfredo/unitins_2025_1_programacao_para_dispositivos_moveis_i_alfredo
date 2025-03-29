import 'package:avaliacao01_resenhal/navigation_teste.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp( ListaComprasApp());

  runApp(NavigationBarApp());
}

class ListaComprasApp extends StatelessWidget {
  const ListaComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: FormularioComprasScaffold(),
  );
  }
}

class FormularioComprasScaffold extends StatelessWidget {
  const FormularioComprasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Produto'),
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
                labelText: 'Nome',
                hintText: 'Ex: Arroz',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                labelText: 'Quantidade',
                hintText: 'Ex: 5',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                labelText: 'Medida',
                hintText: 'Ex: 500kg',
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

class ListaComprasScaffold extends StatelessWidget {
  const ListaComprasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        backgroundColor: Colors.redAccent,        
        
      ),
      body: ListaCompras(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.redAccent[100],
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemListaCompras(Produto('Arroz', '5kg', 1)),
        ItemListaCompras(Produto('Feijão', '1kg', 2)),
        ItemListaCompras(Produto('Macarrão', '500g', 3)),
      ],
    );
  }
}

class ItemListaCompras extends StatelessWidget {
  final Produto produto;

  const ItemListaCompras(this.produto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Text('${produto.medida} | ${produto.quantidade.toString()}'),
        leading: Icon(Icons.shopping_cart),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){},
        ),
      ),
    );
  }
}

class Produto {
  String nome;
  int quantidade;
  String medida;

  Produto(this.nome, this.medida, this.quantidade);
}

