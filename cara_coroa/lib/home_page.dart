import 'dart:math';

import 'package:cara_coroa/resultado_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              List<String> itens = ["cara", "coroa"];
              int number = Random().nextInt(itens.length);
              String resultado = itens[number];

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultadoPage(resultado: resultado),
                ),
              );
            },
            child: Image.asset("assets/images/botao_jogar.png"),
          )
        ],
      ),
    );
  }
}
