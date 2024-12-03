import 'package:flutter/material.dart';
import 'package:painel_web_dashboard/telas/movimentacoes/tela_nova_movimentacao.dart';

class ControleDeMovimentacoes extends StatefulWidget {
  @override
  _ControleDeMovimentacoesState createState() => _ControleDeMovimentacoesState();
}

class _ControleDeMovimentacoesState extends State<ControleDeMovimentacoes> {
  List<Map<String, dynamic>> movimentacoes = [
    {
      'data': '2024-12-01',
      'tipo': 'Entrada',
      'categoria': 'Vendas',
      'descricao': 'Venda de produto X',
      'valor': 200.0,
      'formaPagamento': 'Cartão',
      'status': 'Concluída'
    },
    {
      'data': '2024-12-02',
      'tipo': 'Saída',
      'categoria': 'Despesas',
      'descricao': 'Compra de material Y',
      'valor': 50.0,
      'formaPagamento': 'Dinheiro',
      'status': 'Pendente'
    },
  ];

  // Lista de opções de categoria e forma de pagamento
  List<String> categorias = ['Vendas', 'Despesas', 'Outros'];
  List<String> formasPagamento = ['Cartão', 'Dinheiro', 'Transferência'];

  String _status = 'Concluída';
  String _tipo = 'Entrada';
  String _categoria = 'Vendas';
  String _formaPagamento = 'Cartão';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Movimentações'),
      ),
      body: ListView.builder(
        itemCount: movimentacoes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.monetization_on), // Ícone de movimentação
              title: Text('${movimentacoes[index]['descricao']}'),
              subtitle: Text('Valor: R\$${movimentacoes[index]['valor']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editarMovimentacao(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deletarMovimentacao(context, index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaNovaMovimentacao()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Função para editar uma movimentação
  void _editarMovimentacao(int index) {
    TextEditingController descricaoController = TextEditingController(text: movimentacoes[index]['descricao']);
    TextEditingController valorController = TextEditingController(text: movimentacoes[index]['valor'].toString());
    String currentStatus = movimentacoes[index]['status'];
    String currentTipo = movimentacoes[index]['tipo'];
    String currentCategoria = movimentacoes[index]['categoria'];
    String currentFormaPagamento = movimentacoes[index]['formaPagamento'];

    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar Movimentação'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo para Descrição
                  TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                  // Campo para Valor
                  TextField(
                    controller: valorController,
                    decoration: InputDecoration(labelText: 'Valor'),
                    keyboardType: TextInputType.number,
                  ),
                  // Dropdown de Tipo
                  DropdownButtonFormField<String>(
                    value: currentTipo,
                    decoration: InputDecoration(labelText: 'Tipo'),
                    onChanged: (newValue) {
                      setState(() {
                        currentTipo = newValue!;
                      });
                    },
                    items: ['Entrada', 'Saída'].map((tipo) {
                      return DropdownMenuItem<String>(
                        value: tipo,
                        child: Text(tipo),
                      );
                    }).toList(),
                  ),
                  // Dropdown de Categoria
                  DropdownButtonFormField<String>(
                    value: currentCategoria,
                    decoration: InputDecoration(labelText: 'Categoria'),
                    onChanged: (newValue) {
                      setState(() {
                        currentCategoria = newValue!;
                      });
                    },
                    items: categorias.map((categoria) {
                      return DropdownMenuItem<String>(
                        value: categoria,
                        child: Text(categoria),
                      );
                    }).toList(),
                  ),
                  // Dropdown de Forma de Pagamento
                  DropdownButtonFormField<String>(
                    value: currentFormaPagamento,
                    decoration: InputDecoration(labelText: 'Forma de Pagamento'),
                    onChanged: (newValue) {
                      setState(() {
                        currentFormaPagamento = newValue!;
                      });
                    },
                    items: formasPagamento.map((forma) {
                      return DropdownMenuItem<String>(
                        value: forma,
                        child: Text(forma),
                      );
                    }).toList(),
                  ),
                  // Dropdown de Status
                  DropdownButtonFormField<String>(
                    value: currentStatus,
                    decoration: InputDecoration(labelText: 'Status'),
                    onChanged: (newValue) {
                      setState(() {
                        currentStatus = newValue!;
                      });
                    },
                    items: ['Concluída', 'Pendente', 'Cancelada'].map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    movimentacoes[index] = {
                      'data': DateTime.now().toString(),
                      'tipo': currentTipo,
                      'categoria': currentCategoria,
                      'descricao': descricaoController.text,
                      'valor': double.parse(valorController.text),
                      'formaPagamento': currentFormaPagamento,
                      'status': currentStatus,
                    };
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Movimentação editada')));
                },
                child: Text('Salvar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
            ],
          );
        },
      );
    });
  }

  // Função para excluir uma movimentação
  void _deletarMovimentacao(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir Movimentação'),
          content: Text('Tem certeza que deseja excluir esta movimentação?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  movimentacoes.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Movimentação excluída')));
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }
}