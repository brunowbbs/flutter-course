import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _value = "";

  _getRequest() async {
    final Uri uri = Uri.parse("https://blockchain.info/ticker");

    final response = await http.get(uri);

    final Map<String, dynamic> responseJSON = json.decode(response.body);

    setState(() {
      _value = responseJSON["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitcoin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bitcoin.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "R\$ $_value",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _getRequest,
              child: const Text("Atualizar"),
            )
          ],
        ),
      ),
    );
  }
}
