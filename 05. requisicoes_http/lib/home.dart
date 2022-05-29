import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  String _resultado = "";

  _recuperarCep() async {
    final String cep = _controller.text;
    final Uri url = Uri.parse("http://viacep.com.br/ws/$cep/json/");

    try {
      //response vem em formato de string
      var response = await http.get(url);

      //converterndo string para objeto via Map
      Map<String, dynamic> retorno = json.decode(response.body);

      //Acessando atributos do map
      String logradouro = retorno["logradouro"];
      String complemento = retorno["complemento"] ?? " - ";
      String bairro = retorno["bairro"];
      String localidade = retorno["localidade"];

      setState(() {
        _resultado =
            "Rua: $logradouro, Complemento: $complemento, Bairro: $bairro, Cidade: $localidade";
      });
    } catch (e) {
      setState(() {
        _resultado = "Erro ao buscar dados";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requisições HTTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Digite um CEP"),
            ),
            ElevatedButton(
              onPressed: _recuperarCep,
              child: const Text("Buscar"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
