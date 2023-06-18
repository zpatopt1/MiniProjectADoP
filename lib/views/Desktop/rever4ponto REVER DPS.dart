import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompetitionTestedPlayersPage extends StatefulWidget {
  @override
  _CompetitionTestedPlayersPageState createState() => _CompetitionTestedPlayersPageState();
}

class _CompetitionTestedPlayersPageState extends State<CompetitionTestedPlayersPage> {
  List<dynamic> _competitionPlayersList = [];

  Future<void> fetchCompetitionTestedPlayers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/competition-tested-players'));

    if (response.statusCode == 200) {
      setState(() {
        _competitionPlayersList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch competition tested players');
    }
  }

  @override
  void initState() {
    fetchCompetitionTestedPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Competition Tested Players'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _competitionPlayersList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_competitionPlayersList[index]['nome_competicao']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tested Players: ${_competitionPlayersList[index]['quantidade_testados']}'),
                  Text('Positive Players: ${_competitionPlayersList[index]['quantidade_positivos']}'),
                  Text('Percentage of Positive Players: ${_competitionPlayersList[index]['percentagem_positivos'].toStringAsFixed(2)}%'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
