
import 'package:flutter/material.dart'; // Importando a biblioteca marterial
import 'package:lista_de_tarefas/pages/todo_list_page.dart'; // Importando a pagina inicial do app

void main() { // Função inicial
  runApp(const MyApp()); // runApp() - Éssa função responsável por executar o app
}

class MyApp extends StatelessWidget { // Classe inicial para executar o app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp - possui varios parametros para criar o app
    debugShowCheckedModeBanner: false, // Removendo o banner de debug (lado superios direito)
      home: TodoListPgage(), // home - Inicia a tela inicial do app
    );
  }
}