import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  final String resultado;

  const ResultadoPage({Key? key, required this.resultado}) : super(key: key);

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.resultado == "cara"
              ? Image.asset("assets/images/moeda_cara.png")
              : Image.asset("assets/images/moeda_coroa.png"),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/images/botao_voltar.png"),
          )
        ],
      ),
    );
  }
}
