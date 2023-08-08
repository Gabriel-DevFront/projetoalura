import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'difficulty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 27, 172)),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.indigo[900],
          shadowColor: Colors.black,
          elevation: 5,
          title: Text(
            'Tarefas',
            style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey[200]),
          ),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: [
              Task(
                  'Aprender Flutter',
                  'https://miro.medium.com/v2/resize:fit:1400/1*W1aGmyVwe5kKGuyTvzdUEg.png',
                  4),
              Task(
                  'Ler',
                  'https://sejapregador.com/wp-content/uploads/2018/02/ler-a-biblia.png',
                  2),
              Task(
                  'Trabalhar',
                  'https://img.freepik.com/vetores-premium/entregador-montando-a-ilustracao-de-scooter-vermelho_9845-14.jpg?w=2000',
                  5),
              Task(
                  'Malhar',
                  'https://static.vecteezy.com/ti/vetor-gratis/p3/8222655-fisiculturismo-logo-gratis-vetor.jpg',
                  4),
              Task(
                  'Praticar estudos',
                  'https://img.freepik.com/vetores-gratis/ilustracao-do-conceito-de-aprendizagem_114360-6186.jpg?size=626&ext=jpg',
                  4),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          backgroundColor: Colors.indigo[900],
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.blue[400],
            ),
            height: 140,
          ),
          Column(
            children: [
              //Container branco principal
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Imagem
                    Container(
                      color: Colors.white,
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: GoogleFonts.openSans(
                                fontSize: 20, color: Colors.grey[800]),
                          ),
                        ),
                        Difficulty(dificultyLevel: widget.dificuldade),
                      ],
                    ),
                    Container(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue[500]),
                        ),
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });

                          print(nivel);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_drop_up_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'Up',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.blue[300],
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nível: $nivel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
