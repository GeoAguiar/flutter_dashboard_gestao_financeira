import 'package:flutter/material.dart';

import '../modelos/detalhes_cartao.dart';

class SecaoCartoes extends StatelessWidget {
  const SecaoCartoes({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de cartões com os detalhes
    final cartoes = [
      DetalhesCartao(
        numeroCartao: "1234 5678 9876 5432",
        saldo: 1500.50,
        tipoCartao: Cards.visa,
      ),
      DetalhesCartao(
        numeroCartao: "9876 5432 1234 5678",
        saldo: 3200.75,
        tipoCartao: Cards.mastercard,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemCount: cartoes.length, // Quantidade de cartões
            itemBuilder: (context, index) {
              final cartao = cartoes[index];
              return Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: cartao.tipoCartao.image, width: 100, height: 100), // Imagem do tipo de cartão
                    const SizedBox(height: 8),
                    Text(
                      cartao.numeroCartao,
                      style: TextStyle(color: Colors.blueGrey[400], fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Saldo: R\$ ${cartao.saldo.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.blueGrey[400]),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

