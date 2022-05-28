import 'package:atm_consultoria/cliente_page.dart';
import 'package:atm_consultoria/contato_page.dart';
import 'package:atm_consultoria/empresa_page.dart';
import 'package:atm_consultoria/servico_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleNavigation(String screen) {
      Widget screenNav;

      if (screen == "servico") {
        screenNav = const ServicoPage();
      } else if (screen == "contato") {
        screenNav = const ContatoPage();
      } else if (screen == "empresa") {
        screenNav = const EmpresaPage();
      } else {
        screenNav = const ClientPage();
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screenNav),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _handleNavigation("empresa"),
                  child: Image.asset("assets/images/menu_empresa.png"),
                ),
                GestureDetector(
                  onTap: () => _handleNavigation("servico"),
                  child: Image.asset("assets/images/menu_servico.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _handleNavigation("cliente"),
                  child: Image.asset("assets/images/menu_cliente.png"),
                ),
                GestureDetector(
                  onTap: () => _handleNavigation("contato"),
                  child: Image.asset("assets/images/menu_contato.png"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
