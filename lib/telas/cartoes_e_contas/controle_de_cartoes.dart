import 'package:flutter/material.dart';

import '../../estilos/estilos.dart';
import 'editar_cartao.dart';

class ControleDeCartoes extends StatefulWidget  {

  @override
  _ControleDeCartoesState createState() =>
      _ControleDeCartoesState();
}

class _ControleDeCartoesState extends State<ControleDeCartoes> {



  final List<Map<String, String>> cards = [
    {'bandeira': 'Visa', 'numero': '**** 1234'},
    {'bandeira': 'MasterCard', 'numero': '**** 5678'},
    {'bandeira': 'amex', 'numero': '**** 5847'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Controle De Cartoes'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {


          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5, // 50% da largura da tela
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20), // Espaçamento entre os cards
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.credit_card, size: 60),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( cards[index]['bandeira'] ?? 'Bandeira sem Nome',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(cards[index]['numero']!, style: TextStyle(fontSize: 16),)

                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditarCartao(cartao: cards[index]),
                            ),
                          );

                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deletarCartao(context, index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add card functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }

// Função para remover um usuário
  void _removeCartao(int index) {
    setState(() {
      cards.removeAt(index);
    });
  }

  // Função para mostrar opções da usuário (excluir)
  void _deletarCartao(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deseja Realmente Deletar este Cartao?'),
          actions: [
            TextButton(
              onPressed: () {
                _removeCartao(index);


                Navigator.pop(context); // Fechar o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cartao excluído com sucesso!')),
                );
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }

  }
