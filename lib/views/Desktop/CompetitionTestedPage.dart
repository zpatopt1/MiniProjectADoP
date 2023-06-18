import 'package:flutter/material.dart';

import '../../data/Desktop/CompetitionTestedAPI.dart';

class CompetitionTestedPlayersPage extends StatefulWidget {
  @override
  _CompetitionTestedPlayersPageState createState() =>
      _CompetitionTestedPlayersPageState();
}

class _CompetitionTestedPlayersPageState
    extends State<CompetitionTestedPlayersPage> {
  List<dynamic> _competitionPlayersList = [];

  @override
  void initState() {
    fetchCompetitionTestedPlayersData();
    super.initState();
  }

  Future<void> fetchCompetitionTestedPlayersData() async {
    try {
      List<dynamic> playersList =
          await CompetitionTestedPlayersApi.fetchCompetitionTestedPlayers();
      setState(() {
        _competitionPlayersList = playersList;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error state
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Competition Tested Players'),
        backgroundColor: Colors.black,
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
                  Text(
                      'Tested Players: ${_competitionPlayersList[index]['quantidade_testados']}'),
                  Text(
                      'Positive Players: ${_competitionPlayersList[index]['quantidade_positivos']}'),
                  Text(
                      'Percentage of Positive Players: ${_competitionPlayersList[index]['percentagem_positivos'].toStringAsFixed(2)}%'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
