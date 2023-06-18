import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestedPlayersPage extends StatefulWidget {
  @override
  _TestedPlayersPageState createState() => _TestedPlayersPageState();
}

class _TestedPlayersPageState extends State<TestedPlayersPage> {
  TextEditingController _competitionController = TextEditingController();
  List<dynamic> _playersList = [];

  Future<void> fetchTestedPlayers(String competition) async {
    final response = await http.get(Uri.parse('http://localhost:3000/tested-players/$competition'));

    if (response.statusCode == 200) {
      setState(() {
        _playersList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch tested players');
    }
  }

  @override
  void dispose() {
    _competitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tested Players'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _competitionController,
              decoration: InputDecoration(
                labelText: 'Competition',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String competition = _competitionController.text;
                fetchTestedPlayers(competition);
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _playersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_playersList[index]['nome_jogador']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Clinic: ${_playersList[index]['nome_clinica']}'),
                        Text('Professional: ${_playersList[index]['nome_profissional']}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
