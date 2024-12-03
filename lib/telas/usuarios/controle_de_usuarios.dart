import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../estilos/estilos.dart';

class ControleDeusuarios extends StatefulWidget {
  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<ControleDeusuarios> {
  List<Map<String, dynamic>> users = [
    {'name': 'Alice', 'email': 'alice@example.com', 'role': 'Admin', 'status': 'Ativo', 'password': '1234', 'photo': null},
    {'name': 'Bob', 'email': 'bob@example.com', 'role': 'User', 'status': 'Inativo', 'password': 'abcd', 'photo': null},
  ];

  final _picker = ImagePicker();
  String _status = 'Ativo';
  String _role = 'Admin'; // Função predefinida para novos usuários

  // Lista de funções predefinidas
  List<String> roles = ['Admin', 'Gestor', 'Analista', 'Auxiliar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Estilos.corPadraoAzul,
      appBar: AppBar(
        title: Text('Gerenciamento de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: users.isEmpty || users[index]['photo'] == null
                    ? AssetImage('assets/imagens/default_profile.png') as ImageProvider<Object>
                    : FileImage(File(users[index]['photo']!)),
              ),
              title: Text(users[index]['name']!),
              subtitle: Text(users[index]['email']!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editUser(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deletarUsuario(context, index)
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        child: Icon(Icons.add),
      ),
    );
  }

  // Função para adicionar um novo usuário
  void _addUser() {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adicionar Usuário'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo para Foto
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          // Aqui estamos adicionando o caminho da imagem ao usuário
                          users.add({
                            'name': '',
                            'email': '',
                            'role': '',
                            'status': '',
                            'password': '',
                            'photo': pickedFile.path, // Caminho do arquivo
                          });
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: users.isEmpty || users[users.length - 1]['photo'] == null
                          ? AssetImage('assets/imagens/default_profile.png') as ImageProvider<Object>
                          : FileImage(File(users[users.length - 1]['photo']!)),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Campo para Nome
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  // Campo para E-mail
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  // Campo para Função (Dropdown com funções predefinidas)
                  DropdownButtonFormField<String>(
                    value: _role,  // Aqui é o valor selecionado
                    decoration: InputDecoration(labelText: 'Função'),
                    onChanged: (newValue) {
                      setState(() {
                        _role = newValue!;
                      });
                    },
                    items: roles.map((role) {
                      return DropdownMenuItem<String>(
                        value: role,  // Certifique-se de que o valor corresponde exatamente ao valor
                        child: Text(role),
                      );
                    }).toList(),
                  ),
                  // Campo para Status (Dropdown)
                  DropdownButtonFormField<String>(
                    value: _status,
                    decoration: InputDecoration(labelText: 'Status'),
                    onChanged: (newValue) {
                      setState(() {
                        _status = newValue!;
                      });
                    },
                    items: ['Ativo', 'Inativo'].map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                  ),
                  // Campo para Senha
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    setState(() {
                      users.add({
                        'name': nameController.text,
                        'email': emailController.text,
                        'role': _role,
                        'status': _status,
                        'password': passwordController.text,
                        'photo': users.isEmpty ? null : users[users.length - 1]['photo'],
                      });
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Usuário adicionado')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Por favor, preencha todos os campos')));
                  }
                },
                child: Text('Adicionar'),
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

  // Função para remover um usuário
  void _removeUser(int index) {
    setState(() {
      users.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Usuário removido')));
  }
  void _editUser(int index) {
    TextEditingController nameController = TextEditingController(text: users[index]['name']);
    TextEditingController emailController = TextEditingController(text: users[index]['email']);
    TextEditingController passwordController = TextEditingController(text: users[index]['password']);
    String currentStatus = users[index]['status'];
    String currentRole = users[index]['role'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Usuário'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        users[index]['photo'] = pickedFile.path;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: users.isEmpty || users[index]['photo'] == null
                        ? AssetImage('assets/imagens/default_profile.png') as ImageProvider<Object>
                        : FileImage(File(users[index]['photo']!)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                DropdownButtonFormField<String>(
                  value: _role,  // Aqui é o valor selecionado
                  decoration: InputDecoration(labelText: 'Função'),
                  onChanged: (newValue) {
                    setState(() {
                      _role = newValue!;
                    });
                  },
                  items: roles.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,  // Certifique-se de que o valor corresponde exatamente ao valor
                      child: Text(role),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<String>(
                  value: currentStatus.isEmpty ? null : currentStatus, // Verifica se o valor é vazio
                  decoration: InputDecoration(labelText: 'Status'),
                  onChanged: (newValue) {
                    setState(() {
                      currentStatus = newValue!;
                    });
                  },
                  items: ['Ativo', 'Inativo'].map((status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  users[index]['name'] = nameController.text;
                  users[index]['email'] = emailController.text;
                  users[index]['role'] = currentRole;
                  users[index]['status'] = currentStatus;
                  users[index]['password'] = passwordController.text;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Usuário atualizado')));
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
  }

  // Função para mostrar opções da usuário (excluir)
  void _deletarUsuario(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deseja Realmente Deletar este usuário?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _removeUser(index);
                });
                Navigator.pop(context); // Fechar o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuário excluída com sucesso!')),
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
  void _detalhesUsuario(BuildContext context, int index) {
    // Exibir detalhes do Usuario
  }

}
