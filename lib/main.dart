import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destroy the CandyCorn',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Destroy the CandyCorn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List visibility = [
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    false,
    true,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 167, 142, 142),
        appBar: AppBar(
          title: Text(youwin()),
          backgroundColor: Color.fromARGB(255, 78, 92, 170),
        ),
        body: Container(
            child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(color: Colors.black),
            verticalInside: BorderSide(color: Colors.black),
          ),
          children: <TableRow>[
            TableRow(children: <Widget>[
              randomVisibility(0),
              randomVisibility(1),
              randomVisibility(2),
              randomVisibility(3),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(4),
              randomVisibility(5),
              randomVisibility(6),
              randomVisibility(7),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(8),
              randomVisibility(9),
              randomVisibility(10),
              randomVisibility(11),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(12),
              randomVisibility(13),
              randomVisibility(14),
              randomVisibility(15),
            ]),
          ],
        )));
  }

  Widget randomVisibility(int place) {
    Random ran = Random();
    return GestureDetector(
        onTap: () {
          setState(() {
            if (visibility[place] == true) {
              int random = ran.nextInt(16);
              while (visibility[random] != false) {
                random = ran.nextInt(16);
              }
              _counter += 2;
              visibility[place] = false;
              visibility[random] = true;
            }
          });
        },
        child: Visibility(
            visible: visibility[place],
            child: Image.asset('assets/cc.jpg',
                height: 240, fit: BoxFit.fitWidth)));
  }

  String youwin() {
    while (_counter <= 30) {
      return ("Welcome to the Halloween CandyWhack App, Whack a CandyCorn to Increase your Score! Your current score is $_counter");
    }
    return ("you win! thanks for playing!");
  }
}
