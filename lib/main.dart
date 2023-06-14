import 'package:flutter/material.dart';
import 'package:mini_project/views/DashBoard/quantidadeJogadoresPorClube.dart';
import 'package:mini_project/views/Homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage1(),
    );
  }
}
