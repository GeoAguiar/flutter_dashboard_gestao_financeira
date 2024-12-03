import 'package:flutter/material.dart';
import 'package:painel_web_dashboard/telas/tela_inicial.dart';
import 'package:painel_web_dashboard/telas/usuarios/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => TelaInicial(), // Tela inicial após login bem-sucedido
      },
    );
  }
}
