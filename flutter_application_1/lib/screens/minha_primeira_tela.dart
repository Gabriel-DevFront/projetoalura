import 'package:flutter/material.dart';

class MyFirstWidet extends StatelessWidget {
  const MyFirstWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.cyan,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.pinkAccent,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.purple,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Diamante Amarelo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Aperte o Botão'),
          )
        ],
      ),
    );
  }
}
