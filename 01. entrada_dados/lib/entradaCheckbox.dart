import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool _isCheckedBr = true;
  String _escolhaUsuarioRd = "";
  bool _escolhaUsuarioSw = false;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          const Text("Comida brasileira"),
          Checkbox(
            value: _isCheckedBr,
            onChanged: (bool? valor) {
              setState(() {
                _isCheckedBr = !_isCheckedBr;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Comidas brasileiras"),
            subtitle: const Text("A melhor comida do mundo"),
            activeColor: Colors.red,
            //selected: _isChecked,
            secondary: const Icon(Icons.add_box),
            value: _isCheckedBr,
            onChanged: (bool? valor) {
              setState(() {
                _isCheckedBr = !_isCheckedBr;
              });
            },
          ),
          Row(
            children: [
              const Text("Masculino"),
              Radio(
                value: "m",
                groupValue: _escolhaUsuarioRd,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuarioRd = escolha.toString();
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text("Feminino"),
              Radio(
                value: "f",
                groupValue: _escolhaUsuarioRd,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuarioRd = escolha.toString();
                  });
                },
              ),
            ],
          ),
          RadioListTile(
            title: const Text("Masculino"),
            value: "m",
            groupValue: _escolhaUsuarioRd,
            onChanged: (String? escolha) {
              setState(() {
                _escolhaUsuarioRd = escolha.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text("Feminino"),
            value: "f",
            groupValue: _escolhaUsuarioRd,
            onChanged: (String? escolha) {
              setState(() {
                _escolhaUsuarioRd = escolha.toString();
              });
            },
          ),
          Row(
            children: [
              Switch(
                value: _escolhaUsuarioSw,
                onChanged: (bool escolha) {
                  setState(() {
                    _escolhaUsuarioSw = escolha;
                  });
                },
              ),
              const Text("Receber notificaçoes?")
            ],
          ),
          SwitchListTile(
            title: const Text("Receber notificações?"),
            subtitle: const Text("Você receberar no email cadastrado"),
            value: _escolhaUsuarioSw,
            onChanged: (bool escolha) {
              setState(() {
                _escolhaUsuarioSw = escolha;
              });
            },
          ),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 10,
            label: _sliderValue.toString(),
            divisions: 10,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}
