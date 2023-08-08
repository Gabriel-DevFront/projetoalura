import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/task.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.indigo[900],
        shadowColor: Colors.black,
        elevation: 5,
        centerTitle: true,
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
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task('Aprender Flutter', 'assets/images/dash-flutter1.png', 4),
            Task('Ler', 'assets/images/livro1.png', 2),
            Task('Trabalhar', 'assets/images/job1.jpg', 5),
            Task('Malhar', 'assets/images/muscles1.jpg', 4),
            Task('Praticar estudos', 'assets/images/estudar.jpg', 4),
            SizedBox(
              height: 80,
            )
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
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
