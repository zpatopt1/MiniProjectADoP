import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/teste/positive_players.dart';
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
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
