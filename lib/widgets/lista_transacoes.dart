import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  const ListaTransacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.arrow_upward, color: Colors.white),
          ),
          title: const Text("Transação"),
          subtitle: const Text("Descrição da transação"),
          trailing: const Text("R\$ 50,00"),
        );
      },
    );
  }
}
