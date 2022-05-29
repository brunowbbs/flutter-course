import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _itens = [];

  void _carregarItens() {
    for (int i = 0; i < 10; i++) {
      Map<String, dynamic> item = {};
      item['titulo'] = "Título $i Lorem ipsum dolor";
      item['descricao'] = "Descrição $i ipsum dolor";

      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Listagem de dados"),
        ),
        body: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(_itens[indice]['titulo']),
                      titlePadding: const EdgeInsets.all(20),
                      titleTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      content: Text(_itens[indice]['descricao']),
                      contentPadding: const EdgeInsets.all(20),
                      backgroundColor: Colors.white,
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Editar"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Apagar"),
                        )
                      ],
                    );
                  },
                );
              },
              onLongPress: () {
                print("LONG PRESS");
              },
              title: Text(_itens[indice]['titulo']),
              subtitle: Text(_itens[indice]['descricao']),
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.av_timer),
            );
          },
        ));
  }
}
