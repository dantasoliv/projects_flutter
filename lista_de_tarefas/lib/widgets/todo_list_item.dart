// Widget TodoListItem

import 'package:flutter/material.dart'; // Importando a biblioteca Material

//Criando um widget Stateless  
class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.titulo});

  final String titulo; // variavel que vai receber o titulo da tarefa no construtar da classe do widget

  @override
  Widget build(BuildContext context) {
    return Container( // Container
      decoration: BoxDecoration( // Estilo do container
        borderRadius: BorderRadius.circular(4), // Arredondamento da borda
        color: Colors.grey[200], // Cor
      ),
      padding: const EdgeInsets.all(16), // Valor do espaçamenbto interno do container
      margin: const EdgeInsets.symmetric(vertical: 2), // margin - Espaçamento externo
      // height: 60, // Alteura
      child: Column( // Column - Organiza os widgets filhos em uma coluna (horizontal)
        crossAxisAlignment: CrossAxisAlignment.start, // Alinhando os widgets filhos a direita
        children: [ // children - Filhos
          const Text( // Widget de Texto
            '20/11/2020', // Texto
            style: TextStyle( // Estilo do texto
            ),
            ),
          Text( // Widget de texto
            titulo, // Usando pvalor da variva titulo para preencher o texto
            style: const TextStyle( // Estlo do texto
              fontSize: 16, // Tamanho da fonte
              fontWeight: FontWeight.w600 // Peso da fonte
            ),
            )
        ],
      ),
    );
  }
}