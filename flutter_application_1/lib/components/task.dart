import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'difficulty.dart';

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
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
                      child: Image.asset(
                        widget.foto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
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
                  SizedBox(
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
                      },
                      child: const Column(
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
                  child: SizedBox(
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
                    style: const TextStyle(
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
    );
  }
}
