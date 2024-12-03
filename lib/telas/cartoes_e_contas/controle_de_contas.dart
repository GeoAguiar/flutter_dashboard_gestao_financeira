import 'package:flutter/material.dart';
import 'package:painel_web_dashboard/estilos/estilos.dart';
import 'package:painel_web_dashboard/telas/usuarios/adicionar_conta.dart';

import 'editar_conta.dart';

class AccountManagementScreen extends StatefulWidget  {

  @override
_AccountManagementScreenState createState() =>
    _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {


  final List<Map<String, dynamic>> accounts = [
    {'name': 'Checking Account', 'balance': 1500.00},
    {'name': 'Savings Account', 'balance': 3000.00},

  ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Manage Accounts'),
      ),
      body: ListView.builder(
      itemCount: accounts.length,
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
                    Icon(Icons.account_balance_wallet, size: 60),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          accounts[index]['name'] ?? 'Conta Sem Nome',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Balance: \$${accounts[index]['balance'].toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditarConta(conta: accounts[index]),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deletarConta(context, index);
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
          Navigator.push(
            context,
            MaterialPageRoute(builder:
                (context) =>  AdicionarConta()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Função para mostrar opções da conta (excluir)
  void _deletarConta(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deseja Realmente Deletar esta Conta?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  accounts.removeAt(index);
                });
                Navigator.pop(context); // Fechar o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Conta excluída com sucesso!')),
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



  // Função para visualizar os detalhes da conta
  void _viewAccountDetails(BuildContext context, int index) {
    // Exibir detalhes da conta
  }

}
