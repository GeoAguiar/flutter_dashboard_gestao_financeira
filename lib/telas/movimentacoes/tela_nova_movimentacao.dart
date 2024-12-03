import 'package:flutter/material.dart';

class TelaNovaMovimentacao extends StatefulWidget {
  const TelaNovaMovimentacao({super.key});

  @override
  State<TelaNovaMovimentacao> createState() => _TelaNovaMovimentacaoState();
}

class _TelaNovaMovimentacaoState extends State<TelaNovaMovimentacao> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  String? _tipoSelecionado;
  String? _categoriaSelecionada;
  String? _formaPagamentoSelecionada;
  String? _statusSelecionado;

  final List<String> _tipos = ['Receita', 'Despesa'];
  final List<String> _categorias = ['Alimentação', 'Transporte', 'Saúde', 'Educação', 'Outros'];
  final List<String> _formasPagamento = ['Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'PIX', 'Outros'];
  final List<String> _status = ['Pendente', 'Pago'];

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Nova Movimentação'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width:  600,
                height:   MediaQuery.of(context).size.height * 0.89,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Preencha os dados da movimentação:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Campo para Data
                          TextFormField(
                            controller: _dataController,
                            decoration: const InputDecoration(
                              labelText: 'Data',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? dataSelecionada = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (dataSelecionada != null) {
                                _dataController.text = dataSelecionada.toString().split(' ')[0];
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione uma data.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Tipo
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Tipo',
                              prefixIcon: Icon(Icons.swap_vert),
                            ),
                            value: _tipoSelecionado,
                            items: _tipos.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(tipo),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _tipoSelecionado = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione um tipo.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Categoria
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Categoria',
                              prefixIcon: Icon(Icons.category),
                            ),
                            value: _categoriaSelecionada,
                            items: _categorias.map((categoria) {
                              return DropdownMenuItem(
                                value: categoria,
                                child: Text(categoria),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _categoriaSelecionada = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione uma categoria.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Descrição
                          TextFormField(
                            controller: _descricaoController,
                            decoration: const InputDecoration(
                              labelText: 'Descrição',
                              prefixIcon: Icon(Icons.description),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira uma descrição.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Valor
                          TextFormField(
                            controller: _valorController,
                            decoration: const InputDecoration(
                              labelText: 'Valor',
                              prefixIcon: Icon(Icons.attach_money),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um valor.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Forma de Pagamento
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Forma de Pagamento',
                              prefixIcon: Icon(Icons.payment),
                            ),
                            value: _formaPagamentoSelecionada,
                            items: _formasPagamento.map((forma) {
                              return DropdownMenuItem(
                                value: forma,
                                child: Text(forma),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _formaPagamentoSelecionada = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione uma forma de pagamento.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Campo para Status
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: Icon(Icons.check_circle),
                            ),
                            value: _statusSelecionado,
                            items: _status.map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _statusSelecionado = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione um status.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          // Botão Salvar
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Lógica para salvar a nova movimentação
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Movimentação salva com sucesso!')),
                                  );
                                }
                              },
                              child: const Text('Salvar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
