import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
