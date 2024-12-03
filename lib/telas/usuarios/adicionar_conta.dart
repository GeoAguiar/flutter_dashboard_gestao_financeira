import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../estilos/estilos.dart';


class AdicionarConta extends StatefulWidget {
  @override
  _AdicionarContaState createState() => _AdicionarContaState();
}

class _AdicionarContaState extends State<AdicionarConta> {
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();
  final TextEditingController _agencyController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String _accountType = 'Corrente';
  String _accountStatus = 'Ativa';
  DateTime? _openingDate;

  // Função para adicionar uma nova conta
  void _addNewAccount(BuildContext context) {
    String accountName = _accountNameController.text;
    String accountNumber = _accountNumberController.text;
    double balance = double.tryParse(_balanceController.text) ?? 0.0;
    String bank = _bankController.text;
    String category = _categoryController.text;
    String accountType = _accountType;
    String accountStatus = _accountStatus;
    DateTime openingDate = _openingDate ?? DateTime.now();

    // Simular o cadastro da conta (você pode salvar esses dados em um banco de dados ou lista)
    // Aqui você pode realizar as ações necessárias, como salvar as informações em um banco de dados.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nova conta adicionada: $accountName')),
    );

    // Limpar campos após adicionar a conta
    _accountNameController.clear();
    _accountNumberController.clear();
    _balanceController.clear();
    _bankController.clear();
    _categoryController.clear();
    setState(() {
      _accountType = 'Corrente';
      _accountStatus = 'Ativa';
      _openingDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Cadastrar Nova Conta'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6, // 60% da largura da tela
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(height: 15,),
                  TextField(
                    controller: _accountNameController,
                    decoration: InputDecoration(labelText: 'Nome da Conta',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _accountNumberController,
                    decoration: InputDecoration(labelText: 'Número da Conta',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _balanceController,
                    decoration: InputDecoration(labelText: 'Saldo Inicial',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _bankController,
                    decoration: InputDecoration(labelText: 'Banco',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(labelText: 'Categoria da Conta',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _accountType,
                    decoration: InputDecoration(labelText: 'Tipo de Conta',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (newValue) {
                      setState(() {
                        _accountType = newValue!;
                      });
                    },
                    items: ['Corrente', 'Poupança', 'Investimentos']
                        .map((type) => DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _accountStatus,
                    decoration: InputDecoration(labelText: 'Status da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                    onChanged: (newValue) {
                      setState(() {
                        _accountStatus = newValue!;
                      });
                    },
                    items: ['Ativa', 'Inativa', 'Suspensa']
                        .map((status) => DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                  ),

                  SizedBox(height: 16),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white,  // Text color
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _openingDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != _openingDate) {
                        setState(() {
                          _openingDate = pickedDate;
                        });
                      }
                    },
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 25,),
                        Text(_openingDate == null
                            ? 'Escolher Data de Abertura'
                            : 'Data de Abertura: ${DateFormat('dd/MM/yyyy').format(_openingDate!)}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                      foregroundColor: Colors.white, // Text color
                    ),
                    onPressed: () {
                      _addNewAccount(context);
                    },
                    child: Text('Cadastrar Conta'),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
