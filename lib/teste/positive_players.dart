import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PositivePlayersPage extends StatefulWidget {
  @override
  _PositivePlayersPageState createState() => _PositivePlayersPageState();
}

class _PositivePlayersPageState extends State<PositivePlayersPage> {
  List<dynamic> positivePlayers = [];

  @override
  void initState() {
    super.initState();
    fetchPositivePlayers();
  }

  Future<void> fetchPositivePlayers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/positive-players'));
    if (response.statusCode == 200) {
      setState(() {
        positivePlayers = jsonDecode(response.body);
      });
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
      ),
      body: ListView.builder(
        itemCount: positivePlayers.length,
        itemBuilder: (context, index) {
          final player = positivePlayers[index];
          return ListTile(
            title: Text(player['nome_jogador']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Clube: ${player['nome_clube']}'),
                Text('Equipa: ${player['nome_equipa']}'),
                Text('Data da colheita: ${player['data_colheita']}'),
                Text('Data do teste: ${player['data_teste']}'),
                Text('Laboratório de testagem: ${player['laboratorio']}'),
                Text('Substância: ${player['substancia_positiva']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}