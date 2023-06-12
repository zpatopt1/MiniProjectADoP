import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/data/PositivePlayers.dart';
import 'package:mini_project/views/DashBoard/qauntidadepalyer.dart';
import 'package:mini_project/views/DashBoard/top10_menos_controlos_por_equIpa.dart';
import 'package:mini_project/views/DashBoard/top5_player_campship.dart';
import 'dart:convert';

import 'package:mini_project/views/PositivePlayersPage/Page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage3(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Dopagem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PositivePlayersPage(),
                  ),
                );
              },
              child: Text('Jogadores com Teste Positivo'),
            ),
          ],
        ),
      ),
    );
  }
}
