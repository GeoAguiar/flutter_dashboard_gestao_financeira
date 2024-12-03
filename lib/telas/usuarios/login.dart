import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variável para mostrar a mensagem de erro
  String _errorMessage = '';

  // Função de login (simulação, você pode adicionar a autenticação real aqui)
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Verificando se os campos estão vazios (simulação de autenticação)
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, preencha todos os campos.';
      });
    } else {
      // Aqui você pode adicionar sua lógica de autenticação real
      if (email == 'teste@exemplo.com' && password == '1234') {
        // Redirecionar ou fazer algo após login bem-sucedido
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _errorMessage = 'E-mail ou senha inválidos.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = "teste@exemplo.com";
    _passwordController.text = "1234";
    return Scaffold(
      backgroundColor: Colors.blue.shade50, // Cor de fundo mais suave
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue, // Cor de fundo do appBar
        elevation: 0,
      ),
      body: Center( // Centraliza o conteúdo da tela
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimiza o tamanho da coluna
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os itens
            children: <Widget>[
              // Adicionando logo acima dos campos
              Image.asset(
                'assets/imagens/logo.png', // Substitua pelo caminho correto da sua logo
                width: 150,
                height: 150,
              ),
              SizedBox(height: 40), // Espaço entre a logo e os campos de entrada
              // Container para limitar a largura dos campos
              Container(
                width: double.infinity, // Ocupa a largura disponível até o limite
                constraints: BoxConstraints(maxWidth: 450), // Largura máxima dos campos
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 450), // Largura máxima dos campos
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400), // Largura máxima do botão
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Cor do botão
                    minimumSize: Size(double.infinity, 50), // Botão ocupa toda a largura disponível
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
