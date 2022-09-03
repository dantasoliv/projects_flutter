import 'package:flutter/material.dart'; // Importando a biblioteca marterial

class TodoListPgage extends StatefulWidget { // Widget de toda a pagina inicial do app
  TodoListPgage({super.key});

  @override
  State<TodoListPgage> createState() => _TodoListPgageState();
}

class _TodoListPgageState extends State<TodoListPgage> {

  final TextEditingController todoController = TextEditingController();  // Controlador de captura de texto digitado no campo de texto (TextField)

  List<String> todos = [];  // Lista que vai recebaer as tarefas

  @override
  Widget build(BuildContext context) { // A interface do app é construida dentre desse Widget (classe)
    return Scaffold( // Scaffold - Todo app precisa começar com esse widget
      body: Center( // Center - Centraliza todos os widgets filhos
        child: Padding( // Espaçamento interno 
          padding: const EdgeInsets.symmetric(horizontal: 16), // valor do espaçamento
          child: Column( // Collumn - Orgniza os widgets filhos em uma coluna - Vertical
            mainAxisSize: MainAxisSize.min, // define o tamanho da coluna para a alrura minima
            children: [
              Row( // Organiza os widgets filhos em linha - Horizontal
                children: [
                   Expanded( // Expande os widgets filhos até o maximo permitido na tela
                    child: TextField( // Campo de texto
                      controller: todoController, // Chamando o controle de de captura de texto para capturar o texto digitado
                      decoration: const InputDecoration( // Decoraão do campo de texto
                        border:  OutlineInputBorder(), // estilo da borda do campo de texto
                        labelText: 'Adicione uma tarefa', // Titulo do campo de texto
                        hintText: 'Ex: Estudar', // Texto de exempo do campo de texto
                      ),
                    )
                  ),
                  const SizedBox( // Espaço vazio
                    width: 8, // largura do espaço
                  ),
                  ElevatedButton( // Botão
                    onPressed: () { // Função executada ao pressionar o botão
                      String text = todoController.text; // capturando o texto digitado no TextField com o controler
                      setState(() { // setState - Atualiza o valor da lista ou variael
                        todos.add(text); // Adicinando o texto capturado em uma lista
                      });
                      todoController.clear();
                    }, 
                    style: ElevatedButton.styleFrom( // estilo do botão
                      primary: const Color(0xff00d7f3), // Cor do botão em hexadecimal
                      padding: const EdgeInsets.all(14) // Espaçamento interno do botão
                    ),
                    child: const Icon( // Icone
                      Icons.add, // Tipo de icone
                      size: 30, // Tamanho do icone
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),  // Espaço vazio
              Flexible( // Flexible - Limita a expanção do widget filho para não passar do limite maximo
                child: ListView( // ListView - Lista de itens
                  shrinkWrap: true, // Expande  a ListView até a altura maxima possivel
                  children: [ // Filhos da ListView
                    for(String todo in todos) // usando o for para prencher a ListView com itens com forme a lista for sendo acresentada
                      ListTile( // Item da lista
                        title: Text('Tarefa: $todo'), // Titulo do item da lista
                        subtitle: const Text('20/11/2020'), // Subtitulo
                        leading: const Icon(Icons.save, size: 30,), // Icone do lado esquerdo do item da lista
                        onTap: () { // onTap - Executa uma função ao clikar no widget
                          print('Tarefa: $todo');
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Espaço vazio 
              Row( // Row - Organiza os widgets filhos em uma linha - Horizontal
                children: [
                  const Expanded( // Expanded - Expande os widgets filhos até o maximo permitido na tela
                    child: Text( // Texto
                      'Você possui 0 tarefas pendentes',
                    ),
                  ),
                  const SizedBox(width: 8), // Espaço vazio
                  ElevatedButton( // Botão
                    onPressed: () {}, // Função executada ao pressionar o botão
                    style: ElevatedButton.styleFrom( // Estilo do botão
                      primary: const Color(0xff00d7f3), // Cor do botão
                      padding: const EdgeInsets.all(14), // Espaçamento interno do botão
                    ),
                    child: const Text('Limpar tudo'), // Texto do botão 
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}