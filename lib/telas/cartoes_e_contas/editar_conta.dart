




import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:painel_web_dashboard/estilos/estilos.dart';

class EditarConta extends StatefulWidget {
  final Map<String, dynamic> conta;

  const EditarConta({Key? key, required this.conta}) : super(key: key);

  @override
  _EditarContaState createState() => _EditarContaState();
}

class _EditarContaState extends State<EditarConta> {
  late TextEditingController _accountNameController;
  late TextEditingController _accountNumberController;
  late TextEditingController _balanceController;
  late TextEditingController _bankController;
  late TextEditingController _categoryController;
  String _accountType = 'Corrente';
  String _accountStatus = 'Ativa';
  DateTime? _openingDate;

  @override
  void initState() {
    super.initState();
    _accountNameController = TextEditingController(text: widget.conta['name']);
    _accountNumberController = TextEditingController(text: widget.conta['number']);
    _balanceController = TextEditingController(text: widget.conta['balance'].toString());
    _bankController = TextEditingController(text: widget.conta['bank']);
    _categoryController = TextEditingController(text: widget.conta['category']);
    _accountType = widget.conta['type'] ?? 'Corrente';
    _accountStatus = widget.conta['status'] ?? 'Ativa';
    _openingDate = widget.conta['openingDate'] != null
        ? DateTime.parse(widget.conta['openingDate'])
        : DateTime.now();
  }

  void _editAccount(BuildContext context) {
    String accountName = _accountNameController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Conta editada: $accountName')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Editar Conta'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6, // 60% da largura da tela
          padding: EdgeInsets.all(10.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 15,),
                  TextField(
                    controller: _accountNameController,
                    decoration: InputDecoration(
                      labelText: 'Nome da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _accountNumberController,
                    decoration: InputDecoration(
                      labelText: 'Número da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _balanceController,
                    decoration: InputDecoration(
                      labelText: 'Saldo Inicial',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _bankController,
                    decoration: InputDecoration(
                      labelText: 'Banco',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      labelText: 'Categoria da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _accountType,
                    decoration: InputDecoration(
                      labelText: 'Tipo de Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
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
                    decoration: InputDecoration(
                      labelText: 'Status da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
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
                      _editAccount(context);
                    },
                    child: Text('Salvar Alterações'),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
