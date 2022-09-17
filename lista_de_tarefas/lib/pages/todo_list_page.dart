import 'package:flutter/material.dart'; // Importando a biblioteca marterial
import 'package:lista_de_tarefas/widgets/todo_list_item.dart'; // Importo um widiget criado
import 'package:lista_de_tarefas/models/tarefa.dart';

class TodoListPgage extends StatefulWidget { // Widget de toda a pagina inicial do app
  TodoListPgage({super.key});

  @override
  State<TodoListPgage> createState() => _TodoListPgageState();
}

class _TodoListPgageState extends State<TodoListPgage> {

  final TextEditingController todoController = TextEditingController();  // Controlador de captura de texto digitado no campo de texto (TextField)

  List<Tarefa> todos = [];  // Lista que vai recebaer as tarefas
  Tarefa? deletedTodo; // Variavel que vai receber as tarefas deletadas 
  int? deletedTodoPost; // variavel que vai receber posição na lista do item deletado

  @override
  Widget build(BuildContext context) { // A interface do app é construida dentre desse Widget (classe)
    return SafeArea( // SafeArea - Mantém os widgets filhos dentro da aera segura da tela do celular
      child: Scaffold( // Scaffold - Todo app precisa começar com esse widget
        body: Center( // Center - Centraliza todos os widgets filhos
          child: Padding( // Espaçamento interno 
            padding: const EdgeInsets.all(16), // valor do espaçamento em todos os lados
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
                          Tarefa novatarefa = Tarefa(
                            titulo: text, 
                            data: DateTime.now(),
                            );
                          todos.add(novatarefa); // Adicinando o texto capturado em uma lista
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
                      for(Tarefa todo in todos) // usando o for para prencher a ListView com itens com forme a lista for sendo acresentada
                         TodoListItem( // usando o widget criado
                          tarefa: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // Espaço vazio 
                Row( // Row - Organiza os widgets filhos em uma linha - Horizontal
                  children: [
                    Expanded( // Expanded - Expande os widgets filhos até o maximo permitido na tela
                      child: Text( // Texto
                        'Você possui ${todos.length} tarefas pendentes',
                      ),
                    ),
                    const SizedBox(width: 8), // Espaço vazio
                    ElevatedButton( // Botão
                      onPressed: showdeleteTodosConfirmationDialog, // Função executada ao pressionar o botão
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
      ),
    );
  }

  void  onDelete(Tarefa tarefa) { // Função  para deletar uma tarefa

    deletedTodo = tarefa; // Armazenando a Tarefa na variavel
    deletedTodoPost = todos.indexOf(tarefa); // Armazeando a possição da tarefa na lista de tarefas

    setState(() { // setState - Atualiza a tela
      todos.remove(tarefa); // Removendo uma tarefa da lista
    });

    ScaffoldMessenger.of(context).clearSnackBars(); // Limpar as mensagens na parte inferior da tela
    ScaffoldMessenger.of(context).showSnackBar( // Mostra uma mensagem na perte inferior da tela
      SnackBar(
        content: Text( 'Tarefa ${tarefa.titulo} foi removida com sucesso', // Texto
          style: const TextStyle(
            color: Color(0xff060708), // Cor do texto
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction( // Ação que executa uma função ao ser precionada
          label: 'Desfazer', // Texto da acão
          textColor: const Color(0xff00d7f3),
          onPressed: () { // Função que vai ser executado ao precionar o texto
            setState(() { // setState - Atualiza a tela
              todos.insert(deletedTodoPost!, deletedTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 5), // Duração do tempo em que a mensagem sera exibida na tela
      ),
    );

  }

  void showdeleteTodosConfirmationDialog() { // Função exibir em popup de alerta e deletar todas as taefas da lista
    showDialog( // exibir um popup de alerta
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Limpar tudo?'), // Texto do titulo exibido no popup de alerta
        content: const Text('Você tem certeza que deseja apagar todas as tarefas?'), // Texto do contaudo do popup
        actions: [ // Ações do popup de alerta
          TextButton( // Botão
            onPressed: () { // Função que vai ser executada o precionar o botão
              Navigator.of(context).pop(); // Fecha o p o popup
            },
            style: TextButton.styleFrom(primary: const Color(0xff00d7f3)),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o p o popup
              deleteAllTodos();
            }, 
            style: TextButton.styleFrom(primary: Colors.red),
            child: const Text('Limpar Tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() { // setState - Atualizando a tela do app 
      todos.clear(); // Limpando toda a lista de tarefas
    });
  }

}