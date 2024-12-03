import 'package:flutter/material.dart';

class SecaoAtualizacao extends StatelessWidget {
  const SecaoAtualizacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(Icons.update, size: 24),
          const SizedBox(width: 10),
          const Text(
            "Última atualização: hoje às 14:30",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
