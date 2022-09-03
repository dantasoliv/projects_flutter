import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Executando o App
}

// MyApp - Widget repossável por toda a configuração do app
class MyApp extends StatelessWidget {
  // Classe para criar widgets
  const MyApp({Key? key}) : super(key: key); // Metodo construtor

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false, // Removendo o banner de debug (lado superios direito)
        home:
            HomePage() // Instanciando a homepage do app no widget principal do app
        );
  }
}

// Criando uma classe StatefulWidget (os widgets desse tipo de classe podem ser alterados)
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home page - Widget da homepage do app
class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() { // Função para ser executada ao precionar o botão
    setState(() { // setState - Passa o estado da variavel pare o widget
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  // Criando gets para vericar o valor da variavel
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold - Posdsui varios widgets para colocar no o app
      backgroundColor: Colors.red, // Cor de fundo
      body: Container( // Container é utilizado para colocar elementos
        decoration: const BoxDecoration( // Colocando uma imagem de fundo
            image:  DecorationImage(
              image: AssetImage('assests/images/restaurante.png'), // Caminho da imagem
              fit: BoxFit.cover,
            )
        ),
        child: Column( // Column - Alinha os widgets filhos em coluna (Vertial)
          mainAxisAlignment: MainAxisAlignment.center, // Alinhando os elementos no eixo pricipal do elemento pai (vertical)
          children: [ // Lista com os elementos Filhos da coluna
             Text( // Widget de texto
              isFull ? 'Lotado!': 'Pode entrar!', // Verificando o valor da variavel isFull com operador ternario (true ou false)
              style: TextStyle( // Estilo do texto
                fontSize: 30, // Tamanho da fonte
                color: isFull ? Colors.red : Colors.white,  // Usando uma condição com operador ternario para mudar a cor da fonte do texto // Cor da fonte
                fontWeight: FontWeight.w700, // Peso da fonte
                letterSpacing: 2, // Espaçamento entre as letras
              ),
            ),
            Padding( // Padding - Coloca espaçamento externo nos elementos que estão dentro dele
              padding: const EdgeInsets.all(40), // Colocando valor de espaçamento interno em todos os lados
              child: Text(
                '$count', // Exibindo o valor de uma variavel no widget de texto
                style: TextStyle(
                    fontSize:  100,
                    color: isFull ? Colors.red : Colors.white), // Usando uma condição com operador ternario para mudar a cor da fonte do texto
              ),
            ),
            Row( // Row - Alinha o elementos em linha (horizontal)
              mainAxisAlignment: MainAxisAlignment.center, // Alinhando os elementos no eixo pricipal do elemento pai (horizntal)
              children: [
                TextButton( // Widget de botão
                  onPressed: isEmpty ? null : decrement, // Função que sera executado ao precionar o botão
                  style: TextButton.styleFrom( // Estilo do botão
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white, // Cor de fundo do botão
                    //padding: const EdgeInsets.all(32) // Espaçamento interno bo boão em todos os lados
                    fixedSize: const Size(100, 100), // Espaçamento interno fixo do botão
                    primary: Colors.black, // Cor botão ao ser pressionado
                    shape:  RoundedRectangleBorder( // Estilo da borda do botão
                        borderRadius: BorderRadius.circular(24) // Borda circular
                    ),
                  ),
                  child: const Text('Saiu', // Texto do botão
                    style: TextStyle( // Estilo do texto do botão
                      color:  Colors.black, // Cor do texto do botão
                      fontSize: 16, // Tamanho da fonte do botão
                    ),), // Texto do botão
                ),
                const SizedBox(width: 32), // Espaço vazia entre widgets
                TextButton( // Widget de botão
                  onPressed: isFull ? null : increment, // Função que sera executado ao precionar o botão
                  style: TextButton.styleFrom( // Estilo do botão
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white, // Cor de fundo do botão
                    //padding: const EdgeInsets.all(32) // Espaçamento interno bo boão em todos os lados
                    fixedSize: const Size(100, 100), // Espaçamento interno fixo do botão
                    primary: Colors.black, // Cor botão ao ser pressionado
                    shape:  RoundedRectangleBorder( // Estilo da borda do botão
                        borderRadius: BorderRadius.circular(24) // Borda circular
                    ),
                  ),
                  child: const Text('Entrou',
                    style: TextStyle(
                      color:  Colors.black,
                      fontSize: 16,
                    ),), // Texto do botão
                )
              ],
            ),
          ],
        ),

      ),
    );
  }
}

