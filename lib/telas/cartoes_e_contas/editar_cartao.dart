import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:painel_web_dashboard/estilos/estilos.dart';

class EditarCartao extends StatefulWidget {
  final Map<String, dynamic> cartao;

  const EditarCartao({Key? key, required this.cartao}) : super(key: key);

  @override
  _EditarCartaoState createState() => _EditarCartaoState();
}

class _EditarCartaoState extends State<EditarCartao> {
  late TextEditingController _cartaoNameController;
  late TextEditingController _cartaoNumberController;
  String _cartaoTipo = 'Débito';
  String _cartaoStatus = 'Ativo';
  DateTime? _openingDate;

  @override
  void initState() {
    super.initState();
    _cartaoNameController = TextEditingController(text: widget.cartao['bandeira']);
    _cartaoNumberController = TextEditingController(text: widget.cartao['numero']);
    _cartaoTipo = widget.cartao['tipo'] ?? 'Débito';
    _cartaoStatus = widget.cartao['status'] ?? 'Ativo';
    _openingDate = widget.cartao['openingDate'] != null
        ? DateTime.parse(widget.cartao['openingDate'])
        : DateTime.now();
  }

  void _editCartao(BuildContext context) {
    String cartaoName = _cartaoNameController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cartao editado: $cartaoName')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Editar Cartao'),
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
                    controller: _cartaoNameController,
                    decoration: InputDecoration(
                      labelText: 'Nome da Cartao',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _cartaoNumberController,
                    decoration: InputDecoration(
                      labelText: 'Número da Cartao',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _cartaoTipo,
                    decoration: InputDecoration(
                      labelText: 'Tipo de Cartao',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _cartaoTipo = newValue!;
                      });
                    },
                    items: ['Débito', 'Crédito']
                        .map((tipo) => DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _cartaoStatus,
                    decoration: InputDecoration(
                      labelText: 'Status da Cartao',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _cartaoStatus = newValue!;
                      });
                    },
                    items: ['Ativo', 'Inativo', 'Suspenso']
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
                            ? 'Escolher Data de Vencimento'
                            : 'Data de Vencimento: ${DateFormat('dd/MM/yyyy').format(_openingDate!)}'),
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
                      _editCartao(context);
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
