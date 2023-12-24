import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('Dicee', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green[900],
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int totalDices = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            leftDiceNumber = _getRandomDice(totalDices);
                          });
                        }, child: Image.asset('images/dice$leftDiceNumber.png')),
                  )
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            rightDiceNumber = _getRandomDice(totalDices);
                          });
                        }, child: Image.asset('images/dice$rightDiceNumber.png')),
                  )
              ),
            ],
          ),
          IconButton(
              onPressed: () => updateBothRandomDices(totalDices),
              iconSize: 50,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              )
          ),
        ],
      ),
    );
  }

  void updateBothRandomDices(int totalDice){
    setState(() {
      rightDiceNumber = _getRandomDice(totalDice);
      leftDiceNumber = _getRandomDice(totalDice);
    });
  }

}

int _getRandomDice(int totalDice){
  return Random().nextInt(totalDice) + 1;
}

