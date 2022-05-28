import 'package:flutter/material.dart';

class EmpresaPage extends StatelessWidget {
  const EmpresaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresa"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/images/detalhe_empresa.png"),
                const Text(
                  "Sobre a empresa",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin posuere, dolor non ultricies dapibus, dui sapien faucibus quam, eget placerat sapien erat vel magna. Nulla facilisi. Vestibulum tempor lectus vestibulum vulputate dapibus. Suspendisse potenti. Donec condimentum euismod ligula, quis ornare mauris congue ut. Maecenas ultricies imperdiet placerat. Sed ornare volutpat est eget fermentum. Nam pulvinar nec nisl vitae imperdiet. Cras sagittis elementum bibendum. Ut convallis tortor ullamcorper odio eleifend, et tempus erat eleifend. Nullam quis erat in quam scelerisque finibus eu sit amet libero. Curabitur semper suscipit arcu, vitae malesuada purus sodales quis. Nulla feugiat aliquam lorem, ut vestibulum urna imperdiet nec. Nam faucibus aliquam consectetur. Nunc ullamcorper hendrerit purus at sollicitudin. Phasellus tristique mi a nisl bibendum elementum. Pellentesque egestas risus lorem, molestie tempus ante feugiat in. Curabitur faucibus ornare congue. Ut scelerisque, ante in cursus pretium, elit justo ultricies lectus, a sagittis ex mauris sed neque."),
          )
        ],
      ),
    );
  }
}
