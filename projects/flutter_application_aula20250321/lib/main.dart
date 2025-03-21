import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListaComprasApp(),
  ));
}

class ListaComprasApp extends StatefulWidget {
  @override
  _ListaComprasAppState createState() => _ListaComprasAppState();
}

class _ListaComprasAppState extends State<ListaComprasApp> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  List<Produto> produtos = [
    Produto('Arroz', 10),
    Produto('Feijão', 5),
    Produto('Cenoura', 3.75, icon: Icons.fastfood),
  ];

  void _adicionarItem() {
    if (_itemController.text.isNotEmpty && _valorController.text.isNotEmpty) {
      try {
        double valor = double.parse(_valorController.text);
        setState(() {
          produtos.add(Produto(_itemController.text, valor));
          _itemController.clear();
          _valorController.clear();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Valor inválido!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _itemController,
                    decoration: InputDecoration(
                      labelText: 'Insira o item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _adicionarItem,
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ItemLista(produtos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _itemController.dispose();
    _valorController.dispose();
    super.dispose();
  }
}

class ItemLista extends StatelessWidget {
  final Produto produto;
  
  const ItemLista(this.produto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(produto.icon),
        title: Text(produto.nome),
        subtitle: Text('R\$ ${produto.valor.toStringAsFixed(2)}'),
      ),
    );
  }
}

class Produto {
  final String nome;
  final double valor;
  IconData icon;

  Produto(this.nome, this.valor, {this.icon = Icons.shopping_cart});
}