import 'package:flutter/material.dart'; // Importando a biblioteca marterial

class TodoListPgage extends StatelessWidget { // Widget de toda a pagina inicial do app
  const TodoListPgage({super.key});

  @override
  Widget build(BuildContext context) { // A interface do app é construida dentre desse Widget (classe)
    return Scaffold( // Scaffold - Todo app precisa começar com esse widget
      body: Center( // Center - Centraliza todos os widgets filhos
        child: Padding( // Espaçamento interno 
          padding: const EdgeInsets.symmetric(horizontal: 16), // valor do espaçamento
          child: Row( // Organiza os widgets filhos em linha - Horizontal
            children: [
              const Expanded( // Expande os widgets filhos até o maximo permitido na tela
                child: TextField( // Campo de texto
                  decoration: InputDecoration( // Decoraão do campo de texto
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
                onPressed: () {}, // Função executada ao pressionar o botão
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
        ),
      ),
    );
  }
}