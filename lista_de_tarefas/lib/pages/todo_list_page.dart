import 'package:flutter/material.dart'; // Importando a biblioteca marterial

class TodoListPgage extends StatelessWidget { // Widget de toda a pagina inicial do app
  const TodoListPgage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold( // Scaffold - Todo app precisa começar com esse widget
      body: Center( // Center - Centraliza os widgets filhos // body - Corpo do widget
        child: Padding( // Padding - Espaçamento interno 
          padding: EdgeInsets.all(16), //  Valor do espaçamento em todos os lados
          child: TextField( // TextField() Campo de texto
            decoration: InputDecoration( // Decorasção do campo de texto
              labelText: 'E-mail', // Titulo do campo de texto
              labelStyle: TextStyle( // Estilo do texto da labelText
                fontSize: 20, // Tamho da font
              ),
              hintText: 'exemplo@exemplo.com', // mensagem de exemplo para o usuario digitar
              hintStyle: TextStyle( // Estilo do texto de exemlpo
                color: Colors.black45, // Cor do texto
              ),
              //border: OutlineInputBorder(), // Borda do campo de texto
              //border: InputBorder.none, // Borda sem borda
              prefixText: 'R\$ ', // prefixText - É utilizado para colicar um texto fixo na esquerda
              suffixText: 'cm', // suffixText É utilizado para colicar um texto fixo na direita
            ) ,
            // obscureText: true, - obscureText - É utilizado para digitar senhas
            //keyboardType: TextInputType.number, // Campo apenas de numeros
            style: TextStyle( // Estilo  do texto digitado no campo
              fontSize:  20, // Tamanho da fonte
              fontWeight: FontWeight.w700, //  Peso da fonte
              color:  Colors.red,
            ),
          ), 
        ), 
        ), 
    );
  }
}