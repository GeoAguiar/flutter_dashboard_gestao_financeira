import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:painel_web_dashboard/telas/usuarios/controle_de_usuarios.dart';
import 'package:painel_web_dashboard/telas/usuarios/login.dart';

import '../telas/cartoes_e_contas/controle_de_cartoes.dart';
import '../telas/cartoes_e_contas/controle_de_contas.dart';
import '../telas/movimentacoes/controle_de_movimentacoes.dart';
import '../telas/tela_estatisticas.dart';
import '../telas/tela_inicial.dart';

class NavegacaoLateralDrawer extends StatelessWidget {
  final Color color;

  const NavegacaoLateralDrawer({super.key, required this.color});



  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor:  color,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              // Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaInicial()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Movimentações'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ControleDeMovimentacoes()),
              );
            },
          ),  /***
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text('Estatísticas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaEstatisticas()),
              );
            },
          ),
          ***/
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Cartões'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) =>  ControleDeCartoes()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Contas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) =>  AccountManagementScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) =>  ControleDeusuarios()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) =>  LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

}
