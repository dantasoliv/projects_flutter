// Widget TodoListItem

import 'package:flutter/material.dart'; // Importando a biblioteca Material
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tarefas/models/tarefa.dart';

//Criando um widget Stateless  
class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.tarefa});

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
    return Slidable( // Slidable - Widget com efeito de deslizar
      actionPane: const SlidableDrawerActionPane(), // Ação do widget
      secondaryActions: [ // secondaryActions - Deslizar para a esquerda
        IconSlideAction( // Exibe u m icone ao deslizar
          color:  Colors.red, // Cor do icone
          icon:  Icons.delete, // Tipo do icone
          onTap: () {}, // Função que vai ser executada ao precionar o icone
        ),
      ],
      actionExtentRatio: 0.25,
      child: Container( // Container
        decoration: BoxDecoration( // Estilo do container
          borderRadius: BorderRadius.circular(4), // Arredondamento da borda
          color: Colors.grey[200], // Cor
        ),
        padding: const EdgeInsets.all(16), // Valor do espaçamenbto interno do container
        margin: const EdgeInsets.symmetric(vertical: 2), // margin - Espaçamento externo
        // height: 60, // Alteura
        child: Column( // Column - Organiza os widgets filhos em uma coluna (horizontal)
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinhando os widgets filhos a direita
          children: [ // children - Filhos
            Text( // Widget de Texto
              DateFormat('dd/MM/yyyy - HH:mm').format(tarefa.data), // Formatando a data
              style: const TextStyle( // Estilo do texto
              ),
            ),
            Text( // Widget de texto
              tarefa.titulo, // Usando pvalor da variva titulo para preencher o texto
              style: const TextStyle( // Estlo do texto
              fontSize: 16, // Tamanho da fonte
              fontWeight: FontWeight.w600 // Peso da fonte
              ),
            )
          ],
        ),
      ),
    );
  }
}