import 'package:flutter/material.dart';

class BarraNavegacaoInferior extends StatelessWidget {
  const BarraNavegacaoInferior({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Estatísticas"),
      ],
    );
  }
}
